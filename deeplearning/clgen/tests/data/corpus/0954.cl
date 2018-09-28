__kernel void fn_A(__global unsigned char* A, __global unsigned char* B) {
  unsigned int C = get_global_id(0);
  A[C] = B[C];
}