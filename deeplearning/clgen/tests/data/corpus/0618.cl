__kernel void fn_A() {
  double4 A;
  double B;
  A.x = 42.0f;
  A.y = 42.0f;
  A.z = 42.0f;
  A.w = 42.0f;
  B = A.x;
  B = A.y;
  B = A.z;
  B = A.w;
}