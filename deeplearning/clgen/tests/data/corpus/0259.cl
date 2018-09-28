__kernel void fn_A(__global int* A, __global int* B) {
  int C = get_global_id(0);
  printf("Work number: %d Input: %d \n", C, A[C]);
  B[C] = A[C] * A[C];
}