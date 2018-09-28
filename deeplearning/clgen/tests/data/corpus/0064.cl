__kernel void fn_A(__global float* A, __private int B) {
  size_t C = get_global_id(0);

  if (C < B)
    A[C] = 0;
}