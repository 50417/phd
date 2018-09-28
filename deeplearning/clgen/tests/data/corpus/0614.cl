typedef struct {
  int n, lda, j0;
  short ipiv[32];
} dlaswp_params_t;

typedef struct {
  int n, lda, j0, npivots;
  short ipiv[32];
} dlaswp_params_t2;

__kernel void fn_A(__global double* A, int B, dlaswp_params_t2 C) {
  unsigned int D = get_local_id(0) + ((get_local_size(0)) * (get_group_id(0)));

  if (D < C.n) {
    int E = C.lda;
    __global double* F = A + B + D + E * C.j0;

    for (int G = 0; G < C.npivots; G++) {
      int H = C.ipiv[G];
      __global double* I = F + G * E;
      __global double* J = F + H * E;
      double K = *I;
      *I = *J;
      *J = K;
    }
  }
}