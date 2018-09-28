__kernel void fn_A(int A, int B, __global double* C, __global double* D, __global double* E, __local double* F, __local double* G) {
  size_t H = get_global_id(0);
  size_t I = get_local_id(0);
  size_t J = get_local_size(0);
  size_t K = A * B;
  int L;

  if (H < K) {
    F[I] = C[H];
    G[I] = E[H];
    L = D[H % B];
    E[H] = 1 - exp(-L * (F[I] + G[I]));
  }
}