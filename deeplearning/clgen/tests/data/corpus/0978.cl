typedef __attribute__((ext_vector_type(2))) unsigned int uint2; typedef __attribute__((ext_vector_type(2))) int int2; void fn_A() {
  uint2 A, B;
  int2 C = A != B;
}