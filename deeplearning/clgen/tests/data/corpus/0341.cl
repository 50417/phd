__kernel void fn_A(const int A, __global int* B, __global int* C) {
  unsigned int D = get_global_id(0);
  unsigned int E = get_global_id(1);
  unsigned int F = D + A * E;
  unsigned int G = 0;

  unsigned int H = 0;
  unsigned int I = A * A;

  int J = 0;
  int K = 0;

  J = -20;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -20;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -20;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -20;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -20;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -19;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -18;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -17;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -17;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -17;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -17;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -16;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -16;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -16;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -16;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -15;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -14;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -13;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = -16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -12;
  K = 16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = -16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -11;
  K = 16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -10;
  K = 17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = -17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -9;
  K = 17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -8;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -7;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -6;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -5;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -4;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -3;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -2;
  K = 20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = -1;
  K = 20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 0;
  K = 20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 1;
  K = 20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 2;
  K = 20;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 3;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 4;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 5;
  K = 19;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 6;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 7;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = -18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 8;
  K = 18;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = -17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 9;
  K = 17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 10;
  K = 17;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = -16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 11;
  K = 16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = -16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 12;
  K = 16;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = -15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 13;
  K = 15;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = -14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 14;
  K = 14;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = -13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 15;
  K = 13;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 16;
  K = -12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 16;
  K = -11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 16;
  K = 11;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 16;
  K = 12;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 17;
  K = -10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 17;
  K = -9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 17;
  K = 9;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 17;
  K = 10;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = -8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = -7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = -6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = 6;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = 7;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 18;
  K = 8;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = -5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = -4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = -3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = 3;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = 4;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 19;
  K = 5;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 20;
  K = -2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 20;
  K = -1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 20;
  K = 0;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 20;
  K = 1;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }

  J = 20;
  K = 2;
  H = ((F + J % A) % A + E * A + A * K) % I;
  if (B[H] == 1) {
    G += 1;
  }
  int L = 0;

  if (G >= 180 && G <= 240) {
    L = 1;
  }
  if (G >= 124 && G <= 146) {
    L = 1;
  }
  if (G >= 50 && G <= 55) {
    L = 1;
  }
  if (G == 19) {
    L = 1;
  }

  C[F] = L;
}