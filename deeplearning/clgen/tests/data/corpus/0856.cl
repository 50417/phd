struct ray {
  float4 org;
  float4 dir;
};

float4 fn_A(struct ray A, float B) {
  return A.org + A.dir * B;
}

float4 fn_B(float16 A, float4 B) {
  float4 C;
  C = A.s0123 * B.x;
  C += A.s4567 * B.y;
  C += A.s89ab * B.z;
  C += A.scdef * B.w;
  return C;
}

float2 fn_C(float4 A) {
  return (float2)(acos(A.y), atan2(A.x, A.z));
}

float4 fn_D(float A, float B) {
  float C = 1.0f - 2.0f * A;
  float D = sqrt(max(0.0f, 1.0f - C * C));
  float E = 2.0f * ((float)3.14159265358979323846) * B;
  float F = D * cos(E);
  float G = D * sin(E);
  return (float4)(F, G, C, 0.0f);
}

float4 fn_E(float4 A) {
  float4 B;
  B.x = A.x <= 0.0031308f ? 12.92f * A.x : 1.055f * __clc_pow(A.x, 1.0f / 2.4f) - 0.055f;
  B.y = A.y <= 0.0031308f ? 12.92f * A.y : 1.055f * __clc_pow(A.y, 1.0f / 2.4f) - 0.055f;
  B.z = A.z <= 0.0031308f ? 12.92f * A.z : 1.055f * __clc_pow(A.z, 1.0f / 2.4f) - 0.055f;
  B.w = A.w;
  return B;
}

float4 fn_F(float4 A) {
  float4 B;
  B.x = A.x <= 0.04045f ? A.x / 12.92f : __clc_pow((A.x + 0.055f) / 1.055f, 2.4f);
  B.y = A.y <= 0.04045f ? A.y / 12.92f : __clc_pow((A.y + 0.055f) / 1.055f, 2.4f);
  B.z = A.z <= 0.04045f ? A.z / 12.92f : __clc_pow((A.z + 0.055f) / 1.055f, 2.4f);
  B.w = A.w;
  return B;
}