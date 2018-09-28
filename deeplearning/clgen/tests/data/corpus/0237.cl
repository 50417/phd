kernel void fn_A(global float* A, global float* B, global float* C, global float* D) {
  int E = get_global_id(0);
  D[E] = smoothstep(A[E], B[E], C[E]);
}