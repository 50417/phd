kernel void fn_A(global char* A, global short* B, global int* C, global long* D, global long* E, global long* F) {
  int G = get_global_id(0);
  D[G] = A[G];
  E[G] = B[G];
  F[G] = C[G];
}

kernel void fn_B(global char* A, global short* B, global int* C, global long* D) {
  int E = get_global_id(0);
  A[E] = D[E];
  B[E] = D[E];
  C[E] = D[E];
}

kernel void fn_C(global float* A, global long* B) {
  int C = get_global_id(0);
  A[C] = B[C];
}