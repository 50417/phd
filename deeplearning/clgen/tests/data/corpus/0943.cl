__kernel void fn_A(__global float* A, __global float* B, int C) {
  const int D = get_global_id(0);
  const int E = get_global_size(0);

  float F = 0;

  for (int G = D; G < C; G += E)
    F += B[G];

  A[D] = F;
}