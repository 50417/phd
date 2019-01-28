constant float a = 0x1.921fb6p+1f * 2.0f; constant float b = (439.0f * 0x1.921fb6p+1f) / 44100.0f; constant float c = (441.0f * 0x1.921fb6p+1f) / 44100.0f; kernel void A(int d, global float* e) {
  const int f = get_global_id(0);

  e[f] = ((f + 1) % 2) * sin((d + f) * b) + (f % 2) * sin((d + f - 1) * c);
}