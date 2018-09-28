__kernel void fn_A(__global int* A) {
  int B = 0;
  int C = (B + 1);
  int D = (C * 2);
  int E = (D - B);
  int F = (E / 2);
  A[0] = F;
}