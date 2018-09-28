__kernel void fn_A(__global hmc_complex* A, __global hmc_complex* B, const uint C) {
  int D = get_global_id(0);
  if (D == 0) {
    hmc_complex E;
    hmc_complex F;
    F = complexLoadHack(&A[0]);
    for (int G = 1; G < get_num_groups(0); G++) {
      E = complexLoadHack(&A[G]);
      F = complexadd(F, E);
    }
    (*B) = F;
  }
  return;
}