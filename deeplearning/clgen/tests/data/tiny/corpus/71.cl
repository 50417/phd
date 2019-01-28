typedef struct {
  float4 m_from;
  float4 m_to;
} b3RayInfo;

typedef struct {
  float m_hitFraction;
  int m_hitResult0;
  int m_hitResult1;
  int m_hitResult2;
  float4 m_hitPoint;
  float4 m_hitNormal;
} b3RayHit;

typedef struct {
  float4 m_pos;
  float4 m_quat;
  float4 m_linVel;
  float4 m_angVel;

  unsigned int m_collidableIdx;
  float m_invMass;
  float m_restituitionCoeff;
  float m_frictionCoeff;
} Body;

typedef struct Collidable {
  union {
    int m_numChildShapes;
    int m_bvhIndex;
  };
  float m_radius;
  int m_shapeType;
  int m_shapeIndex;
} Collidable;

typedef struct {
  float4 m_localCenter;
  float4 m_extents;
  float4 mC;
  float4 mE;

  float m_radius;
  int m_faceOffset;
  int m_numFaces;
  int m_numVertices;

  int m_vertexOffset;
  int m_uniqueEdgesOffset;
  int m_numUniqueEdges;
  int m_unused;

} ConvexPolyhedronCL;

typedef struct {
  float4 m_plane;
  int m_indexOffset;
  int m_numIndices;
} b3GpuFace;

typedef float4 Quaternion;

__inline Quaternion A(Quaternion a, Quaternion b);

__inline Quaternion B(Quaternion c);

__inline Quaternion C(Quaternion d);

__inline float D(float4 a, float4 b) {
  float4 e = (float4)(a.xyz, 0.f);
  float4 f = (float4)(b.xyz, 0.f);
  return dot(e, f);
}

__inline Quaternion A(Quaternion a, Quaternion b) {
  Quaternion g;
  g = cross(a, b);
  g += a.w * b + b.w * a;

  g.w = a.w * b.w - D(a, b);
  return g;
}

__inline Quaternion B(Quaternion c) {
  return fast_normalize(c);
}
__inline float4 E(Quaternion d, float4 h) {
  Quaternion i = C(d);
  float4 j = h;
  j.w = 0.f;
  float4 k = A(d, j);
  k = A(k, i);
  return k;
}

__inline Quaternion C(Quaternion d) {
  return (Quaternion)(-d.xyz, d.w);
}

__inline float4 F(const Quaternion d, float4 h) {
  return E(C(d), h);
}

void G(float4 l, Quaternion m, float4* n, Quaternion* o) {
  *o = C(m);
  *n = E(*o, -l);
}

bool H(float4 p, float4 q, int r, int s, __global const b3GpuFace* t, float* u, float4* v) {
  p.w = 0.f;
  q.w = 0.f;
  bool w = true;

  float x = u[0];
  float y = -0.3f;
  float4 z = (float4)(0, 0, 0, 0);
  for (int aa = 0; aa < r && w; aa++) {
    b3GpuFace ab = t[s + aa];
    float ac = dot(p, ab.m_plane) + ab.m_plane.w;
    float ad = dot(q, ab.m_plane) + ab.m_plane.w;
    if (ac < 0.f) {
      if (ad >= 0.f) {
        float ae = ac / (ac - ad);
        if (x > ae) {
          x = ae;
        }
      }
    } else {
      if (ad < 0.f) {
        float ae = ac / (ac - ad);
        if (y <= ae) {
          y = ae;
          z = ab.m_plane;
          z.w = 0.f;
        }
      } else {
        w = false;
      }
    }
    if (x <= y)
      w = false;
  }

  if (y < 0.f) {
    w = false;
  }

  if (w) {
    u[0] = y;
    v[0] = z;
  }
  return w;
}

bool I(float4 af, float ag, float4 ah, float4 ai, float* u) {
  float4 aj = ah - af;
  aj.w = 0.f;
  float4 ak = ai - ah;
  ak.w = 0.f;
  float al = dot(ak, ak);
  float am = dot(aj, ak);
  float an = dot(aj, aj) - (ag * ag);

  float ao = am * am - al * an;

  if (ao > 0.0f) {
    float ap = (-am - sqrt(ao)) / al;

    if ((ap >= 0.0f) && (ap < (*u))) {
      *u = ap;
      return true;
    }
  }
  return false;
}

float4 J(float4 aq, float4 ar, float ap) {
  float as = 1.0f - ap;
  float4 w;
  w = as * aq + ap * ar;
  w.w = 0.f;
  return w;
}

