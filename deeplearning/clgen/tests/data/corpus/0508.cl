inline unsigned int fn_A(unsigned int A, unsigned int B) {
  return (B < A) ? B : A;
}
__kernel void fn_B(__global unsigned int* A, __global unsigned int* B, const unsigned int C, const unsigned int D) {
  unsigned int E = get_local_id(0);
  unsigned int F = get_group_id(0);

  unsigned int G = D;
  unsigned int H = F * C;

  unsigned int I = A[H + E];

  unsigned int J = A[H + G];
  unsigned int K = A[G * C + E];

  unsigned int L = J + K;

  if (L < I) {
    A[H + E] = L;
    B[H + E] = G;
  }
  A[H + E] = fn_A(A[H + E], A[H + G] + A[G * C + E]);
}