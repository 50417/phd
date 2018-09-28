kernel void fn_A(__read_only image2d_t A, global uchar* B, unsigned int C, unsigned int D, unsigned int E, unsigned int F, unsigned int G, unsigned int H, unsigned int I) {
  int J = get_global_id(0);
  int K = get_global_id(1);
  int L = get_global_id(2);
  uint4 M = (uint4)(0);
  int2 N;
  if ((J >= C) || (K >= D) || (L >= E))
    return;
  N.x = F + J;
  N.y = G + K;
  I += (L * D + K) * C + J;
  M.x = B[I];
  write_imageui(A, N, M);
}