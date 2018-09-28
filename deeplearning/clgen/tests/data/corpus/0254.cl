__kernel void fn_A(__global float* A, __global int* B, __global float* C, const int D, const int E, const int F) {
  const int G = get_global_id(0);
  const int H = F * F * D * E;

  if (G < D * E) {
    const int I = B[G];
    for (int J = 0; J < F * F; J++) {
      C[J * D * E + G] = A[I * H + J * D * E + G];
    }
  }
}