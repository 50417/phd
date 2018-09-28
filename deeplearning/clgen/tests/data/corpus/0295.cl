typedef float b3Scalar; typedef float4 b3Vector3; typedef struct {
  unsigned int m_key;
  unsigned int m_value;
} SortDataCL;

typedef struct {
  union {
    float4 m_min;
    float m_minElems[4];
    int m_minIndices[4];
  };
  union {
    float4 m_max;
    float m_maxElems[4];
    int m_maxIndices[4];
  };
} b3AabbCL;

unsigned int fn_A(unsigned int A) {
  A &= 0x000003FF;

  A = (A ^ (A << 16)) & 0xFF0000FF;
  A = (A ^ (A << 8)) & 0x0300F00F;
  A = (A ^ (A << 4)) & 0x030C30C3;
  A = (A ^ (A << 2)) & 0x09249249;

  return A;
}
unsigned int fn_B(unsigned int A, unsigned int B, unsigned int C) {
  return fn_A(A) << 0 | fn_A(B) << 1 | fn_A(C) << 2;
}

__kernel void fn_C(__global b3AabbCL* A, __global int* B, __global b3AabbCL* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  int F = B[E];
  C[E] = A[F];
}

__kernel void fn_D(__global b3AabbCL* A, int B) {
  int C = B / 2 + B % 2;
  int D = B - C;

  int E = get_global_id(0);
  if (E >= D)
    return;

  int F = E + C;

  b3AabbCL G = A[E];
  b3AabbCL H = A[F];

  b3AabbCL I;
  I.m_min = min(G.m_min, H.m_min);
  I.m_max = max(G.m_max, H.m_max);
  A[E] = I;
}

__kernel void fn_E(__global b3AabbCL* A, __global b3AabbCL* B, __global SortDataCL* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  b3AabbCL F = B[0];
  b3Vector3 G = (F.m_min + F.m_max) * 0.5f;
  b3Vector3 H = (F.m_max - F.m_min) / (float)1024;

  b3AabbCL I = A[E];
  b3Vector3 J = (I.m_min + I.m_max) * 0.5f;
  b3Vector3 K = J - G;

  b3Vector3 L = K / H;

  int4 M;
  M.x = (int)((L.x >= 0.0f) ? L.x : __clc_floor(L.x));
  M.y = (int)((L.y >= 0.0f) ? L.y : __clc_floor(L.y));
  M.z = (int)((L.z >= 0.0f) ? L.z : __clc_floor(L.z));

  M = max(-512, min(M, 511));
  M += 512;

  unsigned int N = fn_B(M.x, M.y, M.z);

  SortDataCL O;
  O.m_key = N;
  O.m_value = E;

  C[E] = O;
}

int fn_F(int A) {
  return (A >> 31 == 0);
}
int fn_G(int A) {
  return A & (~0x80000000);
}
int fn_H(int A, int B) {
  return (A) ? B : (B | 0x80000000);
}

bool fn_I(const b3AabbCL* A, const b3AabbCL* B) {
  bool C = true;
  C = (A->m_min.x > B->m_max.x || A->m_max.x < B->m_min.x) ? false : C;
  C = (A->m_min.z > B->m_max.z || A->m_max.z < B->m_min.z) ? false : C;
  C = (A->m_min.y > B->m_max.y || A->m_max.y < B->m_min.y) ? false : C;
  return C;
}

__kernel void fn_J(__global b3AabbCL* A,

                   __global int* B, __global int2* C, __global b3AabbCL* D, __global int2* E,

                   __global SortDataCL* F, __global int* G, __global int4* H, int I, int J) {
  int K = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (K >= J)
    return;

  int L = F[K].m_value;
  b3AabbCL M = A[L];

  int N[128];

  int O = 1;
  N[0] = *B;

  while (O) {
    int P = N[O - 1];
    --O;

    int Q = fn_F(P);
    int R = fn_G(P);

    {
      int S = (Q) ? R : E[R].y;
      if (S <= K)
        continue;
    }

    int T = (Q) ? F[R].m_value : -1;

    b3AabbCL U = (Q) ? A[T] : D[R];
    if (fn_I(&M, &U)) {
      if (Q) {
        int4 V;
        V.x = A[L].m_minIndices[3];
        V.y = A[T].m_minIndices[3];
        V.z = -1;
        V.w = -1;

        int W = atomic_add(G, 1);
        if (W < I)
          H[W] = V;
      }

      if (!Q) {
        if (O + 2 > 128) {
        } else {
          N[O++] = C[R].x;
          N[O++] = C[R].y;
        }
      }
    }
  }
}

