__kernel void fn_A(__global int* A, __global int* B, __global int* C, __global int* D) {
  D[0] = mad24(A[0], B[0], C[0]);
  D[1] = mul24(A[1], B[1]);
  D[2] = clz(A[2]);
  D[3] = clamp(A[3], B[3], C[3]);
  D[4] = (mul_hi((A[4]), (B[4])) + (C[4]));
  D[5] = mad_sat(A[5], B[5], C[5]);
  D[6] = max(A[6], B[6]);
  D[7] = min(A[7], B[7]);
  D[8] = mul_hi(A[8], B[8]);
  D[9] = rotate(A[9], B[9]);
  D[10] = sub_sat(A[10], B[10]);
  D[11] = abs(A[11]);
  D[12] = abs_diff(A[12], B[12]);
  D[13] = add_sat(A[13], B[13]);
  D[14] = hadd(A[14], B[14]);
  D[15] = rhadd(A[15], B[15]);
}