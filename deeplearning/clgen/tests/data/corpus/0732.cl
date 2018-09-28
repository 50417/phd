__kernel void fn_A(__global float* A, __global float* B, __global float* C, __global int* D, __local float* E, __local float* F, __local float* G, __local int* H, __global float* I, __global float* J) {
  int K = get_global_id(0);

  E[K] = A[K];
  F[K] = B[K];
  G[K] = C[K];
  H[K] = D[K];

  I[K] = E[K] + K;
  B[K] = K;
  D[K] = K;
  J[K] = G[K] + K;
}