__kernel void fn_A(int A, __global int* B, __global int* C, __global float* D, __global float* E, __global float* F) {
  int G = get_global_id(0);

  int H = -1;
  int I = -1;

  for (int J = G; J < A; ++J) {
    if (B[J] == G && H == -1)
      H = J;
    if (B[J] == G + 1 && H != -1 && I == -1) {
      I = J - 1;
      break;
    }
    if (J == A - 1 && H != -1 && I == -1)
      I = J;
  }
  float K = 0.0f;
  for (int J = H; J <= I; ++J)
    K += D[J] * E[C[J]];

  F[G] = K;
}
__kernel void fn_B(__global float2* A, __global float2* B, __global float* C) {
  int D = get_global_id(0);
  C[D] = dot(A[D], B[D]);

  float E = 0.0f;
  if (D == 0) {
    for (int F = 0; F < get_global_size(0); ++F)
      E += C[F];

    C[D] = E;
  }
}

__kernel void fn_C(__global float* A, __global float* B, __global float* C, __global float* D) {
  int E = get_global_id(0);
  A[E] = 0.0f;
  B[E] = D[E];
  C[E] = D[E];
}

__kernel void fn_D(__global float* A, __global float* B, __global float* C) {
  *C = (*A) / (*B);
}

__kernel void fn_E(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E) {
  int F = get_global_id(0);
  D[F] += (*A) * B[F];
  E[F] -= (*A) * C[F];
}

__kernel void fn_F(__global float* A, __global float* B, __global float* C, __global float* D) {
  int E = get_global_id(0);
  D[E] = C[E] + (*A) / (*B) * D[E];
}