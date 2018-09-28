kernel void fn_A() {
  volatile float A = 8e2f, B = 1.5f, C, D;
  int E;
  C = frexp(A, &E);
  float F;
  D = modf(B, &F);
  printf("frexp(8e2f): %.1f %d\n", C, E);
  printf("modf(1.5f): %.1f %1f\n", D, F);
}