__kernel void fn_A() {
  int A = 0, B = -1, C = -2;
  unsigned D = 1, E = 2, F = 3;
  A = 127;
  A = abs(D);
  A = abs_diff(E, F);
  A = add_sat(B, C);
  A = hadd(B, C);
  A = rhadd(B, C);
  A = clz(A);
  A = clamp(A, B, C);
  A = (mul_hi((A), (B)) + (C));
  A = mad_sat(A, B, C);
  A = max(B, C);
  A = min(B, C);
  A = mul_hi(B, C);
  A = rotate(B, C);
  A = sub_sat(B, C);
  long G = upsample(A, D);
  A = mad24(A, B, C);
  A = mul24(B, C);
}