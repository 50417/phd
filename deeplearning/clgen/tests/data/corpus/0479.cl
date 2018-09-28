kernel void fn_A(global int* A, global int* B) {
  int C = get_global_id(0);
  int D = get_local_id(0);
  int E = get_group_id(0);
  atomic_add(B, C);
  barrier(2);
  if (D == 0) {
    A[E] = *B;
  }
}