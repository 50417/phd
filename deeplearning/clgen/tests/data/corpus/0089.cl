kernel void fn_A(global float* A, global float* B) {
  int C = get_global_id(0);
  B[C] = degrees(A[C]);
}