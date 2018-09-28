kernel void fn_A(global int* A, global int* B) {
  int C = get_global_id(0);
  int D = get_local_id(0);
  int E = get_group_id(0);
  if (D == 0) {
    B[E] = 0;
  }
  barrier(2);
  atomic_add(B + E, C);
  barrier(2);
  if (D == 0) {
    A[E] = B[E];
  }
}