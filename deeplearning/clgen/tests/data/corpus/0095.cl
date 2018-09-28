kernel void fn_A(global char* A, global char* B, unsigned int C, unsigned int D, unsigned int E, unsigned int F, unsigned int G, unsigned int H, unsigned int I, unsigned int J, unsigned int K) {
  int L = get_global_id(0);
  int M = get_global_id(1);
  int N = get_global_id(2);
  if ((L >= C) || (M >= D) || (N >= E))
    return;
  F += N * I + M * H + L;
  G += N * K + M * J + L;
  B[G] = A[F];
}