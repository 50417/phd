kernel void fn_A(global const double* restrict A, const double B, global double* restrict C) {
  size_t D = get_global_id(0);
  C[D] = 2.0 / (B * A[D]);
}