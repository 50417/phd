__kernel void fn_A(__global uint4* A, __const __global uint* B, const unsigned int C, const unsigned int D, const unsigned int E, const unsigned int F) {
  unsigned int G = get_global_id(0);

  unsigned int H = D + F * G;
  unsigned int I = H + F - 1;

  unsigned int J = B[H];
  unsigned int K = B[I];

  if ((J > C) || (K < C)) {
    return;
  } else {
    A[0].x = H;
    A[0].y = I;
    A[0].w = 1;
  }
}