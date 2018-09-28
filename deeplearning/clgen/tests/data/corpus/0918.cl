__kernel void fn_A(__global char* A, __global char* B, int C, int D) {
  int E = get_global_id(0);
  int F = get_global_id(1);
  int G[9];
  int H = F * C + E;
  if (E < 1 || F < 1 || E > C - 2 || F > D - 2) {
    B[H] = 0;
  } else {
    G[0] = A[H - C - 1] & 0xff;
    G[1] = A[H - C] & 0xff;
    G[2] = A[H - C + 1] & 0xff;
    G[3] = A[H - 1] & 0xff;
    G[4] = A[H] & 0xff;
    G[5] = A[H + 1] & 0xff;
    G[6] = A[H + C - 1] & 0xff;
    G[7] = A[H + C] & 0xff;
    G[8] = A[H + C + 1] & 0xff;

    int I = G[0] + 2 * G[1] + G[2] - G[6] - 2 * G[7] - G[8];
    int J = G[0] + 2 * G[3] + G[6] - G[2] - 2 * G[5] - G[8];
    float K = I * I + J * J;

    int L = sqrt(K);
    if (L > 255)
      L = 255;
    B[H] = (char)L;
  }
};