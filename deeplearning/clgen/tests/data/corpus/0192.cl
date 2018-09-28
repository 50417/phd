__kernel void fn_A(int A, __global float* B, __global float* C) {
  int D, E, F, G;

  E = get_local_id(0);
  int H = get_local_size(0);
  int I = get_num_groups(0);
  int J = get_group_id(0);

  F = I * H;
  G = H * J;

  for (D = G + E; D < A; D += F) {
    C[D] = B[D];
  }
}