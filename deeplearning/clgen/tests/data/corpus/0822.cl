__kernel void fn_A(__global const char* A, __global char* B, const size_t C) {
  int D = get_global_id(0);
  if (D < C)
    B[D] = A[D] + 1;
}