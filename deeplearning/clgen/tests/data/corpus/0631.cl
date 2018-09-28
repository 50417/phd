__kernel void fn_A(__local int* A) {
  volatile int B;
  B = A[get_local_id(0)];
  atomic_add(A, 1);
}