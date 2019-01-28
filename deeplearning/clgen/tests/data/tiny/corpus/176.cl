__kernel void A(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  b[c] = d;
}

__kernel void B(__global const float4* a, __global const float4* e, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 f = e[c];
  float4 g;
  float h;
  float i;
  float j = d.w + f.w;

  j = j == 0 ? 1 : j;

  h = d.w / j;
  i = 1.0f - h;

  g.xyz = h * d.xyz + i * f.xyz;
  g.w = j;
  b[c] = g;
}