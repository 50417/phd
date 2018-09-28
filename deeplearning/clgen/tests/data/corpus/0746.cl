kernel void fn_A(global uchar* A, global float* B, int C, global uchar* D, global uchar* E) {
  int F = get_global_id(1);
  int G = get_global_id(0);
  int H = get_global_size(0);
  int I = get_global_size(1);

  int J, K;

  float L = 0;

  int M, N, O;
  global int* P;

  L = 0;

  for (O = 0; O < 2 * C + 1; O++) {
    if ((F + O - C) < 0)
      M = O;
    else if ((H - 1) - (F + O + C) < 0)
      M = H - 1 - O;
    else
      M = F + O - C;

    L += B[O] * A[G * H + M];
  }
  E[G * H + F] = L;

  L = 0;
  for (O = 0; O < 2 * C + 1; O++) {
    if ((G + O - C) < 0)
      N = O;
    else if ((H - 1) - (G + O + C) < 0)
      N = I - 1 - O;
    else
      N = G + O - C;

    L += B[O] * E[N * H + F];
  }
  D[G * H + F] = convert_uchar(L);
}