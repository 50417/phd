__kernel void fn_A(__global const float* A, __global float* B, int C) {
  int D = get_global_id(0);
  if (D < C) {
    float E = A[D * 3];
    float F = A[D * 3 + 1];
    float G = A[D * 3 + 2];

    float H = 0.2126f * E + 0.7152f * F + 0.0722f * G;
    B[D * 3] = B[D * 3 + 1] = B[D * 3 + 2] = H;
  }
}