kernel void fn_A(__global int* restrict A, const int B, volatile int C, __constant float* restrict D) {
  *A = B + C;
}

kernel void fn_B(read_only image1d_t A, image2d_t B, write_only image2d_array_t C) {
}