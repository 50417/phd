typedef struct b2clContactFeature {
  uchar indexA;
  uchar indexB;
  uchar typeA;
  uchar typeB;
} b2clContactFeature;

typedef union b2clContactID {
  b2clContactFeature cf;
  uint key;
} b2clContactID;
typedef struct b2clManifoldPoint {
  float2 localPoint;
  float normalImpulse;
  float tangentImpulse;
  b2clContactID id;
  float dummy;
} b2clManifoldPoint;
typedef struct b2clManifold {
  float2 localNormal;
  float2 localPoint;
  b2clManifoldPoint points[2];
  int type;
  int pointCount;

} b2clManifold;

typedef struct b2clFilter {
  unsigned short categoryBits;
  unsigned short maskBits;
  short groupIndex;
  short dummy;
} b2clFilter;
typedef struct b2clPolygonShape {
  float2 m_centroid;
  float2 m_vertices[8];
  float2 m_normals[8];
  int m_type;
  float m_radius;
  int m_vertexCount;
  int m_bIsSensor;
  b2clFilter m_filter;
} b2clPolygonShape;

typedef struct b2clTransform {
  float2 p;
  float2 q;
} b2clTransform;

typedef struct b2clSweep {
  float2 localCenter;
  float2 c0, c;
  float a0, a;

  float alpha0;
  float dummy;
} b2clSweep;

typedef struct b2clClipVertex {
  float2 v;
  b2clContactID id;
} b2clClipVertex;

typedef struct clb2Velocity {
  float vx;
  float vy;
  float w;
} clb2Velocity;

typedef struct clb2Position {
  float cx;
  float cy;
  float a;
} clb2Position;

typedef struct clb2Contact {
  int color;
  int indexA;
  int indexB;
  float friction;
  float2 normal;
  float invMassA;
  float invIA;
  float invMassB;
  float invIB;
} clb2Contact;

typedef struct clb2Impulse {
  float normalImpulse1;
  float tangentImpulse1;

  float normalImpulse2;
  float tangentImpulse2;
} clb2Impulse;

typedef struct clb2Points {
  float2 rA1;
  float2 rB1;
  float normalMass1;
  float tangentMass1;

  float2 rA2;
  float2 rB2;
  float normalMass2;
  float tangentMass2;

  float velocityBias1;
  float velocityBias2;
} clb2Points;

typedef struct b2clFixtureStatic {
  float m_friction;
  float m_restitution;
  int m_last_uid;
  int dummy;
} b2clFixtureStatic;

typedef struct b2clBodyStatic {
  float2 m_localCenter;
  float m_invMass;

  float m_invI;
  float m_linearDamping;
  float m_angularDamping;
  float m_gravityScale;
  float m_type;
  int m_connectedBodyIndices[8];
  int m_bIsBullet;
  int dummy;
} b2clBodyStatic;

typedef struct b2clBodyDynamic {
  b2clSweep m_sweep;

  float2 m_linearVelocity;
  float2 m_force;
  float m_angularVelocity;
  float m_torque;
  int m_last_uid;
  int dummy;
} b2clBodyDynamic;

typedef struct clb2Manifold {
  float2 localNormal;
  float2 localPoint;
  float2 localPoints1;
  float2 localPoints2;
  int pointCount;
  int type;
  float radiusA;
  float radiusB;
  float2 localCenterA;
  float2 localCenterB;
} clb2Manifold;

typedef struct {
  int type;
  int pointCount;
  float localPointX;
  float localPointY;
  float localNormalX;
  float localNormalY;
  float point0X;
  float point0Y;
  float point1X;
  float point1Y;
} clb2SDManifold;

typedef struct {
  int fixtureAIndex;
  int fixtureBIndex;
  int bodyAIndex;
  int bodyBIndex;
} clb2SDContact;

typedef struct {
  int bodyIndex;
  float posX;
  float posY;
  float posAngle;
  float xfX;
  float xfY;
  float xfS;
  float xfC;
  float alpha;
  float velocityX;
  float velocityY;
  float velocityAngular;
} clb2SDBody;

