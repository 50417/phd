kernel void fn_A(global float4* A, global float4* B, global float4* C, global float4* D, global float4* E, global float4* F, float G) {
  int H = get_global_id(0);

  bool I = 0 < A[H].x;
  if (I) {
    return;
  }

  float J = A[H].y;
  float4 K = B[H] / J;
  float L = 0.5 * G * G;
  E[H] = C[H] + D[H] / G + K * L;
  F[H] = D[H] + K / G;
}