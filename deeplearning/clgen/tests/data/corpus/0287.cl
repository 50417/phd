__kernel void fn_A(__global float3* A, __global float3* B, __global float3* C, __global float3* D, __global float3* E, __global float3* F, __global float3* G, __global float3* H, __global float3* I, __global float3* J, __global float3* K, __global float3* L, const unsigned int M) {
  int N = get_global_id(0);
  if (N >= M) {
    return;
  }

  float3 O = A[N], P, Q;
  Q = cross(O, (float3)(0, 1, 0));
  float R = length(Q);

  if (R < 0.0001f) {
    float3 S = (float3)(1, 0, 0);
    Q = cross(O, S);
    R = length(Q);
  }
  Q = Q * 1.0f / R;
  P = cross(Q, O);

  float3 T = H[N];

  float8 U, V, W, X;
  U.s012 = -O;
  U.s456 = B[N];

  V.s012 = -P;
  V.s456 = C[N];

  W.s012 = -Q;
  W.s456 = D[N];

  X = U * T.x + V * T.y + W * T.z;
  I[N] = X.s012;
  J[N] = X.s456;

  U.s012 = O;
  U.s456 = E[N];

  V.s012 = P;
  V.s456 = F[N];

  W.s012 = Q;
  W.s456 = G[N];
  X = U * T.x + V * T.y + W * T.z;
  K[N] = X.s012;
  L[N] = X.s456;
}