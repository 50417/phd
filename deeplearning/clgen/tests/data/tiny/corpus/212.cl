__kernel void A(__global float* a) {
  const float4 b = {1.0, 1.0, 1.0, 1.0};
  vstore4(b, get_global_id(0), a);
}