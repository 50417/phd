__kernel void A(const int a, __global int* b, __global int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  unsigned int f = d + a * e;
  unsigned int g = 0;

  unsigned int h = 0;
  unsigned int i = a * a;

  int j = 0;
  int k = 0;

  j = -20;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -20;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -19;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -18;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -17;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -16;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -15;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -14;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -13;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -12;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -11;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -10;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -9;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -8;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -7;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -6;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -5;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -4;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -3;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -2;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = -1;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 0;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 1;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 2;
  k = 20;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 3;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 4;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 5;
  k = 19;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 6;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 7;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = -18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 8;
  k = 18;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 9;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = -17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 10;
  k = 17;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 11;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = -16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 12;
  k = 16;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = -15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 13;
  k = 15;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = -14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 14;
  k = 14;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = -13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 15;
  k = 13;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = -11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 11;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 16;
  k = 12;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = -9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 9;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 17;
  k = 10;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = -6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 6;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 7;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 18;
  k = 8;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = -3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 3;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 4;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 19;
  k = 5;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = -1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 0;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 1;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  j = 20;
  k = 2;
  h = ((f + j % a) % a + e * a + a * k) % i;
  if (b[h] == 1) {
    g += 1;
  }

  int l = b[f];

  if (g >= 205 && g <= 999) {
    l = 0;
  }
  if (g >= 160 && g <= 180) {
    l = 0;
  }
  if (g >= 60 && g <= 80) {
    l = 0;
  }
  if (g >= 48 && g <= 51) {
    l = 1;
  }
  if (g >= 30 && g <= 45) {
    l = 0;
  }
  if (g >= 22 && g <= 23) {
    l = 1;
  }

  c[f] = l;
}