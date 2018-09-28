__kernel void fn_A(__global uint* A, __global uint* B) {
  int C = (int)get_global_id(0);
  const int D = __gen_ocl_obread(A + C);
  B[C] = D;
}