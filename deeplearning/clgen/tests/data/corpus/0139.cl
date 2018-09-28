__kernel void fn_A(__global hmc_float* A, const int B, __global hmc_float* C) {
  if (get_global_id(0) == 0)
    (*C) = A[B];
}

__kernel void fn_B(__global hmc_float* A, const int B, __global hmc_float* C) {
  if (get_global_id(0) == 0)
    C[B] = (*A);
}