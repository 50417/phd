typedef __attribute__((ext_vector_type(4))) float float4; float fn_A(float A, float B) {
  return A / B;
}

float4 fn_B(float4 A, float4 B) {
  return A / B;
}

double fn_C(double A, double B) {
  return A / B;
}