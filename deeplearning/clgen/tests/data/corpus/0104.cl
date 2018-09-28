__kernel void fn_A(__global uint* A, __global uint* B) {
  __gen_ocl_force_simd16();
  int C = (int)get_global_id(0);
  const int D = A[C];
  B[C] = __gen_ocl_region(0, 16, 8, 2, D);
}