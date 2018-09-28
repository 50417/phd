float2 fn_A(float2 A, float2 B); float2 fn_B(float2 A, float B); float2 fn_C(float2 A); float2 fn_D(float2 A, float2 B); float2 fn_E(float2 A); float2 fn_F(float2 A); float2 fn_G(float2 A); float2 fn_H(float2 A); float2 fn_I(float2 A); float2 fn_J(float2 A, float2 B); float2 fn_A(float2 A, float2 B) {
  return (float2)(A.x * B.x - A.y * B.y, A.x * B.y + A.y * B.x);
}

float2 fn_B(float2 A, float B) {
  float C = dot(A, A);
  return __clc_pow(C, B / 2.0f) * (float2)(cos(B * atan2(A.y, A.x)), sin(B * atan(A.y / A.x)));
}

float2 fn_C(float2 A) {
  return (float2)(A.x, -A.y) / dot(A, A);
}

float2 fn_D(float2 A, float2 B) {
  return fn_A(A, fn_C(B));
}

float2 fn_E(float2 A) {
  return (float2)(exp(A.x) * cos(A.y), exp(A.x) * sin(A.y));
}

float2 fn_F(float2 A) {
  float B = atan2(A.y, A.x);
  if (B > 0.0)
    B -= 2.0f * 3.14;
  return (float2)(log(length(A)), B);
}

float2 fn_G(float2 A) {
  return (float2)(A.x * A.x - A.y * A.y, 2.0f * A.x * A.y);
}

float2 fn_H(float2 A) {
  return (float2)(sin(A.x) * cosh(A.y), cos(A.x) * sinh(A.y));
}

float2 fn_I(float2 A) {
  return (float2)(cos(A.x) * cosh(A.y), -sin(A.x) * sinh(A.y));
}

float2 fn_J(float2 A, float2 B) {
  return fn_E(fn_A(fn_F(A), B));
}