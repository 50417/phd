__kernel void fn_A(__local int* A, __local int* B) {
  int C;

  B[get_local_id(0)] = A[0];
  A[0] = 5;
}