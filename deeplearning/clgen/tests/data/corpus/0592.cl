constant sampler_t gb_A = 7; void fn_A(image1d_t A) {
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
  sampler_t B = 5;

  event_t C;

  fn_G(B);

  fn_G(gb_A);
}