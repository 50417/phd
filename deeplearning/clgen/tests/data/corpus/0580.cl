kernel void fn_A() {
  int A[(sizeof(int) == 4) - 1];
  int B[(__alignof(int) == 4) - 1];
  int C[(sizeof(long) == 8) - 1];
  int D[(__alignof(long) == 8) - 1];
  int E[(sizeof(long long) == 16) - 1];
  int F[(__alignof(long long) == 16) - 1];
  int G[(sizeof(float) == 4) - 1];
  int H[(__alignof(float) == 4) - 1];
  int I[(sizeof(double) == 8) - 1];
  int J[(__alignof(double) == 8) - 1];
  int K[(sizeof(half) == 2) - 1];
  int L[(__alignof(half) == 2) - 1];
}