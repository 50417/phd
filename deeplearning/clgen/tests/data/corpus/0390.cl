__kernel void fn_A(__global unsigned int* A, __global unsigned int* B, __constant unsigned int* C) {
  if (A && B == 0 && C == ((void*)0)) {
    uint D = (uint)get_global_id(0);
    A[D] = D;
  }
}