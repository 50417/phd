kernel void fn_A(global int* A, local int* B) {
  int C = get_global_id(0);
  int D = get_local_id(0);
  int E = get_group_id(0);
  if (D == 0) {
    *B = 0;
  }
  barrier(1);
  atomic_add(B, C);
  barrier(1);
  if (D == 0) {
    A[E] = *B;
  }
}