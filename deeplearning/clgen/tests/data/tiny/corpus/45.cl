uint A(uint a, uint b, uint c, uint d, uint e, uint f) {
  uint g = a * e + c;
  uint h = b * e + d;

  return (h * f + g);
}
__kernel void B(__global float* i, __global float* j, __global float* k, __local float* l, const uint m, const uint e, const uint n)

{
  uint g = get_global_id(0);
  uint h = get_global_id(1);

  uint o = get_group_id(0);
  uint p = get_group_id(1);

  uint q = get_local_id(0);
  uint r = get_local_id(1);

  uint s = h * m + g;

  float t = 0.0f;

  for (uint u = 0; u < e; u++) {
    uint v = (n) ? q * e + u : u * e + q;
    uint w = A(o, p, r, u, e, m);

    t += k[v] * j[w];
  }
  l[r * e + q] = t;

  barrier(1);

  t = 0.0f;

  for (uint u = 0; u < e; u++) {
    uint v = q * e + u;
    uint w = (n) ? r * e + u : u * e + r;

    t += l[v] * k[w];
  }
  i[s] = t;
}