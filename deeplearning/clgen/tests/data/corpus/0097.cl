__kernel void fn_A(__global int* A, __global int* B) {
  int C = (int)get_global_id(0);
  B[C] = A[C];
  if (B[C] >= 0) {
    B[C] = A[C + 1];
    A[C] = 1;
  } else {
    B[C]--;
    A[C] = 2;
  }
}