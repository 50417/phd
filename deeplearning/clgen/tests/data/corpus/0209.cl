kernel void fn_A(global float* A, global float* B, global float* C) {
  int D = get_global_id(0);
  C[D] = nextafter(A[D], B[D]);
}