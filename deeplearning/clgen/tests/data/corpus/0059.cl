__kernel void fn_A(__global unsigned char* A, __global unsigned char* B, __global unsigned char* C, const unsigned long D) {
  unsigned int E = get_global_id(0);
  if (E < D) {
    C[E] = A[E] + B[E];
  }
}