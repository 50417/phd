__attribute__((__overloadable__)) float fn_A(float A) {
  return A * half_rsqrt(dot(A, A));
}

__attribute__((__overloadable__)) float2 fn_A(float2 A) {
  return A * half_rsqrt(dot(A, A));
}

__attribute__((__overloadable__)) float3 fn_A(float3 A) {
  return A * half_rsqrt(dot(A, A));
}

__attribute__((__overloadable__)) float4 fn_A(float4 A) {
  return A * half_rsqrt(dot(A, A));
}