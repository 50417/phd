kernel void fn_A(global int* A) {
}

kernel void fn_B(global int* A, int B) {
  int C = get_global_id(0);
  A[C] = C + B;
}

kernel void fn_C(global int* A, global int* B, global int* C) {
  int D = get_global_id(0);
  A[D] = B[D] + C[D];
}