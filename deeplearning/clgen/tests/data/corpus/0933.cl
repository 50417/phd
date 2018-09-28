__attribute__((reqd_work_group_size(256, 1, 1))) void __kernel fn_A(const unsigned int A, __global const unsigned int* restrict B, __global const unsigned int* restrict C, __global const float* restrict D, __constant float* restrict E, __global float* restrict F) {
  __private size_t G = get_global_id(0);

  if (G < A) {
    __private float H = F[G];

    __private const unsigned int I = B[G];
    __private const unsigned int J = B[G + 1];

    __private size_t K, L, M;
    __private float N[16];
    __private unsigned int O[16];
    for (K = I; K < J; K = K + 16) {
      if (K + 16 - 1 < J) {
        for (L = 0; L < 16; L++)
          N[L] = D[K + L];

        for (L = 0; L < 16; L++)
          O[L] = C[K + L];

        H = ((((((H) + (N[0] * E[O[0]])) + ((N[1] * E[O[1]]) + (N[2] * E[O[2]]))) + (((N[3] * E[O[3]]) + (N[4] * E[O[4]])) + ((N[5] * E[O[5]]) + (N[6] * E[O[6]])))) + ((((N[7] * E[O[7]]) + (N[8] * E[O[8]])) + ((N[9] * E[O[9]]) + (N[10] * E[O[10]]))) + (((N[11] * E[O[11]]) + (N[12] * E[O[12]])) + ((N[13] * E[O[13]]) + (N[14] * E[O[14]]))))) + (N[15] * E[O[15]]));
      } else {
        for (M = K; M < J; M++)
          H += D[M] * E[C[M]];
      }
    }
    F[G] = H;
  }
}