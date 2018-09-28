kernel void fn_A(global int* A, unsigned int B, global int* C, unsigned int D, unsigned int E, unsigned int F, unsigned int G, unsigned int H, unsigned int I) {
  int J = get_global_id(0);
  unsigned int K = 0;

  if (J > E - 1)
    return;

  if ((J == E - 1) && ((G & (~(~I >> H))) == 0)) {
    K = ((A[B + J] & ~I) >> H);
  } else {
    K = ((A[B + J] & ~I) >> H) | ((A[B + J + 1] & I) << (32 - H));
  }

  if (J == 0) {
    C[D] = (C[D] & F) | (K & (~F));
  } else if (J == E - 1) {
    C[J + D] = (K & G) | (C[J + D] & (~G));
  } else {
    C[J + D] = K;
  }
}