int fn_A(int4 A, __global float4* B) {
  int4 C = *((__global int4*)(B + 1));
  A.x &= C.x - 1;
  A.y &= C.y - 1;
  A.z &= C.z - 1;
  int D = A.z * C.y * C.x + A.y * C.x + A.x;
  return D;
}

int4 fn_B(float4 A, __global float4* B) {
  int4 C;
  int4 D = *((__global int4*)(B + 1));
  C.x = (int)__clc_floor(A.x * B[0].x) & (D.x - 1);
  C.y = (int)__clc_floor(A.y * B[0].y) & (D.y - 1);
  C.z = (int)__clc_floor(A.z * B[0].z) & (D.z - 1);
  return C;
}

__kernel void fn_C(int A, __global float4* B, __global const int* C, __global int2* D, __global float4* E) {
  int F = get_global_id(0);
  if (F >= A) {
    return;
  }
  float4 G = B[C[F] * 2];
  float4 H = B[C[F] * 2 + 1];
  float4 I;
  I.x = (G.x + H.x) * 0.5f;
  I.y = (G.y + H.y) * 0.5f;
  I.z = (G.z + H.z) * 0.5f;
  I.w = 0.f;

  int4 J = fn_B(I, E);
  int K = fn_A(J, E);

  int2 L;
  L.x = K;
  L.y = F;
  D[F] = L;
}

__kernel void fn_D(int A, __global int* B) {
  int C = get_global_id(0);
  if (C >= A) {
    return;
  }
  B[C] = -1;
}

__kernel void fn_E(int A, __global int2* B, __global int* C) {
  __local int D[513];
  int E = get_global_id(0);
  int2 F;

  if (E < A) {
    F = B[E];

    D[get_local_id(0) + 1] = F.x;
    if ((E > 0) && (get_local_id(0) == 0)) {
      D[0] = B[E - 1].x;
    }
  }
  barrier(1);
  if (E < A) {
    if ((E == 0) || (F.x != D[get_local_id(0)])) {
      C[F.x] = E;
    }
  }
}

int fn_F(float4 A, float4 B, float4 C, float4 D) {
  return (A.x <= D.x) && (C.x <= B.x) && (A.y <= D.y) && (C.y <= B.y) && (A.z <= D.z) && (C.z <= B.z);
}

void fn_G(int A, int4 B, int C, __global int2* D, __global int* E, __global float4* F, __global const int* G, __global float4* H, volatile __global int* I, __global int4* J, int K) {
  int4 L = *((__global int4*)(H + 1));
  int M = L.w;
  int N = fn_A(B, H);

  int O = E[N];
  if (O == -1) {
    return;
  }

  int2 P = D[C];
  int Q = P.y;
  float4 R = F[G[Q] * 2 + 0];
  float4 S = F[G[Q] * 2 + 1];
  int T = __builtin_astype(R.w, int);

  int U = O + M;
  U = (U > A) ? A : U;
  for (int V = O; V < U; V++) {
    int2 W = D[V];
    if (W.x != N) {
      break;
    }
    int X = W.y;

    if (X != Q) {
      float4 Y = F[G[X] * 2 + 0];
      float4 Z = F[G[X] * 2 + 1];
      if (fn_F(R, S, Y, Z)) {
        if (I) {
          int AA = __builtin_astype(Y.w, int);
          if (T < AA) {
            int AB = atomic_add(I, 1);
            if (AB < K) {
              int4 AC;
              AC.x = T;
              AC.y = AA;
              AC.z = -1;
              AC.w = -1;
              J[AB] = AC;
            }
          }
        }
      }
    }
  }
}

__kernel void fn_H(int A, __global float4* B, __global const int* C, __global int2* D, __global int* E, __global float4* F, volatile __global int* G, __global int4* H, int I)

{
  int J = get_global_id(0);
  if (J >= A) {
    return;
  }
  int2 K = D[J];
  int L = K.y;
  float4 M = B[C[L] * 2 + 0];
  float4 N = B[C[L] * 2 + 1];
  float4 O;
  O.x = (M.x + N.x) * 0.5f;
  O.y = (M.y + N.y) * 0.5f;
  O.z = (M.z + N.z) * 0.5f;

  int4 P = fn_B(O, F);
  int4 Q;

  for (int R = -1; R <= 1; R++) {
    Q.z = P.z + R;
    for (int S = -1; S <= 1; S++) {
      Q.y = P.y + S;
      for (int T = -1; T <= 1; T++) {
        Q.x = P.x + T;
        fn_G(A, Q, J, D, E, B, C, F, G, H, I);
      }
    }
  }
}