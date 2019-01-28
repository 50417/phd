__kernel void A(__read_only image2d_t a, __write_only image2d_t b, const sampler_t c, int d, int e, __global float* f, __global float* g, __global int* h) {
  write_imagef(b, (int2)(e +, d +), read_imagef(a, c, (int2)(d +, e +)));
  write_imagei(b, (int2)(e +, d +), read_imagei(a, c, (int2)(d +, e +)));
  write_imageui(b, (int2)(e +, d +), read_imageui(a, c, (int2)(d +, e +)));
  write_imageh(b, (int2)(e +, d +), read_imageh(a, c, (int2)(d +, e +)));

 write_imagef(b, (int2)(e+, d+),
  read_imagef(a, c, (float2)(f0], g0])));
 write_imagei(b, (int2)(e+, d+),
  read_imagei(a, c, (float2)(f1], g1])));
 write_imageui(b, (int2)(e+, d+),
  read_imageui(a, c, (float2)(f2], g2])));
 write_imageh(b, (int2)(e+, d+),
  read_imageh(a, c, (float2)(f3], g3])));

 h[0] = get_image_width(a);
 h[1] = get_image_height(a);

 h[4] = get_image_channel_data_type(a);
 h[5] = get_image_channel_order(a);
}