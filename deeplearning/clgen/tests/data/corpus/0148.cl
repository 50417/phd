__kernel void fn_A(__global uint const* const A, __private uint const B, __global uint* const C) {
  uint const D = get_global_id(0);

  C[D] = A[D] + B;
}

__kernel void fn_B(__global float const* const A, __private float const B, __global float* const C) {
  uint const D = get_global_id(0);

  C[D] = A[D] * B;
}