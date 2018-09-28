sampler_t gb_A = 0x0000 | 0x0004 | 0x0000; __kernel void fn_A(__read_only image2d_t A, uint B, uint C, __global float* D, __global float* E) {
  int F = get_global_id(0), G = get_global_id(1);
  if (F >= B || G >= C)
    return;

  int H = G * B + F;

  uint2 I = (uint2)0;

  int J = H - B, K = H + B;
  bool L = F < B - 1, M = G < C - 1, N = G, O = F;
  if (N) {
    if (O)
      I += (uint2)(1, 1) * (uint2)((read_imageui(A, gb_A, (int2)(F - 1, G - 1)).x + read_imageui(A, gb_A, (int2)(F - 1, G - 1)).y + read_imageui(A, gb_A, (int2)(F - 1, G - 1)).z) * read_imageui(A, gb_A, (int2)(F - 1, G - 1)).w / 255 / 3);
    I += (uint2)(2, 0) * (uint2)((read_imageui(A, gb_A, (int2)(F, G - 1)).x + read_imageui(A, gb_A, (int2)(F, G - 1)).y + read_imageui(A, gb_A, (int2)(F, G - 1)).z) * read_imageui(A, gb_A, (int2)(F, G - 1)).w / 255 / 3);
    if (L)
      I += (uint2)(1, -1) * (uint2)((read_imageui(A, gb_A, (int2)(F + 1, G - 1)).x + read_imageui(A, gb_A, (int2)(F + 1, G - 1)).y + read_imageui(A, gb_A, (int2)(F + 1, G - 1)).z) * read_imageui(A, gb_A, (int2)(F + 1, G - 1)).w / 255 / 3);
  }

  if (O)
    I += (uint2)(0, 2) * (uint2)((read_imageui(A, gb_A, (int2)(F - 1, G)).x + read_imageui(A, gb_A, (int2)(F - 1, G)).y + read_imageui(A, gb_A, (int2)(F - 1, G)).z) * read_imageui(A, gb_A, (int2)(F - 1, G)).w / 255 / 3);
  I += (uint2)(0, 0) * (uint2)((read_imageui(A, gb_A, (int2)(F, G)).x + read_imageui(A, gb_A, (int2)(F, G)).y + read_imageui(A, gb_A, (int2)(F, G)).z) * read_imageui(A, gb_A, (int2)(F, G)).w / 255 / 3);
  if (L)
    I += (uint2)(0, -2) * (uint2)((read_imageui(A, gb_A, (int2)(F + 1, G)).x + read_imageui(A, gb_A, (int2)(F + 1, G)).y + read_imageui(A, gb_A, (int2)(F + 1, G)).z) * read_imageui(A, gb_A, (int2)(F + 1, G)).w / 255 / 3);

  if (M) {
    if (O)
      I += (uint2)(-1, 1) * (uint2)((read_imageui(A, gb_A, (int2)(F - 1, G + 1)).x + read_imageui(A, gb_A, (int2)(F - 1, G + 1)).y + read_imageui(A, gb_A, (int2)(F - 1, G + 1)).z) * read_imageui(A, gb_A, (int2)(F - 1, G + 1)).w / 255 / 3);
    I += (uint2)(-2, 0) * (uint2)((read_imageui(A, gb_A, (int2)(F, G + 1)).x + read_imageui(A, gb_A, (int2)(F, G + 1)).y + read_imageui(A, gb_A, (int2)(F, G + 1)).z) * read_imageui(A, gb_A, (int2)(F, G + 1)).w / 255 / 3);
    if (L)
      I += (uint2)(-1, -1) * (uint2)((read_imageui(A, gb_A, (int2)(F + 1, G + 1)).x + read_imageui(A, gb_A, (int2)(F + 1, G + 1)).y + read_imageui(A, gb_A, (int2)(F + 1, G + 1)).z) * read_imageui(A, gb_A, (int2)(F + 1, G + 1)).w / 255 / 3);
  }

  uint2 P = I * I;
  D[H] = sqrt((float)(P.x + P.y));
  E[H] = atan2((float)I.y, (float)I.x);
}

__kernel void fn_B(__global const float* A, float B, __global uchar4* C) {
  int D = get_global_id(0);
  uchar E = A[D] / B * 255;
  C[D] = (uchar4)(E, E, E, 255);
}