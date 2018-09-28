float fn_A(float A, uchar B) {
  if (__clc_fabs(A) > 0)
    A -= (A * 0.064493000507354736);
  else
    A = 0;

  if (B)
    A += -2.4271199703216553;

  return A;
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C, __global int* D, __global float* E, __global float* F) {
  int G = get_global_id(0);
  float H = A[G];
  float I = B[G];
  float J = C[G];
  int K = D[G];
  uchar L = 0;
  uchar M = 0;

  I = fn_A(I, L);

  H += (I + J - (H * 0.039210598915815353f));

  if (K > 0) {
    K--;
    L = 0;
  } else if (H > 20.0f)
    L = 1;
  else
    L = 0;

  if (M)
    K = 10;

  E[G] = H;
  B[G] = I;
  D[G] = K;
}