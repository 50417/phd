constant sampler_t a = 7; void A(image1d_t b) {
}

void B(image1d_array_t b) {
}

void C(image1d_buffer_t b) {
}

void D(image2d_t b) {
}

void E(image2d_array_t b) {
}

void F(image3d_t b) {
}

void G(sampler_t c) {
}

kernel void H(image1d_t b) {
  sampler_t d = 5;

  event_t e;

  G(d);

  G(a);
}