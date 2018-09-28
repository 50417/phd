__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global float* D, uint E) {
  uint F = get_global_id(0);
  uint G = get_global_size(0);

  float H = 0;
  uint I = 0;
  for (I = 0; I < E; I++) {
    if (F > I) {
      H = H + C[I] * A[F - I];
    } else {
      H = H + C[I] * D[E - (I - F)];
    }
  }
  B[F] = H;

  barrier(2);

  if (F >= G - E) {
    D[E - (G - F)] = A[F];
  }

  barrier(2);
}