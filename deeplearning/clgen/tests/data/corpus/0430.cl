void __attribute__((overloadable)) fn_A(sampler_t, read_only image1d_t); void __attribute__((overloadable)) fn_A(sampler_t, read_only image2d_t); constant sampler_t gb_A = 5; void kernel fn_B(read_only image1d_t A, read_only image2d_t B) {
  const sampler_t C = 10;
  fn_A(gb_A, A);
  fn_A(C, B);
}