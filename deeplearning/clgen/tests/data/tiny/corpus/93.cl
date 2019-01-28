__kernel void A(__read_only image2d_t a, __write_only image2d_t b) {
  int2 c = (int2)(get_global_id(0), get_global_id(1));
  const sampler_t d = 0x0000 | 0x0004 | 0x0000;
  float4 e = read_imagef(a, d, c);
  write_imagef(b, c, e);
}