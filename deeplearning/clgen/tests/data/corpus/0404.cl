__kernel void fn_A(__global uint* A, __global uint* B) {
  const int C = (int)get_global_id(0);
  const uint3 D = vload3(C, A);
  vstore3(D, C, B);
}