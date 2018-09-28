__kernel void fn_A(__local int* A, __local int* B) {
  int C = get_local_id(0);
  int D = A[C];
  atomic_add(B + D, 1);
}