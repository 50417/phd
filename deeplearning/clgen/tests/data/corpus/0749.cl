__constant int gb_A = 1; __constant int gb_B = 0; __constant int gb_C = 0; __kernel void fn_A(__global int* A) {
  char B = 123;
  uchar C = 123;
  short D = 123;
  ushort E = 123;
  int F = 123;
  uint G = 123;
  long H = 123;
  ulong I = 123;

  float J = 123.0;

  double K = 123.0;

  A[get_global_id(0)] = 1;
}