float A(int a); float B(int a, int b, int c, int d); float C(float e); float A(int a) {
  if (a == 0)
    return 0.707106781186547524f;
  else
    return 1;
}

float B(int a, int b, int c, int d) {
  return (A(a) * A(b) * 2 / 8 * cos(a * 3.14159265358979323846264338327950288 / 8 * ((float)c + 0.5f)) * cos(b * 3.14159265358979323846264338327950288 / 8 * ((float)d + 0.5f)));
}

float C(float e) {
  float f = convert_float(convert_int(e));
  float g = e - f;
  if (g < 0.5f && g > -0.5f)
    return f;
  if (g >= 0.5f)
    return f + 1.0f;
  else
    return f - 1.0f;
}

__kernel void D(__global float* h, __global float* i, __global int* j) {
  int a = get_global_id(0);
  int b = get_global_id(1);

  if (a < 8 && b < 8) {
    int k = a * 8 + b;
    i[k] = h[0] * B(a, b, 0, 0);
    i[k] += h[1] * B(a, b, 0, 1);
    i[k] += h[2] * B(a, b, 0, 2);
    i[k] += h[3] * B(a, b, 0, 3);
    i[k] += h[4] * B(a, b, 0, 4);
    i[k] += h[5] * B(a, b, 0, 5);
    i[k] += h[6] * B(a, b, 0, 6);
    i[k] += h[7] * B(a, b, 0, 7);
    i[k] += h[8] * B(a, b, 1, 0);
    i[k] += h[9] * B(a, b, 1, 1);
    i[k] += h[10] * B(a, b, 1, 2);
    i[k] += h[11] * B(a, b, 1, 3);
    i[k] += h[12] * B(a, b, 1, 4);
    i[k] += h[13] * B(a, b, 1, 5);
    i[k] += h[14] * B(a, b, 1, 6);
    i[k] += h[15] * B(a, b, 1, 7);
    i[k] += h[16] * B(a, b, 2, 0);
    i[k] += h[17] * B(a, b, 2, 1);
    i[k] += h[18] * B(a, b, 2, 2);
    i[k] += h[19] * B(a, b, 2, 3);
    i[k] += h[20] * B(a, b, 2, 4);
    i[k] += h[21] * B(a, b, 2, 5);
    i[k] += h[22] * B(a, b, 2, 6);
    i[k] += h[23] * B(a, b, 2, 7);
    i[k] += h[24] * B(a, b, 3, 0);
    i[k] += h[25] * B(a, b, 3, 1);
    i[k] += h[26] * B(a, b, 3, 2);
    i[k] += h[27] * B(a, b, 3, 3);
    i[k] += h[28] * B(a, b, 3, 4);
    i[k] += h[29] * B(a, b, 3, 5);
    i[k] += h[30] * B(a, b, 3, 6);
    i[k] += h[31] * B(a, b, 3, 7);
    i[k] += h[32] * B(a, b, 4, 0);
    i[k] += h[33] * B(a, b, 4, 1);
    i[k] += h[34] * B(a, b, 4, 2);
    i[k] += h[35] * B(a, b, 4, 3);
    i[k] += h[36] * B(a, b, 4, 4);
    i[k] += h[37] * B(a, b, 4, 5);
    i[k] += h[38] * B(a, b, 4, 6);
    i[k] += h[39] * B(a, b, 4, 7);
    i[k] += h[40] * B(a, b, 5, 0);
    i[k] += h[41] * B(a, b, 5, 1);
    i[k] += h[42] * B(a, b, 5, 2);
    i[k] += h[43] * B(a, b, 5, 3);
    i[k] += h[44] * B(a, b, 5, 4);
    i[k] += h[45] * B(a, b, 5, 5);
    i[k] += h[46] * B(a, b, 5, 6);
    i[k] += h[47] * B(a, b, 5, 7);
    i[k] += h[48] * B(a, b, 6, 0);
    i[k] += h[49] * B(a, b, 6, 1);
    i[k] += h[50] * B(a, b, 6, 2);
    i[k] += h[51] * B(a, b, 6, 3);
    i[k] += h[52] * B(a, b, 6, 4);
    i[k] += h[53] * B(a, b, 6, 5);
    i[k] += h[54] * B(a, b, 6, 6);
    i[k] += h[55] * B(a, b, 6, 7);
    i[k] += h[56] * B(a, b, 7, 0);
    i[k] += h[57] * B(a, b, 7, 1);
    i[k] += h[58] * B(a, b, 7, 2);
    i[k] += h[59] * B(a, b, 7, 3);
    i[k] += h[60] * B(a, b, 7, 4);
    i[k] += h[61] * B(a, b, 7, 5);
    i[k] += h[62] * B(a, b, 7, 6);
    i[k] += h[63] * B(a, b, 7, 7);
    i[k] = C(i[k] / j[k]) * j[k];
  }
}

