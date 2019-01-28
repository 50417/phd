__kernel void A(__global float4* a, __global float4* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);

  int e = get_local_id(0);
  int f = get_group_id(0);
  int g = get_local_size(0);
  int h = get_global_offset(0);

  int i = e + f * g + h;

  b[(c)*1024 + (d)] = a[(c)*1024 + (d)].s0;
}