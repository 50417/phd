float4 fn_A(float4 A) {
  float4 B;

  B.x = (A.x > A.y) ? A.y : A.x;
  B.y = (A.y > A.x) ? A.y : A.x;
  B.z = (A.z > A.w) ? A.w : A.z;
  B.w = (A.w > A.z) ? A.w : A.z;

  A.x = (B.x > B.z) ? B.z : B.x;
  A.y = (B.y > B.w) ? B.w : B.y;
  A.z = (B.z > B.x) ? B.z : B.x;
  A.w = (B.w > B.y) ? B.w : B.y;

  B.x = A.x;
  B.y = (A.y > A.z) ? A.z : A.y;
  B.z = (A.z > A.y) ? A.z : A.y;
  B.w = A.w;
  return B;
}

float4 fn_B(float4 A, float4 B) {
  A.x = (A.x < B.w) ? A.x : B.w;
  A.y = (A.y < B.z) ? A.y : B.z;
  A.z = (A.z < B.y) ? A.z : B.y;
  A.w = (A.w < B.x) ? A.w : B.x;
  return A;
}

float4 fn_C(float4 A, float4 B) {
  B.x = (A.w >= B.x) ? A.w : B.x;
  B.y = (A.z >= B.y) ? A.z : B.y;
  B.z = (A.y >= B.z) ? A.y : B.z;
  B.w = (A.x >= B.w) ? A.x : B.w;
  return B;
}

__kernel void fn_D(__global float4* A, __global float4* B, const int C) {
  int D = get_group_id(0);

  if (D * get_local_size(0) + get_local_id(0) < C / 4) {
    float4 E = A[D * get_local_size(0) + get_local_id(0)];
    B[D * get_local_size(0) + get_local_id(0)] = fn_A(E);
  }
}
__kernel void fn_E(__global float4* A, __global float4* B, const int C, int D, __global int* E) {
  int F = get_global_id(0);

  int G = F / D;
  if (G >= (1024))
    return;

  int H = F - G * D;
  int I = E[G] + H * C;

  int J = I + C / 2;
  global float4* K;
  K = &(B[I]);

  if (I >= E[G + 1])
    return;
  if (J >= E[G + 1]) {
    for (int L = 0; L < (E[G + 1] - I); L++) {
      K[L] = A[I + L];
    }
    return;
  }

  int M = 0;
  int N = 0;
  int O = 0;
  float4 P, Q;
  P = A[I + M];
  Q = A[J + N];

  while (true) {
    float4 R = A[I + M + 1];
    float4 S = A[J + N + 1];

    float4 T = fn_B(P, Q);
    float4 U = fn_C(P, Q);
    P = fn_A(T);
    Q = fn_A(U);

    K[O++] = P;

    bool V;
    bool W;

    V = (M + 1 < C / 2);
    W = (N + 1 < C / 2) && (J + N + 1 < E[G + 1]);

    if (V) {
      if (W) {
        if (R.x < S.x) {
          M += 1;
          P = R;
        } else {
          N += 1;
          P = S;
        }
      } else {
        M += 1;
        P = R;
      }
    } else {
      if (W) {
        N += 1;
        P = S;
      } else {
        break;
      }
    }
  }
  K[O++] = Q;
}

__kernel void fn_F(__global float* A, __global float* B, __constant int* C, __constant int* D, __constant int* E) {
  int F = get_global_id(0);
  int G = get_group_id(1);

  if ((E[G] + F) >= E[G + 1])
    return;
  B[E[G] + F] = A[C[G] * 4 + D[G] + F];
}