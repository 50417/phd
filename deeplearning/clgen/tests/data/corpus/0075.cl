__kernel void fn_A(__global uint* A, __global uint* B) {
  int C = (int)get_global_id(0);
  if (__gen_ocl_any(C > 6))
    B[C] = A[C];
  else
    B[C] = 0;
}