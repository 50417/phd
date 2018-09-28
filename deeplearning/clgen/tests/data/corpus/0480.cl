kernel void fn_A(global int* A) {
  int B = get_global_id(0);
  if (B == 0) {
    *A = 0;
  }
  atomic_cmpxchg(A, B, 42);
}