__kernel void K(int at, const __global b3RayInfo* au, __global b3RayHit* av, const int aw, __global Body* ax, __global Collidable* ay, __global const b3GpuFace* t, __global const ConvexPolyhedronCL* az) {
  int aa = get_global_id(0);
  if (aa >= at)
    return;

  av[aa].m_hitFraction = 1.f;

  float4 ah = au[aa].m_from;
  float4 ai = au[aa].m_to;
  float u = 1.f;
  float4 ba;
  float4 v;
  int bb = -1;

  int bc = -1;
  Collidable bd;

  for (int b = 0; b < aw; b++) {
    if (av[aa].m_hitResult2 == b)
      continue;
    Body be = ax[b];
    float4 bf = be.m_pos;
    float4 bg = be.m_quat;
    if (bc != be.m_collidableIdx) {
      bc = be.m_collidableIdx;
      bd = ay[bc];
    }
    if (bd.m_shapeType == 3) {
      float4 bh = (float4)(0, 0, 0, 0);
      float4 bi = (float4)(0, 0, 0, 0);
      float4 p = (float4)(0, 0, 0, 0);
      float4 q = (float4)(0, 0, 0, 0);
      bi = C(bg);
      bh = E(bi, -bf);
      p = E(bi, ah) + bh;
      q = E(bi, ai) + bh;
      p.w = 0.f;
      q.w = 0.f;
      int r = az[bd.m_shapeIndex].m_numFaces;
      int s = az[bd.m_shapeIndex].m_faceOffset;
      if (r) {
        if (H(p, q, r, s, t, &u, &v)) {
          bb = b;
        }
      }
    }
    if (bd.m_shapeType == 7) {
      float ag = bd.m_radius;

      if (I(bf, ag, ah, ai, &u)) {
        bb = b;
        v = (float4)(ba - ax[b].m_pos);
      }
    }
  }

  if (bb >= 0) {
    ba = J(ah, ai, u);
    av[aa].m_hitFraction = u;
    av[aa].m_hitPoint = ba;
    av[aa].m_hitNormal = normalize(v);
    av[aa].m_hitResult0 = bb;
  }
}

__kernel void L(__global int2* bj, __global int* bk, __global int* bl, int bm) {
  int bn = get_global_id(0);
  if (bn >= bm)
    return;

  int bo = bj[bn].x;

  atomic_min(&bk[bo], bn);
  atomic_add(&bl[bo], 1);
}

__kernel void M(const __global b3RayInfo* au, __global b3RayHit* av, __global int* bp, __global int* bq,

                __global Body* ax, __global Collidable* ay, __global const b3GpuFace* t, __global const ConvexPolyhedronCL* az,

                __global int2* bj, int at) {
  int aa = get_global_id(0);
  if (aa >= at)
    return;

  float4 ah = au[aa].m_from;
  float4 ai = au[aa].m_to;

  av[aa].m_hitFraction = 1.f;

  float u = 1.f;
  float4 ba;
  float4 v;
  int bb = -1;

  for (int br = 0; br < bq[aa]; ++br) {
    int bn = br + bp[aa];
    int b = bj[bn].y;

    if (av[aa].m_hitResult2 == b)
      continue;

    Body be = ax[b];
    Collidable bs = ay[be.m_collidableIdx];

    float4 bf = be.m_pos;
    float4 bg = be.m_quat;

    if (bs.m_shapeType == 3) {
      float4 bh = (float4)(0, 0, 0, 0);
      float4 bi = (float4)(0, 0, 0, 0);
      float4 p = (float4)(0, 0, 0, 0);
      float4 q = (float4)(0, 0, 0, 0);
      bi = C(bg);
      bh = E(bi, -bf);
      p = E(bi, ah) + bh;
      q = E(bi, ai) + bh;
      p.w = 0.f;
      q.w = 0.f;
      int r = az[bs.m_shapeIndex].m_numFaces;
      int s = az[bs.m_shapeIndex].m_faceOffset;

      if (r && H(p, q, r, s, t, &u, &v)) {
        bb = b;
        ba = J(ah, ai, u);
      }
    }

    if (bs.m_shapeType == 7) {
      float ag = bs.m_radius;

      if (I(bf, ag, ah, ai, &u)) {
        bb = b;
        ba = J(ah, ai, u);
        v = (float4)(ba - ax[b].m_pos);
      }
    }
  }

  if (bb >= 0) {
    av[aa].m_hitFraction = u;
    av[aa].m_hitPoint = ba;
    av[aa].m_hitNormal = normalize(v);
    av[aa].m_hitResult0 = bb;
  }
}