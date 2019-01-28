constant float a = 0x1.921fb6p+1f * 2.0f; constant float b = (440.0f * 0x1.921fb6p+1f) / 44100.0f; kernel void A(int c, global float* d) {
  const int e = get_global_id(0);

  d[e] = (e % 2) * sin((float)(c + e - 1) * b);
}