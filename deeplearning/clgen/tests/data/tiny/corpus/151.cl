typedef float float2; typedef float float4; float2 A(float4 a) {
  return a.xy + a.wz;
}

float4 B(float4 a) {
  float2 b = a.ww;
  return b.xyxy + b.yxyx;
}

float4 C(float4 c, float4 d) {
  return (float4)(czw, dxy);
}