__constant float gb_A[2] = {0.0f, 1.0f};

kernel void fn_A(global float* A) {
  *A = gb_A[0];
}

void fn_B(constant const int* A, const int* B, const int* C);

kernel void fn_C(void) {
  constant const int A[] = {1, 2, 3};

  const int B[] = {4, 5, 6};

  int C[] = {7, 8, 9};

  fn_B(A, B, C);
}