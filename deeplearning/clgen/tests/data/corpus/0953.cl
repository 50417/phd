__kernel void fn_A(__global float* A, __global float* B, __global float* C) {
  const int D = 4;
  const int E = 4;

  int F = get_global_id(0);
  int G = get_global_id(1);

  if (F < D && G < E) {
    float H = 0.0;

    for (int I = 0; I < D; ++I) {
      H += A[F * E + I] * B[F * E + G];
    }

    C[F * E + G] = H;
  }
}