typedef struct clb2PositionSolverManifold {
  float2 normal;
  float2 point;
  float separation;
} clb2PositionSolverManifold;

typedef struct clb2Rotation {
  float s;
  float c;
} clb2Rotation;

typedef struct clb2Transform {
  clb2Rotation rotation;
  float2 translation;
} clb2Transform;

typedef struct b2clMat22 {
  float ex[2];
  float ey[2];
} b2clMat22;

typedef struct b2clMat33 {
  float ex[3];
  float ey[3];
  float ez[3];
} b2clMat33;

enum b2clLimitState { e_inactiveLimit, e_atLowerLimit, e_atUpperLimit, e_equalLimits };

enum b2JointType { e_unknownJoint, e_revoluteJoint, e_prismaticJoint, e_distanceJoint, e_pulleyJoint, e_mouseJoint, e_gearJoint, e_wheelJoint, e_weldJoint, e_frictionJoint, e_ropeJoint };

typedef struct b2clDistanceJointDatastruct {
  float frequencyHz;
  float dampingRatio;
  float bias;

  float localAnchorA[2];
  float localAnchorB[2];
  float gamma;
  float nlength;

  float u[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
} b2clDistanceJointData;

typedef struct b2clRevoluteJointData {
  float localAnchorA[2];
  float localAnchorB[2];

  int enableMotor;
  float maxMotorTorque;
  float motorSpeed;

  int enableLimit;
  float referenceAngle;
  float lowerAngle;
  float upperAngle;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat33 mass;
  float motorMass;
  int limitState;
} b2clRevoluteJointData;

typedef struct b2clPrismaticJointData {
  float localAnchorA[2];
  float localAnchorB[2];
  float localXAxisA[2];
  float localYAxisA[2];
  float referenceAngle;
  float lowerTranslation;
  float upperTranslation;
  float maxMotorForce;
  float motorSpeed;
  int enableLimit;
  int enableMotor;
  int limitState;

  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float axis[2], perp[2];
  float s1, s2;
  float a1, a2;
  b2clMat33 K;
  float motorMass;
} b2clPrismaticJointData;

typedef struct b2clGearJointData {
  int joint1;
  int joint2;
  int typeA;
  int typeB;

  float localAnchorA[2];
  float localAnchorB[2];
  float localAnchorC[2];
  float localAnchorD[2];

  float localAxisC[2];
  float localAxisD[2];

  float referenceAngleA;
  float referenceAngleB;

  float gearConstant;
  float ratio;

  float lcA[2], lcB[2], lcC[2], lcD[2];
  float mA, mB, mC, mD;
  float iA, iB, iC, iD;
  float JvAC[2], JvBD[2];
  float JwA, JwB, JwC, JwD;
  float mass;
} b2clGearJointData;

typedef struct b2clPulleyJointData {
  float groundAnchorA[2];
  float groundAnchorB[2];
  float lengthA;
  float lengthB;
  float localAnchorA[2];
  float localAnchorB[2];
  float pulleyConstant;
  float ratio;
  float uA[2];
  float uB[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
} b2clPulleyJointData;

typedef struct b2clRopeJointData {
  float localAnchorA[2];
  float localAnchorB[2];
  float maxLength;
  float nlength;
  float u[2];
  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  float mass;
  int limitState;
} b2clRopeJointData;

typedef struct b2clWheelJointData {
  float frequencyHz;
  float dampingRatio;

  float localAnchorA[2];
  float localAnchorB[2];
  float localXAxisA[2];
  float localYAxisA[2];

  float maxMotorTorque;
  float motorSpeed;
  int enableMotor;

  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;

  float ax[2], ay[2];
  float sAx, sBx;
  float sAy, sBy;

  float mass;
  float motorMass;
  float springMass;

  float bias;
  float gamma;
} b2clWheelJointData;

typedef struct b2clWeldJointData {
  float frequencyHz;
  float dampingRatio;
  float bias;

  float localAnchorA[2];
  float localAnchorB[2];
  float referenceAngle;
  float gamma;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat33 mass;
} b2clWeldJointData;

typedef struct b2clMouseJointData {
  float localAnchorB[2];
  float targetA[2];
  float frequencyHz;
  float dampingRatio;
  float beta;

  float maxForce;
  float gamma;

  float rB[2];
  float localCenterB[2];
  float invMassB;
  float invIB;
  b2clMat22 mass;
  float C[2];
} b2clMouseJointData;

typedef struct b2clFrictionJointData {
  float localAnchorA[2];
  float localAnchorB[2];

  float maxForce;
  float maxTorque;

  float rA[2];
  float rB[2];
  float localCenterA[2];
  float localCenterB[2];
  float invMassA;
  float invMassB;
  float invIA;
  float invIB;
  b2clMat22 linearMass;
  float angularMass;
} b2clFrictionJointData;

typedef struct clJoint {
  int index;

  union a1 {
    struct x1 {
      float impulse[3];
    } x;
    struct y1 {
      float scalarImpulse;
      float springImpulse;
    } y;
    struct z1 {
      float linearImpulse[2];
      float angularImpulse;
    } z;
  } a;
  float motorImpulse;

  int color;
  int type;
  int collideConnected;

  int indexA, indexB, indexC, indexD;

  union b1 {
    b2clDistanceJointData distanceJointData;
    b2clRevoluteJointData revoluteJointData;
    b2clPrismaticJointData prismaticJointData;
    b2clGearJointData gearJointData;
    b2clPulleyJointData pulleyJointData;
    b2clRopeJointData ropeJointData;
    b2clWheelJointData wheelJointData;
    b2clWeldJointData weldJointData;
    b2clMouseJointData mouseJointData;
    b2clFrictionJointData frictionJointData;
  } b;
} b2clJoint;

typedef struct {
  int index;
  float nimpulse[4];
} b2clJointImpulseNode;

typedef struct {
  int isCollide;
  float normal[2];
  float fraction;
  unsigned int shapeIndex;
} b2clRayCastOutput;

typedef struct {
  float2 m_buffer[2];
  float2 m_vertices[8];
  int m_count;
  float m_radius;
} b2clDistanceProxy;

typedef struct {
  float metric;
  short count;
  unsigned char indexA[3];
  unsigned char indexB[3];
} b2clSimplexCache;

typedef struct {
  b2clDistanceProxy proxyA;
  b2clDistanceProxy proxyB;
  b2clTransform transformA;
  b2clTransform transformB;
  bool useRadii;
} b2clDistanceInput;

typedef struct {
  float2 pointA;
  float2 pointB;
  float ndistance;
  int iterations;
} b2clDistanceOutput;

typedef struct {
  b2clDistanceProxy proxyA;
  b2clDistanceProxy proxyB;
  b2clSweep sweepA;
  b2clSweep sweepB;
  float tMax;
  float dummy;
} b2clTOIInput;

enum b2clTOIOutputState { e_unknown, e_failed, e_overlapped, e_touching, e_separated };

typedef struct {
  int state;
  float t;
} b2clTOIOutput;

typedef struct {
  float2 wA;
  float2 wB;
  float2 w;
  float a;
  int indexA;
  int indexB;
} b2clSimplexVertex;

typedef struct {
  b2clSimplexVertex m_v1, m_v2, m_v3;
  int m_count;
} b2clSimplex;
inline float2 A(const float2 a, const float2 b) {
  float2 c;
  c.x = a.x * b.y + a.y * b.x;
  c.y = a.y * b.y - a.x * b.x;
  return c;
}

inline float2 B(const float2 a, const float2 b) {
  float2 c;
  c.x = a.y * b.x - a.x * b.y;
  c.y = a.y * b.y + a.x * b.x;
  return c;
}

inline float2 C(const float2 a, const float2 d) {
  float2 e;
  e.x = a.y * d.x - a.x * d.y;
  e.y = a.x * d.x + a.y * d.y;

  return e;
}

inline float2 D(const float2 a, const float2 d) {
  float2 e;
  e.x = a.y * d.x + a.x * d.y;
  e.y = -a.x * d.x + a.y * d.y;

  return e;
}

inline float2 E(const b2clTransform* f, const float2 d) {
  float2 e;
  e.x = (f->q.y * d.x - f->q.x * d.y) + f->p.x;
  e.y = (f->q.x * d.x + f->q.y * d.y) + f->p.y;

  return e;
}

inline float2 F(const b2clTransform* f, const float2 d) {
  float g = d.x - f->p.x;
  float h = d.y - f->p.y;
  float2 e;
  e.x = (f->q.y * g + f->q.x * h);
  e.y = (-f->q.x * g + f->q.y * h);

  return e;
}

inline b2clTransform G(const b2clTransform* i, const b2clTransform* j) {
  b2clTransform k;
  k.q = A(i->q, j->q);
  k.p = A(i->q, j->p) + i->p;
  return k;
}

inline b2clTransform H(const b2clTransform* i, const b2clTransform* j) {
  b2clTransform k;
  k.q = B(i->q, j->q);
  k.p = B(i->q, j->p - i->p);
  return k;
}

inline float I(const float2 l, const float2 m) {
  return l.x * m.x + l.y * m.y;
}

inline float J(const float2 l, const float2 m) {
  return l.x * m.y - l.y * m.x;
}

inline float2 K(const float2 l, float n) {
  return (float2)(n * l.y, -n * l.x);
}

inline float2 L(float n, const float2 l) {
  return (float2)(-n * l.y, n * l.x);
}

inline float M(float l, float o, float p) {
  return max(o, min(l, p));
}

inline float2 N(const float2 l, const float2 m) {
  return (float2)(min(l.x, m.x), min(l.y, m.y));
}

inline float2 O(const float2 l, const float2 m) {
  return (float2)(max(l.x, m.x), max(l.y, m.y));
}

inline float P(const float2 l, const float2 m) {
  float2 q = l - m;
  return I(q, q);
}

inline float Q(const float2 l, const float2 m) {
  float2 q = l - m;
  return sqrt(I(q, q));
}

inline float R(const float2 d) {
  return I(d, d);
}

inline float S(float l) {
  return l > 0.0f ? l : -l;
}

inline float T(const float3 l, const float3 m) {
  return l.x * m.x + l.y * m.y + l.z * m.z;
}

inline float3 U(const float3 l, const float3 m) {
  return (float3)(l.y * m.z - l.z * m.y, l.z * m.x - l.x * m.z, l.x * m.y - l.y * m.x);
}

inline float3 V(const b2clMat33 r, const float3 m) {
  float3 s = (float3)(rx[0], rx[1], rx[2]);
  float3 t = (float3)(ry[0], ry[1], ry[2]);
  float3 u = (float3)(rz[0], rz[1], rz[2]);

  float v = T(s, U(t, u));

  if (v != 0.0f) {
    v = 1.0f / v;
  }
  float3 w;
  w.x = v * T(m, U(t, u));
  w.y = v * T(s, U(m, u));
  w.z = v * T(s, U(t, m));
  return w;
}

inline float2 W(const b2clMat33 r, const float2 m) {
  float2 s = (float2)(rx[0], rx[1]);
  float2 t = (float2)(ry[0], ry[1]);

  float v = s.x * t.y - t.x * s.y;
  if (v != 0.0f) {
    v = 1.0f / v;
  }
  float2 w;
  w.x = v * (t.y * m.x - t.x * m.y);
  w.y = v * (s.x * m.y - s.y * m.x);
  return w;
}

inline float2 X(const b2clMat22 r, const float2 m) {
  float2 s = (float2)(rx[0], rx[1]);
  float2 t = (float2)(ry[0], ry[1]);

  float v = s.x * t.y - t.x * s.y;
  if (v != 0.0f) {
    v = 1.0f / v;
  }
  float2 w;
  w.x = v * (t.y * m.x - t.x * m.y);
  w.y = v * (s.x * m.y - s.y * m.x);
  return w;
}

inline float2 Y(const b2clMat33 i, const float2 d) {
  return (float2)(i.ex[0] * d.x + i.ey[0] * d.y, i.ex[1] * d.x + i.ey[1] * d.y);
}

inline float2 Z(const b2clMat22 i, const float2 d) {
  return (float2)(i.ex[0] * d.x + i.ey[0] * d.y, i.ex[1] * d.x + i.ey[1] * d.y);
}

inline void AA(const b2clMat33 x, b2clMat33* y) {
  float l = x.ex[0], m = x.ey[0], q = x.ex[1], z = x.ey[1];
  float v = l * z - m * q;
  if (v != 0.0f) {
    v = 1.0f / v;
  }

  y->ex[0] = v * z;
  y->ey[0] = -v * m;
  y->ex[2] = 0.0f;
  y->ex[1] = -v * q;
  y->ey[1] = v * l;
  y->ey[2] = 0.0f;
  y->ez[0] = 0.0f;
  y->ez[1] = 0.0f;
  y->ez[2] = 0.0f;
}

inline void AB(const b2clMat33 x, b2clMat33* y) {
  float v = x.ex[0] * (x.ey[1] * x.ez[2] - x.ey[2] * x.ez[1]) + x.ex[1] * (x.ey[2] * x.ez[0] - x.ey[0] * x.ez[2]) + x.ex[2] * (x.ey[0] * x.ez[1] - x.ey[1] * x.ez[0]);

  if (v != 0.0f) {
    v = 1.0f / v;
  }

  float aa = x.ex[0], ab = x.ey[0], ac = x.ez[0];
  float ad = x.ey[1], ae = x.ez[1];
  float af = x.ez[2];

  y->ex[0] = v * (ad * af - ae * ae);
  y->ex[1] = v * (ac * ae - ab * af);
  y->ex[2] = v * (ab * ae - ac * ad);

  y->ey[0] = y->ex[1];
  y->ey[1] = v * (aa * af - ac * ac);
  y->ey[2] = v * (ac * ab - aa * ae);

  y->ez[0] = y->ex[2];
  y->ez[1] = y->ey[2];
  y->ez[2] = v * (aa * ad - ab * ab);
}

inline float2 AC(const b2clMat33 i, const float2 d) {
  return (float2)(i.ex[0] * d.x + i.ey[0] * d.y, i.ex[1] * d.x + i.ey[1] * d.y);
}

inline float3 AD(const b2clMat33 i, const float3 d) {
  return (float3)(i.ex[0] * d.x + i.ey[0] * d.y + i.ez[0] * d.z, i.ex[1] * d.x + i.ey[1] * d.y + i.ez[1] * d.z, i.ex[2] * d.x + i.ey[2] * d.y + i.ez[2] * d.z);
}

inline void AE(const b2clMat22 x, b2clMat22* y) {
  float l = x.ex[0], m = x.ey[0], q = x.ex[1], z = x.ey[1];
  float v = l * z - m * q;
  if (v != 0.0f) {
    v = 1.0f / v;
  }
  y->ex[0] = v * z;
  y->ey[0] = -v * m;
  y->ex[1] = -v * q;
  y->ey[1] = v * l;
}

inline void AF(b2clSweep* ag) {
  float ah = 2.0f * 3.14159265359f;
  float z = ah * __clc_floor(ag->a0 / ah);
  ag->a0 -= z;
  ag->a -= z;
}

inline void AG(b2clSweep* ag, b2clTransform* ai, float aj) {
  ai->p = (1.0f - aj) * ag->c0 + aj * ag->c;
  float ak = (1.0f - aj) * ag->a0 + aj * ag->a;
  ai->q.x = sin(ak);
  ai->q.y = cos(ak);

  ai->p -= C(ai->q, ag->localCenter);
}

inline void AH(b2clSweep* ag, float al) {
  float aj = (al - ag->alpha0) / (1.0f - ag->alpha0);
  ag->c0 = (1.0f - aj) * ag->c0 + aj * ag->c;
  ag->a0 = (1.0f - aj) * ag->a0 + aj * ag->a;
  ag->alpha0 = al;
}
inline void AI(b2clBodyDynamic* am, b2clTransform* ai, float al) {
  AH(&(am->m_sweep), al);
  am->m_sweep.c = am->m_sweep.c0;
  am->m_sweep.a = am->m_sweep.a0;
  ai->q.x = sin(am->m_sweep.a);
  ai->q.y = cos(am->m_sweep.a);
  ai->p = am->m_sweep.c - C(ai->q, am->m_sweep.localCenter);
}

inline void AJ(b2clDistanceProxy* an, const b2clPolygonShape* ao) {
  an->m_count = ao->m_vertexCount;
  an->m_radius = ao->m_radius;
  for (int ap = 0; ap < ao->m_vertexCount; ++ap) {
    an->m_vertices[ap] = ao->m_vertices[ap];
  }
}

inline int AK(const b2clDistanceProxy* an, float2 z) {
  int aq = 0;
  float ar = I(an->m_vertices[0], z);
  for (int ap = 1; ap < an->m_count; ++ap) {
    float as = I(an->m_vertices[ap], z);
    if (as > ar) {
      aq = ap;
      ar = as;
    }
  }
  return aq;
}

inline float2 AL(const b2clDistanceProxy* an, int at) {
  return an->m_vertices[at];
}

inline float AM(float2* d) {
  float au = sqrt(I(*d, *d));
  if (au < 0x1.0p-23f) {
    return 0.0f;
  }
  float av = 1.0f / au;
  (*d).x *= av;
  (*d).y *= av;

  return au;
}
float AN(const b2clPolygonShape* aw, const b2clTransform* ax, int ay, const b2clPolygonShape* az, const b2clTransform* ba, float4* bb) {
  const float2* bc = aw->m_vertices;
  const float2* bd = aw->m_normals;

  int be = az->m_vertexCount;
  const float2* bf = az->m_vertices;

  float2 bg = C(ax->q, bd[ay]);
  float2 bh = D(ba->q, bg);

  int at = 0;
  float bi = 0x1.fffffep127f;

  for (int ap = 0; ap < be; ++ap) {
    float bj = dot(bf[ap], bh);
    if (bj < bi) {
      bi = bj;
      at = ap;
    }
  }

  float2 bk = E(ax, bc[ay]);
  float2 bl = E(ba, bf[at]);
  float bm = dot(bl - bk, bg);
  (*bb).xy = bf[at];
  (*bb).zw = at;
  return bm;
}

float AO(int* bn, const b2clPolygonShape* aw, const b2clTransform* ax, const b2clPolygonShape* az, const b2clTransform* ba, float4* bb) {
  int bo = aw->m_vertexCount;
  const float2* bd = aw->m_normals;

  float2 z = E(ba, az->m_centroid) - E(ax, aw->m_centroid);
  float2 bp = D(ax->q, z);

  (*bb).x = aw->m_centroid.x;
  (*bb).y = aw->m_centroid.y;
  (*bb).z = az->m_centroid.x;
  (*bb).w = az->m_centroid.y;

  int bq = 0;
  float br = -0x1.fffffep127f;
  for (int ap = 0; ap < bo; ++ap) {
    float bj = dot(bd[ap], bp);
    if (bj > br) {
      br = bj;
      bq = ap;
    }
  }

  float4 bs;

  float n = AN(aw, ax, bq, az, ba, &bs);

  int bt = bq - 1 >= 0 ? bq - 1 : bo - 1;
  float bu = AN(aw, ax, bt, az, ba, &bs);

  int bv = bq + 1 < bo ? bq + 1 : 0;
  float bw = AN(aw, ax, bv, az, ba, &bs);

  int bx;
  float by;
  int bz;
  if (bu > n && bu > bw) {
    bz = -1;
    bx = bt;
    by = bu;
  } else if (bw > n) {
    bz = 1;
    bx = bv;
    by = bw;
  } else {
    *bn = bq;
    return n;
  }

  for (;;) {
    if (bz == -1)
      bq = bx - 1 >= 0 ? bx - 1 : bo - 1;
    else
      bq = bx + 1 < bo ? bx + 1 : 0;

    n = AN(aw, ax, bq, az, ba, &bs);

    if (n > by) {
      bx = bq;
      by = n;
    } else {
      break;
    }
  }

  *bn = bx;

  return by;
}

void AP(b2clClipVertex q[2], const b2clPolygonShape* aw, const b2clTransform* ax, int ay, const b2clPolygonShape* az, const b2clTransform* ba) {
  const float2* bd = aw->m_normals;

  int be = az->m_vertexCount;
  const float2* bf = az->m_vertices;
  const float2* ca = az->m_normals;

  float2 bh = D(ba->q, C(ax->q, bd[ay]));

  int at = 0;
  float bi = 0x1.fffffep127f;
  for (int ap = 0; ap < be; ++ap) {
    float bj = dot(bh, ca[ap]);
    if (bj < bi) {
      bi = bj;
      at = ap;
    }
  }

  int cb = at;
  int cc = cb + 1 < be ? cb + 1 : 0;

  q[0].v = E(ba, bf[cb]);
  q[0].id.cf.indexA = (uint)ay;
  q[0].id.cf.indexB = (uint)cb;
  q[0].id.cf.typeA = 1;
  q[0].id.cf.typeB = 0;

  q[1].v = E(ba, bf[cc]);
  q[1].id.cf.indexA = (uint)ay;
  q[1].id.cf.indexB = (uint)cc;
  q[1].id.cf.typeA = 1;
  q[1].id.cf.typeB = 0;
}

int AQ(b2clClipVertex cd[2], const b2clClipVertex ce[2], const float2 cf, float cg, int ch) {
  int ci = 0;

  float cj = dot(cf, ce[0].v) - cg;
  float ck = dot(cf, ce[1].v) - cg;

  if (cj <= 0.0f)
    cd[ci++] = ce[0];
  if (ck <= 0.0f)
    cd[ci++] = ce[1];

  if (cj * ck < 0.0f) {
    float cl = cj / (cj - ck);
    cd[ci].v = ce[0].v + cl * (ce[1].v - ce[0].v);

    cd[ci].id.cf.indexA = ch;
    cd[ci].id.cf.indexB = ce[0].id.cf.indexB;
    cd[ci].id.cf.typeA = 0;
    cd[ci].id.cf.typeB = 1;
    ++ci;
  }

  return ci;
}
__kernel void AR(__global b2clManifold* cm, const __global b2clPolygonShape* cn, const __global b2clTransform* co, const __global int4* cp, const int cq) {
  unsigned int ap = get_global_id(0);

  if (ap >= cq)
    return;

  b2clManifold cr;

  cr.pointCount = 0;
  int cs;

  int4 at;
  b2clPolygonShape ct, cu;
  b2clTransform cv, cw;

  at = cp[ap];
  ct = cn[at.x];
  cu = cn[at.y];
  cv = co[at.z];
  cw = co[at.w];

  float cx = ct.m_radius + cu.m_radius;

  float4 bb;

  int cy = 0;
  float cz = AO(&cy, &ct, &cv, &cu, &cw, &bb);

  if (cz > cx) {
    cm[ap] = cr;
    return;
  }

  int da = 0;
  float db = AO(&da, &cu, &cw, &ct, &cv, &bb);
  if (db > cx) {
    cm[ap] = cr;
    return;
  }

  const b2clPolygonShape* aw;
  const b2clPolygonShape* az;
  b2clTransform *ax, *ba;
  int ay;
  uint dc;
  const float dd = 0.98f;
  const float de = 0.001f;

  if (db > dd * cz + de) {
    aw = &cu;
    az = &ct;
    ax = &cw;
    ba = &cv;
    ay = da;
    cr.type = 2;
    dc = 1;
  } else {
    aw = &ct;
    az = &cu;
    ax = &cv;
    ba = &cw;
    ay = cy;
    cr.type = 1;
    dc = 0;
  }

  b2clClipVertex df[2];
  AP(df, aw, ax, ay, az, ba);

  int bo = aw->m_vertexCount;
  const float2* bc = aw->m_vertices;

  int dg = ay;
  int dh = ay + 1 < bo ? ay + 1 : 0;

  float2 di = bc[dg];
  float2 dj = bc[dh];

  float2 dk = dj - di;
  dk = normalize(dk);

  float2 dl = K(dk, 1.0f);
  float2 dm = 0.5f * (di + dj);

  float2 dn = C(ax->q, dk);
  float2 cf = K(dn, 1.0f);

  di = E(ax, di);
  dj = E(ax, dj);

  float do = dot(cf, di);

  float dp = -dot(dn, di) + cx;
  float dq = dot(dn, dj) + cx;

  b2clClipVertex dr[2];
  b2clClipVertex ds[2];
  int dt;

  dt = AQ(dr, df, -dn, dp, dg);

  if (dt < 2) {
    cm[ap] = cr;
    return;
  }

  dt = AQ(ds, dr, dn, dq, dh);

  if (dt < 2) {
    cm[ap] = cr;
    return;
  }

  cr.localNormal = dl;
  cr.localPoint = dm;

  int du = 0;
  for (int dv = 0; dv < 2; ++dv) {
    float bm = dot(cf, ds[dv].v) - do;

    if (bm <= cx) {
      b2clManifoldPoint* dw = cr.points + du;
      dw->localPoint = F(ba, ds[dv].v);
      dw->id = ds[dv].id;
      if (dc) {
        b2clContactFeature dx = dw->id.cf;
        dw->id.cf.indexA = dx.indexB;
        dw->id.cf.indexB = dx.indexA;
        dw->id.cf.typeA = dx.typeB;
        dw->id.cf.typeB = dx.typeA;
      }
      ++du;
    }
  }

  cr.pointCount = du;

  for (int dv = 0; dv < cr.pointCount; ++dv) {
    b2clManifoldPoint* dy = cr.points + dv;
    dy->normalImpulse = 0.0f;
    dy->tangentImpulse = 0.0f;
    int dz = dy->id.key;

    b2clManifold ea = cm[ap];
    for (int eb = 0; eb < ea.pointCount; ++eb) {
      b2clManifoldPoint* ec = ea.points + eb;

      if (ec->id.key == dz) {
        dy->normalImpulse = ec->normalImpulse;
        dy->tangentImpulse = ec->tangentImpulse;
        break;
      }
    }
  }

  cm[ap] = cr;
}

__kernel void AS(__global b2clManifold* cm, const __global b2clPolygonShape* cn, const __global b2clTransform* co, const __global int4* ed, const __global int* ee, const int ef, const int cq) {
  unsigned int ap = get_global_id(0);

  if (ap >= cq)
    return;

  b2clManifold cr;

  cr.pointCount = 0;
  int cs;

  int eg;
  int4 at;
  b2clPolygonShape eh, ei;
  b2clTransform cv, cw;

  eg = ee[ap];
  at = ed[eg];
  eh = cn[at.x];
  ei = cn[at.y];
  cv = co[at.z];
  cw = co[at.w];

  float cx = eh.m_radius + ei.m_radius;

  float2 z = E(&cv, eh.m_centroid) - E(&cw, ei.m_centroid);
  float ej = I(z, z);

  if (ej > cx * cx) {
    cm[eg] = cr;
    return;
  }

  cr.type = 0;
  cr.localPoint = eh.m_centroid;
  cr.localNormal = 0;
  cr.pointCount = 1;

  cr.points[0].localPoint = ei.m_centroid;
  cr.points[0].id.key = 0;

  cm[eg] = cr;
}

__kernel void AT(const __global int* ek, __global int* el, __global int* em) {
  *em = ek[0];
  if (*em)
    el[0] = 0;
}