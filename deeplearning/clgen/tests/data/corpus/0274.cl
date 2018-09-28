typedef double MatrixElement; __kernel void fn_A(__global const MatrixElement* restrict const A, __global const MatrixElement* restrict const B, __global MatrixElement* restrict const C) {
  const unsigned int D = get_global_id(0);
  const unsigned int E = get_global_id(1);
  const unsigned int F = get_global_size(0);
  const size_t G = E * F + D;

  const unsigned int H = E;
  const unsigned int I = D;
  MatrixElement J = 0.0;
  for (unsigned int K = 0; K < F; ++K) {
    const size_t L = H * F + K;
    const size_t M = K * F + I;
    J += A[L] * B[M];
  }

  C[G] = J;
}

__kernel void fn_B(__global const MatrixElement* restrict const A, __global const MatrixElement* restrict const B, __global MatrixElement* restrict const C) {
  const unsigned int D = get_global_id(0);
  const unsigned int E = get_global_id(1);
  const unsigned int F = get_global_size(0);
  const size_t G = E * F + D;

  const unsigned int H = E;
  MatrixElement I = 0.0;
  for (unsigned int J = 0; J < F; ++J) {
    const size_t K = H * F + J;
    I += A[K] * B[K];
  }

  C[G] = I;
}