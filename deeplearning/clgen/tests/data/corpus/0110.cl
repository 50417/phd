kernel void fn_A(__read_only image2d_t A, global uchar* B, unsigned int C, unsigned int D, unsigned int E, unsigned int F, unsigned int G, unsigned int H, unsigned int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);
  int L = get_global_id(2);
  uint4 M;
  const sampler_t N = 0x0000 | 0x0000 | 0x0000;
  int2 O;
  if ((J >= C) || (K >= D) || (L >= E))
    return;
  O.x = F + J;
  O.y = G + K;
  M = read_imageui(A, N, O);
  I += (L * D + K) * C + J;
  B[I] = M.x;
}