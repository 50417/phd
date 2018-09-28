__kernel void fn_A(__global uchar* A, __global uchar* B, __global uchar* C, size_t D, size_t E) {
  size_t F = get_global_id(0);
  size_t G = get_global_id(1);
  size_t H = get_local_id(0) + 1;
  size_t I = get_local_id(1) + 1;

  size_t J = F * E + G;

  __local int K[18][18];

  K[H][I] = A[J];

  if (H == 1) {
    K[0][I] = A[J - E];

    if (I == 1)
      K[0][0] = A[J - E - 1];

    else if (I == 16)
      K[0][17] = A[J - E + 1];
  }

  else if (H == 16) {
    K[17][I] = A[J + E];

    if (I == 1)
      K[17][0] = A[J + E - 1];

    else if (I == 16)
      K[17][17] = A[J + E + 1];
  }

  if (I == 1)
    K[H][0] = A[J - 1];
  else if (I == 16)
    K[H][17] = A[J + 1];

  barrier(1);

  uchar L = K[H][I];

  switch (C[J]) {
    case 0:

      if (L <= K[H][I + 1] || L <= K[H][I - 1]) {
        B[J] = 0;
      }

      else {
        B[J] = L;
      }
      break;

    case 45:

      if (L <= K[H - 1][I + 1] || L <= K[H + 1][I - 1]) {
        B[J] = 0;
      }

      else {
        B[J] = L;
      }
      break;

    case 90:

      if (L <= K[H - 1][I] || L <= K[H + 1][I]) {
        B[J] = 0;
      }

      else {
        B[J] = L;
      }
      break;

    case 135:

      if (L <= K[H - 1][I - 1] || L <= K[H + 1][I + 1]) {
        B[J] = 0;
      }

      else {
        B[J] = L;
      }
      break;

    default:
      B[J] = L;
      break;
  }
}