typedef struct {
  float4 m_from;
  float4 m_to;
} b3RayInfo;

b3Vector3 fn_K(b3Vector3 A) {
  b3Vector3 B = (b3Vector3){A.x, A.y, A.z, 0.f};
  return normalize(B);
}
b3Scalar fn_L(b3Vector3 A) {
  return A.x * A.x + A.y * A.y + A.z * A.z;
}
b3Scalar fn_M(b3Vector3 A, b3Vector3 B) {
  return A.x * B.x + A.y * B.y + A.z * B.z;
}

int fn_N(b3Vector3 A, b3Scalar B, b3Vector3 C, b3AabbCL D) {
  int4 E = isless(C, (b3Vector3){0.0f, 0.0f, 0.0f, 0.0f});

  E <<= 31;

  b3Vector3 F = (((E) ? (D.m_max) : (D.m_min)) - A) / C;
  b3Vector3 G = (((E) ? (D.m_min) : (D.m_max)) - A) / C;

  b3Scalar H = 0.0f;
  b3Scalar I = B;

  H = fmax(F.z, fmax(F.y, fmax(F.x, H)));
  I = fmin(G.z, fmin(G.y, fmin(G.x, I)));

  return (H <= I);
}

__kernel void fn_O(__global b3AabbCL* A,

                   __global int* B, __global int2* C, __global b3AabbCL* D, __global int2* E, __global SortDataCL* F,

                   __global b3RayInfo* G,

                   __global int* H, __global int2* I, int J, int K) {
  int L = get_global_id(0);
  if (L >= K)
    return;

  b3Vector3 M = G[L].m_from;
  b3Vector3 N = G[L].m_to;
  b3Vector3 O = fn_K(N - M);
  b3Scalar P = sqrt(fn_L(N - M));

  int Q[128];

  int R = 1;
  Q[0] = *B;

  while (R) {
    int S = Q[R - 1];
    --R;

    int T = fn_F(S);
    int U = fn_G(S);

    int V = (T) ? F[U].m_value : -1;

    b3AabbCL W = (T) ? A[V] : D[U];
    if (fn_N(M, P, O, W)) {
      if (T) {
        int2 X;
        X.x = L;
        X.y = A[V].m_minIndices[3];

        int Y = atomic_add(H, 1);
        if (Y < J)
          I[Y] = X;
      }

      if (!T) {
        if (R + 2 > 128) {
        } else {
          Q[R++] = C[U].x;
          Q[R++] = C[U].y;
        }
      }
    }
  }
}

__kernel void fn_P(__global b3AabbCL* A, __global b3AabbCL* B, __global int* C, __global int4* D, int E, int F, int G) {
  int H = get_global_id(0);
  if (H >= G)
    return;

  b3AabbCL I = A[H];
  for (int J = 0; J < F; ++J) {
    b3AabbCL K = B[J];
    if (fn_I(&I, &K)) {
      int4 L;
      L.x = K.m_minIndices[3];
      L.y = I.m_minIndices[3];
      L.z = -1;
      L.w = -1;

      int M = atomic_add(C, 1);
      if (M < E)
        D[M] = L;
    }
  }
}
__kernel void fn_Q(__global b3AabbCL* A, __global b3RayInfo* B, __global int* C, __global int2* D, int E, int F, int G) {
  int H = get_global_id(0);
  if (H >= G)
    return;

  b3Vector3 I = B[H].m_from;
  b3Vector3 J = B[H].m_to;
  b3Vector3 K = fn_K(J - I);
  b3Scalar L = sqrt(fn_L(J - I));

  for (int M = 0; M < E; ++M) {
    b3AabbCL N = A[M];
    if (fn_N(I, L, K, N)) {
      int2 O;
      O.x = H;
      O.y = N.m_minIndices[3];

      int P = atomic_add(C, 1);
      if (P < F)
        D[P] = O;
    }
  }
}
int fn_R(long A, long B) {
  return (int)clz(A ^ B);
}
long fn_S(long A, long B) {
  long C = (long)fn_R(A, B);

  long D = A & B;
  long E = ((long)(~0)) << (64 - C);

  return D & E;
}

int fn_T(long A, int B, long C, int D) {
  return min(fn_R(A, C), min(B, D));
}

__kernel void fn_U(__global SortDataCL* A, __global long* B, __global int* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  int F = E;
  int G = E + 1;

  int H = A[F].m_key;
  int I = A[G].m_key;

  long J = upsample(H, F);
  long K = upsample(I, G);

  B[E] = fn_S(J, K);
  C[E] = fn_R(J, K);
}

