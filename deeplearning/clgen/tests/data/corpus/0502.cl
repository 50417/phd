__kernel void fn_A(__global float* A, __global float* B) {
  int C = get_global_id(0);
  int D = get_local_id(0);
  int E = get_group_id(0);

  int F = get_global_size(0);
  int G = get_local_size(0);

  int H = C;
  int I = D + E * G;

  B[I] = A[H];
}