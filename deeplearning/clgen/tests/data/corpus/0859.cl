__kernel void fn_A(__global uchar* A, __global uchar* B, __global uchar* C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);

  const size_t H = F * E + G;
  const size_t I = (F - 1) * E + G;
  const size_t J = (F - 1) * E + (G + 1);
  const size_t K = F * E + (G + 1);
  const size_t L = (F + 1) * E + (G + 1);
  const size_t M = (F + 1) * E + G;
  const size_t N = (F + 1) * E + (G - 1);
  const size_t O = F * E + (G - 1);
  const size_t P = (F - 1) * E + (G - 1);

  switch (C[H]) {
    case 0:

      if (A[H] <= A[K] || A[H] <= A[O]) {
        B[H] = 0;
      }

      else {
        B[H] = A[H];
      }
      break;

    case 45:

      if (A[H] <= A[J] || A[H] <= A[N]) {
        B[H] = 0;
      }

      else {
        B[H] = A[H];
      }
      break;

    case 90:

      if (A[H] <= A[I] || A[H] <= A[M]) {
        B[H] = 0;
      }

      else {
        B[H] = A[H];
      }
      break;

    case 135:

      if (A[H] <= A[P] || A[H] <= A[L]) {
        B[H] = 0;
      }

      else {
        B[H] = A[H];
      }
      break;

    default:
      B[H] = A[H];
      break;
  }
}