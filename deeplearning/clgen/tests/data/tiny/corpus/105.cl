kernel void A(global float* a, global double* b) {
  int c = get_global_id(0);
  float d = 1.234567890123456789f;
  if (c < 14)
    b[c] = d * (d + a[c]);
  else
    b[c] = 14;
}