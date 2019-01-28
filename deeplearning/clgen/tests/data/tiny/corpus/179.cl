__kernel void A(__global float* a, __global float8* b) {
  size_t c = get_global_id(0);
  size_t d = c * sizeof(float8);
  float8 e = vload8(d, a);
  b[d].s0 = e.s0;
  b[d].s1 = e.s1;
  b[d].s2 = e.s2;
  b[d].s3 = e.s3;
  b[d].s4 = e.s4;
  b[d].s5 = e.s5;
  b[d].s6 = e.s6;
  b[d].s7 = e.s7;
}

__kernel void B(__global float8* a, __global float8* b) {
  size_t c = get_global_id(0);
  b[c] = a[c];
}