__kernel void fn_A(global int* A, global int* B) {
  int C = get_global_id(0);
  if (C % 2 == 1) {
    if (__gen_ocl_simd_all((A[C] < 12) && (A[C] > 0)))
      B[C] = 1;
    else
      B[C] = 2;
  } else
    B[C] = 3;
}