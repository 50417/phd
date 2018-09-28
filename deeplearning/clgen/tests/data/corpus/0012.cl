__kernel __attribute__((vec_type_hint(float4))) void fn_A(__global float* A, __global float* B, const float C) {
  size_t D = get_global_id(0);
  A[D] += B[D] * C;
}