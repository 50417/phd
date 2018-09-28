__kernel void fn_A(__global float* A) {
  size_t B = get_global_id(0);

  A[B] = (float)B;
}