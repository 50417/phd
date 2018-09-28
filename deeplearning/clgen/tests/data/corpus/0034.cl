constant sampler_t gb_A = 2 | 1 | 0x20; void fn_A(sampler_t A) {
}

kernel void fn_B(sampler_t A) {
  sampler_t B = 2 | 1 | 0x10;

  fn_A(B);

  fn_A(B);

  fn_A(gb_A);

  fn_A(A);
}