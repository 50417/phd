__kernel void fn_A(__global int* A, __global int* B) {
  int C[32];
  for (int D = 0; D < 16; ++D) {
    for (int E = 0; E < 16; ++E)
      C[E] = get_global_id(0);
    for (int E = 0; E < A[0]; ++E)
      C[E] = 1 + A[E];
    C[16 + D] = C[D];
  }
  B[get_global_id(0)] = C[16 + get_global_id(0)];
}