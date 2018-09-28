float2 fn_A(float2 A, float2 B); float fn_B(float2 A); float fn_C(float2 A); float2 fn_A(float2 A, float2 B) {
  float2 C;

  C.s0 = A.s0 * B.s0 - A.s1 * B.s1;

  C.s1 = A.s1 * B.s0 + A.s0 * B.s1;

  return C;
}

float fn_B(float2 A) {
  return sqrt(A.s0 * A.s0 + A.s1 * A.s1);
}

float fn_C(float2 A) {
  return atan2(A.s1, A.s0);
}

__kernel void fn_D(__global float* A, __global float* B, __global float* C, __global float* D, __private unsigned int E, __private unsigned int F) {
  size_t G = get_global_id(0);
  size_t H = E + G;

  float2 I;
  I.s0 = A[H];
  I.s1 = A[F + H];

  float2 J;
  J.s0 = B[H];
  J.s1 = I.s0 * B[F + H];

  float2 K;
  K.s0 = C[H];
  K.s1 = C[F + H];

  float2 L;
  L.s0 = cos(I.s1);
  L.s1 = -sin(I.s1);

  I = fn_A(I, L);
  K = fn_A(K, L);

  if (G < F) {
    D[H] = (fn_B(I) - fn_B(K)) / J.s0;
    D[F + H] = (fn_C(I) - fn_C(K)) / (fn_B(I) * J.s1);
  }
}