__kernel void fn_A(__local int* A) {
  volatile int B, C;

  B = get_local_id(0) == 0 ? 1 : 0;

  if (get_local_id(0) == 0) {
    C = A[0];
  }

  barrier(B);

  if (get_local_id(0) == 1) {
    A[0] = 0;
  }
}