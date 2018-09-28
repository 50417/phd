typedef __attribute__((ext_vector_type(4))) float float4; float4 fn_A(float4 A, float4 B, float4 C, float4 D) {
  return A < B ? C : D;
}