kernel void fn_A(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] < B[D]) ? 3 : 4;
}

kernel void fn_B(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] <= B[D]) ? 3 : 4;
}

kernel void fn_C(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] > B[D]) ? 3 : 4;
}

kernel void fn_D(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] >= B[D]) ? 3 : 4;
}

kernel void fn_E(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] == B[D]) ? 3 : 4;
}

kernel void fn_F(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  C[D] = (A[D] != B[D]) ? 3 : 4;
}