__kernel void E(__global float* h, __global float* i) {
  int d = get_global_id(0);
  int c = get_global_id(1);

  if (d < 8 && c < 8) {
    int k = c * 8 + d;
    i[k] = h[0] * B(0, 0, c, d);
    i[k] += h[1] * B(0, 1, c, d);
    i[k] += h[2] * B(0, 2, c, d);
    i[k] += h[3] * B(0, 3, c, d);
    i[k] += h[4] * B(0, 4, c, d);
    i[k] += h[5] * B(0, 5, c, d);
    i[k] += h[6] * B(0, 6, c, d);
    i[k] += h[7] * B(0, 7, c, d);
    i[k] += h[8] * B(1, 0, c, d);
    i[k] += h[9] * B(1, 1, c, d);
    i[k] += h[10] * B(1, 2, c, d);
    i[k] += h[11] * B(1, 3, c, d);
    i[k] += h[12] * B(1, 4, c, d);
    i[k] += h[13] * B(1, 5, c, d);
    i[k] += h[14] * B(1, 6, c, d);
    i[k] += h[15] * B(1, 7, c, d);
    i[k] += h[16] * B(2, 0, c, d);
    i[k] += h[17] * B(2, 1, c, d);
    i[k] += h[18] * B(2, 2, c, d);
    i[k] += h[19] * B(2, 3, c, d);
    i[k] += h[20] * B(2, 4, c, d);
    i[k] += h[21] * B(2, 5, c, d);
    i[k] += h[22] * B(2, 6, c, d);
    i[k] += h[23] * B(2, 7, c, d);
    i[k] += h[24] * B(3, 0, c, d);
    i[k] += h[25] * B(3, 1, c, d);
    i[k] += h[26] * B(3, 2, c, d);
    i[k] += h[27] * B(3, 3, c, d);
    i[k] += h[28] * B(3, 4, c, d);
    i[k] += h[29] * B(3, 5, c, d);
    i[k] += h[30] * B(3, 6, c, d);
    i[k] += h[31] * B(3, 7, c, d);
    i[k] += h[32] * B(4, 0, c, d);
    i[k] += h[33] * B(4, 1, c, d);
    i[k] += h[34] * B(4, 2, c, d);
    i[k] += h[35] * B(4, 3, c, d);
    i[k] += h[36] * B(4, 4, c, d);
    i[k] += h[37] * B(4, 5, c, d);
    i[k] += h[38] * B(4, 6, c, d);
    i[k] += h[39] * B(4, 7, c, d);
    i[k] += h[40] * B(5, 0, c, d);
    i[k] += h[41] * B(5, 1, c, d);
    i[k] += h[42] * B(5, 2, c, d);
    i[k] += h[43] * B(5, 3, c, d);
    i[k] += h[44] * B(5, 4, c, d);
    i[k] += h[45] * B(5, 5, c, d);
    i[k] += h[46] * B(5, 6, c, d);
    i[k] += h[47] * B(5, 7, c, d);
    i[k] += h[48] * B(6, 0, c, d);
    i[k] += h[49] * B(6, 1, c, d);
    i[k] += h[50] * B(6, 2, c, d);
    i[k] += h[51] * B(6, 3, c, d);
    i[k] += h[52] * B(6, 4, c, d);
    i[k] += h[53] * B(6, 5, c, d);
    i[k] += h[54] * B(6, 6, c, d);
    i[k] += h[55] * B(6, 7, c, d);
    i[k] += h[56] * B(7, 0, c, d);
    i[k] += h[57] * B(7, 1, c, d);
    i[k] += h[58] * B(7, 2, c, d);
    i[k] += h[59] * B(7, 3, c, d);
    i[k] += h[60] * B(7, 4, c, d);
    i[k] += h[61] * B(7, 5, c, d);
    i[k] += h[62] * B(7, 6, c, d);
    i[k] += h[63] * B(7, 7, c, d);
  }
}