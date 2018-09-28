__kernel void fn_A(__global float* A) {
  A[get_global_id(0)] = A[get_global_id(0)] + 1.0f;
}