typedef __attribute__((ext_vector_type(2))) int int2; typedef __attribute__((ext_vector_type(3))) int int3; typedef __attribute__((ext_vector_type(4))) int int4; typedef __attribute__((ext_vector_type(8))) int int8; typedef __attribute__((ext_vector_type(4))) float float4; void fn_A() {
  int4 A = (int4)(1, 2, 3, 4);
  int4 B = (int4)((int2)(1, 2), 3, 4);
  int4 C = (int4)(1, (int2)(2, 3), 4);
  int4 D = (int4)(1, 2, (int2)(3, 4));
  int4 E = (int4)((int2)(1, 2), (int2)(3, 4));
  int4 F = (int4)((int3)(1, 2, 3), 4);
  int4 G = (int4)(1, (int3)(2, 3, 4));
  int4 H = (int4)(1);
  int8 I = (int8)(1, 2, H.xy, H);
  float4 J = (float4)(1);
}