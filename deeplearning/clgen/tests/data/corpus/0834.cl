kernel void fn_A(global float* A, global float* B, int C) {
  B[0] = get_global_size(0);
  B[1] = get_global_size(1);
  B[2] = get_global_size(2);
}