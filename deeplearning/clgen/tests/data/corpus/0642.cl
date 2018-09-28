__kernel void fn_A(__global int* A, __global short* B) {
  A = (__global int*)B;
  B[3] = get_local_id(0);
}