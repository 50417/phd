constant sampler_t gb_A = 2 | 1 | 0x10; void fn_A(image1d_t A) {
}

void fn_B(image1d_array_t A) {
}

void fn_C(image1d_buffer_t A) {
}

void fn_D(image2d_t A) {
}

void fn_E(image2d_array_t A) {
}

void fn_F(image3d_t A) {
}

void fn_G(sampler_t A) {
}

kernel void fn_H(image1d_t A) {
  sampler_t B = 2 | 1 | 0x20;

  event_t C;

  fn_G(B);

  fn_G(gb_A);
}

void __attribute__((overloadable)) fn_I(image1d_t A, image2d_t B, image2d_t C) {
}