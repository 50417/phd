typedef double MatrixElement; __kernel void fn_A(__global const MatrixElement* restrict const A, __global MatrixElement* restrict const B) {
  const unsigned int C = get_global_id(0);
  const unsigned int D = get_global_id(1);
  const size_t E = D * get_global_size(0) + C;

  const unsigned int F = D;
  const unsigned int G = C;
  const size_t H = G * get_global_size(0) + F;

  B[H] = A[E];
}

__kernel void fn_B(__global const MatrixElement* restrict const A, __local MatrixElement* restrict const B, __global MatrixElement* restrict const C) {
  const unsigned int D = get_global_id(0);
  const unsigned int E = get_global_id(1);
  const size_t F = E * get_global_size(0) + D;

  const unsigned int G = get_local_id(1);
  const unsigned int H = get_local_id(0);
  const unsigned int I = H * get_local_size(0) + G;

  B[I] = A[F];
  barrier(1);

  const unsigned int J = get_local_id(0);
  const unsigned int K = get_local_id(1);
  const unsigned int L = K * get_local_size(0) + J;

  const unsigned int M = get_group_id(1) * get_local_size(0);
  const unsigned int N = get_group_id(0) * get_local_size(1);

  const unsigned int O = M + J;
  const unsigned int P = N + K;
  const size_t Q = P * get_global_size(0) + O;

  C[Q] = B[L];
}