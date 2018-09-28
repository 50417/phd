kernel void fn_A(global const int* A, global const int* B, global int* C, int D) {
  int E = get_global_id(0);
  if (E >= D) {
    return;
  }
  C[E] = A[E] + B[E];
}

kernel void fn_B(global const int* A, global const int* B, global int* C, int D) {
  int E = get_global_id(0);
  if (E >= D) {
    return;
  }
  C[E] = E;
}

kernel void fn_C(global int* A, int B, int C) {
  int D = get_global_id(0);
  if (D >= C) {
    return;
  }
  A[D] += B;
}

kernel void fn_D(global int* A, int B, int C) {
  int D = get_global_id(0);
  if (D >= C) {
    return;
  }
  A[D] *= B;
}