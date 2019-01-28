kernel void A(global float4* a, global float4* b, local float4* c) {
  uint d = get_global_size(0);
  uint e = get_global_size(1);
  uint f = get_local_size(0);

  uint g = get_local_id(0);
  uint h = get_local_id(1);
  uint i = get_group_id(0);
  uint j = get_group_id(1);

  uint k = 4 * (j * f + h) * d + (i * f + g);
  uint l = 4 * (i * f + h) * e + (j * f + g);

  uint m = 4 * h * f + g;
  c[m] = a[k];
  c[m + f] = a[k + d];
  c[m + 2 * f] = a[k + 2 * d];
  c[m + 3 * f] = a[k + 3 * d];

  barrier(1);

  uint n = 4 * g * f + h;
  float4 o = c[n];
  float4 p = c[n + f];
  float4 q = c[n + 2 * f];
  float4 r = c[n + 3 * f];

  b[l] = (float4)(o.x, p.x, q.x, r.x);
  b[l + e] = (float4)(o.y, p.y, q.y, r.y);
  b[l + 2 * e] = (float4)(o.z, p.z, q.z, r.z);
  b[l + 3 * e] = (float4)(o.w, p.w, q.w, r.w);
}