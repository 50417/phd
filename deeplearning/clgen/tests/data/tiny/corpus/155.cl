__kernel void A() {
  float8 a;
  float b;
  a.s0 = 42.0f;
  a.s1 = 42.0f;
  a.s2 = 42.0f;
  a.s3 = 42.0f;
  a.s4 = 42.0f;
  a.s5 = 42.0f;
  a.s6 = 42.0f;
  a.s7 = 42.0f;
  b = a.s0;
  b = a.s1;
  b = a.s2;
  b = a.s3;
  b = a.s4;
  b = a.s5;
  b = a.s6;
  b = a.s7;
}