__kernel void fn_V(__global int* A, __global int* B, __global int2* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  int F = D - 1;

  int G = E - 1;
  int H = E;

  int I = (G >= 0) ? A[G] : 128;
  int J = (H < F) ? A[H] : 128;

  int K = (I > J);

  if (I == 128)
    K = false;
  if (J == 128)
    K = true;

  int L = (K) ? G : H;
  B[E] = L;

  int M = (K);

  int N = 1;
  __global int* O = (__global int*)(&C[L]);
  O[M] = fn_H(N, E);
}

__kernel void fn_W(__global long* A, __global int* B, __global int2* C, __global int* D, __global int* E, int F) {
  int G = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (G >= F)
    return;

  long H = A[G];
  int I = B[G];
  int J = -1;
  {
    int K = 0;
    int L = G - 1;

    while (K <= L) {
      int M = (K + L) / 2;
      long N = A[M];
      int O = B[M];

      int P = fn_T(H, I, N, O);
      if (P < I) {
        int Q = M + 1;
        if (Q < G) {
          long R = A[Q];
          int S = B[Q];

          int T = fn_T(H, I, R, S);
          if (T < I) {
            K = Q;
            J = Q;
          } else {
            J = M;
            break;
          }
        } else {
          J = M;
          break;
        }
      } else
        L = M - 1;
    }
  }

  int U = -1;
  {
    int K = G + 1;
    int L = F - 1;

    while (K <= L) {
      int M = (K + L) / 2;
      long N = A[M];
      int O = B[M];

      int P = fn_T(H, I, N, O);
      if (P < I) {
        int V = M - 1;
        if (V > G) {
          long W = A[V];
          int X = B[V];

          int Y = fn_T(H, I, W, X);
          if (Y < I) {
            L = V;
            U = V;
          } else {
            U = M;
            break;
          }
        } else {
          U = M;
          break;
        }
      } else
        K = M + 1;
    }
  }

  {
    int X = (J != -1) ? B[J] : 128;
    int S = (U != -1) ? B[U] : 128;

    int Z = (X > S);

    if (X == 128)
      Z = false;
    else if (S == 128)
      Z = true;

    int AA = (Z) ? J : U;

    int AB = (J == -1 && U == -1);
    D[G] = (!AB) ? AA : -1;

    int AC = 0;
    if (!AB) {
      int AD = (Z);

      __global int* AE = (__global int*)(&C[AA]);
      AE[AD] = fn_H(AC, G);
    } else
      *E = fn_H(AC, G);
  }
}

__kernel void fn_X(__global int* A, __global int* B, __global int* C, __global int* D, int E) {
  if (get_global_id(0) == 0)
    atomic_xchg(C, 0);

  int F = get_global_id(0);
  if (F >= E)
    return;

  int G = 0;
  {
    int H = B[F];
    while (H != -1) {
      H = B[H];
      ++G;
    }
  }
  D[F] = G;

  __local int I;
  if (get_local_id(0) == 0)
    I = 0;
  barrier(1);

  atomic_max(&I, G);
  barrier(1);

  if (get_local_id(0) == 0)
    atomic_max(C, I);
}

__kernel void fn_Y(__global int* A, __global SortDataCL* B, __global int2* C, __global b3AabbCL* D, __global b3AabbCL* E, int F, int G, int H) {
  int I = get_global_id(0);
  if (I >= H)
    return;

  int J = A[I];

  if (J == G) {
    int K = C[I].x;
    int L = C[I].y;

    int M = fn_F(K);
    int N = fn_F(L);

    K = fn_G(K);
    L = fn_G(L);

    int O = (M) ? B[K].m_value : -1;
    int P = (N) ? B[L].m_value : -1;

    b3AabbCL Q = (M) ? D[O] : E[K];
    b3AabbCL R = (N) ? D[P] : E[L];

    b3AabbCL S;
    S.m_min = min(Q.m_min, R.m_min);
    S.m_max = max(Q.m_max, R.m_max);
    E[I] = S;
  }
}

__kernel void fn_Z(__global int2* A, __global int2* B, int C) {
  int D = get_global_id(0);
  if (D >= C)
    return;

  int E = C + 1;

  int2 F = A[D];

  int2 G;

  {
    int H = F.x;
    while (!fn_F(H))
      H = A[fn_G(H)].x;
    G.x = H;
  }

  {
    int I = F.y;
    while (!fn_F(I))
      I = A[fn_G(I)].y;
    G.y = I;
  }

  B[D] = G;
}