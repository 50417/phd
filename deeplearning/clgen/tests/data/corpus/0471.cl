__kernel void fn_A(__global int* A, __global int* B) {
  size_t C = get_global_id(0);
  int3 D = 0;
  D.S2 = A[C];
  vstore3(D, 0, B);
}