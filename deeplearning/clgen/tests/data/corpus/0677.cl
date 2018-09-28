__kernel void fn_A(__local int* A, __local int* B) {
  A[get_local_id(0)] = get_local_id(0);

  barrier(2);

  B[get_local_id(0)] = get_local_id(0);
}