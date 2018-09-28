__kernel void fn_A(global int* A, global int* B) {
  int C = get_global_id(0);

  if (C % 2 == 1) {
    if (__gen_ocl_simd_any(A[C] == 5) || __gen_ocl_simd_any(A[C] == 9))
      B[C] = 1;
    else if (__gen_ocl_simd_any(A[C] == 6))
      B[C] = 0;
    else
      B[C] = 2;
  } else
    B[C] = 3;
}