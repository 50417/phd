__kernel void fn_A(__global hmc_float* A, __global hmc_float* B, const uint C) {
  uint D = get_global_id(0);
  hmc_float E = 0;
  if (D == 0) {
    for (uint F = 0; F < C; F++) {
      E += B[F];
    }
    *A = E;
  }
}