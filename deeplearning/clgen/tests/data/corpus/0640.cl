__kernel void fn_A(__local int* A, __local int* B, __local int* C) {
  C[get_local_id(0)] = C[get_local_id(0) + 1];
  B[get_local_id(0)] = A[C[get_local_id(0) + 2]];
}