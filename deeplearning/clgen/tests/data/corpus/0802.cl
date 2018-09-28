__kernel void fn_A(__global int* A) {
  unsigned int B = get_global_id(0);
  A[B] = 1;
}