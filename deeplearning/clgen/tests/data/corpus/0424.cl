bool fn_A(const float3 A, const float3 B, float C, const float3 D, const float3 E, float* __restrict F, float* __restrict G) {
  float H = dot(E, B);

  if (H <= 0.f)
    return false;
  float I = dot((A - D), B);

  *G = I / H;
  return distance(D + (*G) * E, A) <= C;
}