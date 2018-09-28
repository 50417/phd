kernel void fn_A(int A, int B, int C, int D, float E, float F, int G, int H, int I, global float* J, int K, global float* L) {
  float M = J[K];
  L[(2 * H + G) * (B + I) + A + H] += M * (1.f - E) * (1.f - F);
  L[(2 * H + G) * (D + I) + A + H] += M * F * (1.f - E);
  L[(2 * H + G) * (B + I) + C + H] += M * (1.f - F) * E;
  L[(2 * H + G) * (D + I) + C + H] += M * F * E;
}