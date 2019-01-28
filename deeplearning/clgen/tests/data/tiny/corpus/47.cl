__kernel void A(__global const float4* a, __global float4* b, float4 c) {
  int d = get_global_id(0);
  float4 e = a[d];
  float4 f = e;
  float4 g;

  g.w = e.w;

  if (c.x < 0.00001f)
    g.x = e.x;
  else if (e.x > c.x + 0.00001f)
    g.x = (e.x - c.x) / (1.0f - c.x);
  else if (e.x < c.x - 0.00001f)
    g.x = (c.x - e.x) / c.x;
  else
    g.x = 0.0f;

  if (c.y < 0.00001f)
    g.y = e.y;
  else if (e.y > c.y + 0.00001f)
    g.y = (e.y - c.y) / (1.0f - c.y);
  else if (e.y < c.y - 0.00001f)
    g.y = (c.y - e.y) / c.y;
  else
    g.y = 0.0f;

  if (c.z < 0.00001f)
    g.z = e.z;
  else if (e.z > c.z + 0.00001f)
    g.z = (e.z - c.z) / (1.0f - c.z);
  else if (e.z < c.z - 0.00001f)
    g.z = (c.z - e.z) / c.z;
  else
    g.z = 0.0f;

  if (g.x > g.y) {
    if (g.x > g.z)
      f.w = g.x;
    else
      f.w = g.z;
  } else if (g.y > g.z) {
    f.w = g.y;
  } else {
    f.w = g.z;
  }

  if (f.w >= 0.00001f) {
    f.xyz = (f.xyz - c.xyz) / f.www + c.xyz;
    f.w *= g.w;
  }

  b[d] = f;
}