kernel void fn_A(__read_only image2d_t A, global uint4* B, unsigned int C, unsigned int D, unsigned int E, unsigned int F, unsigned int G, unsigned int H, unsigned int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);
  if ((J >= C) || (K >= D))
    return;
  uint4 L;
  const sampler_t M = 0x0000 | 0x0000 | 0x0000;
  int2 N;
  N.x = F + J;
  N.y = G + K;
  L = read_imageui(A, M, N);

  *(B + I + C * K + J) = L;
}