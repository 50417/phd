__kernel void fn_A(__local int* A, int B) {
  int C = get_local_id(0);
  A[C] += A[C + B];
}