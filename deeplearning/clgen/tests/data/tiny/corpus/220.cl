kernel void A() {
  int a[(sizeof(int) == 4) - 1];
  int b[(__alignof(int) == 4) - 1];
  int c[(sizeof(long) == 8) - 1];
  int d[(__alignof(long) == 8) - 1];
  int e[(sizeof(long long) == 16) - 1];
  int f[(__alignof(long long) == 16) - 1];
  int g[(sizeof(float) == 4) - 1];
  int h[(__alignof(float) == 4) - 1];
  int i[(sizeof(double) == 8) - 1];
  int j[(__alignof(double) == 8) - 1];
  int k[(sizeof(half) == 2) - 1];
  int l[(__alignof(half) == 2) - 1];
}