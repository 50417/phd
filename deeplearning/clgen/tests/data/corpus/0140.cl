__kernel void fn_A(__global float* A, __global float* B, __local float* C, const uint D) {
  int E = get_local_id(0);

  int F = 1;

  C[2 * E] = B[2 * E];
  C[2 * E + 1] = B[2 * E + 1];

  for (int G = D >> 1; G > 0; G >>= 1) {
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      C[I] += C[H];
    }
    F *= 2;
  }

  if (E == 0) {
    C[D - 1] = 0;
  }

  for (int G = 1; G < D; G *= 2) {
    F >>= 1;
    barrier(1);

    if (E < G) {
      int H = F * (2 * E + 1) - 1;
      int I = F * (2 * E + 2) - 1;

      float J = C[H];
      C[H] = C[I];
      C[I] += J;
    }
  }

  barrier(1);

  A[2 * E] = C[2 * E];
  A[2 * E + 1] = C[2 * E + 1];
}