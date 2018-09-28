__kernel void fn_A(global int* A, int B) {
  int C = get_global_id(0);
  if (C == 0)
    A[0] = get_max_sub_group_size();
  A++;

  int D = C;
  int E = get_max_sub_group_size() - get_sub_group_local_id() - 1;
  int F = get_sub_group_local_id() + 1;
  int G = intel_sub_group_shuffle_down(123, 456, B);
  int H = intel_sub_group_shuffle_down(123, D, B);
  int I = intel_sub_group_shuffle_down(D, -D, F);
  int J = intel_sub_group_shuffle_down(D, 321, E);
  A[C * 4] = G;
  A[C * 4 + 1] = H;
  A[C * 4 + 2] = I;
  A[C * 4 + 3] = J;
}