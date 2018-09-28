kernel void fn_A(global int* A) {
  if (get_global_id(0) == 0) {
    *A = 0;
  }
  atomic_sub(A, 1);
}