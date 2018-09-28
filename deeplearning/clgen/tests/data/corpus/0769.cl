kernel void fn_A(global float4* A, global float4* B, local float4* C) {
  uint D = get_global_size(0);
  uint E = get_global_size(1);
  uint F = get_local_size(0);

  uint G = get_local_id(0);
  uint H = get_local_id(1);
  uint I = get_group_id(0);
  uint J = get_group_id(1);

  uint K = 4 * (J * F + H) * D + (I * F + G);
  uint L = 4 * (I * F + H) * E + (J * F + G);

  uint M = 4 * H * F + G;
  C[M] = A[K];
  C[M + F] = A[K + D];
  C[M + 2 * F] = A[K + 2 * D];
  C[M + 3 * F] = A[K + 3 * D];

  barrier(1);

  uint N = 4 * G * F + H;
  float4 O = C[N];
  float4 P = C[N + F];
  float4 Q = C[N + 2 * F];
  float4 R = C[N + 3 * F];

  B[L] = (float4)(O.x, P.x, Q.x, R.x);
  B[L + E] = (float4)(O.y, P.y, Q.y, R.y);
  B[L + 2 * E] = (float4)(O.z, P.z, Q.z, R.z);
  B[L + 3 * E] = (float4)(O.w, P.w, Q.w, R.w);
}