float __attribute__((overloadable)) fn_A(float); typedef float float4 __attribute__((ext_vector_type(4))); int fn_B(__constant const char* A, ...); void fn_C(void) {
  float4 A;
  fn_B("%8.4v4hlf\n", A);
}