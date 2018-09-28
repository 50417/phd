kernel void fn_A(global int* A, local int* B) {
  int C = get_global_id(0);
  *B = C;
  barrier(1);
  A[C] = *B;
}