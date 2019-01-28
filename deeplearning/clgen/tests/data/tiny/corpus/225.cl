typedef struct position_ { float4 b; } position_t;

typedef struct acceleration_ { float4 a; } acceleration_t;

inline float4 A(float4 a, float4 b, float4 c) {
  float4 d;

  float4 e;
  const float4 f = {1.0f, 1.0f, 1.0f, 1.0f};
  const float4 g = {0.0f, 0.0f, 0.0f, 0.0f};

  e.x = a.x - a.x;
  e.y = a.y - a.y;
  e.z = a.z - a.z;

  d.x = b.x - a.x;
  d.y = b.y - a.y;
  d.z = b.z - a.z;

  float4 h = ((isnotequal(e, d)) ? (f) : (g));

  float i = (d.x) * (d.x) + (d.y) * (d.y) + (d.z) * (d.z) + .000001f;

  float j = 1.0f / sqrt(i);

  float k = (j) * (j) * (j);

  float l = b.w * k;

  c.x += d.x * l;
  c.y += d.y * l;
  c.z += d.z * l;

  c.w -= b.w * j * h.x;

  return c;
}

__kernel void B(__global position_t* m, __global acceleration_t* c, float n, __local float4* o) {
  size_t p = get_group_id(0);
  size_t q = get_num_groups(0);
  size_t r = get_local_id(0);
  size_t s = get_global_size(0);

  size_t t = p * 64 + r;
  float4 a = m[t].b;
  float4 u = {0.0f, 0.0f, 0.0f, 0.0f};
  floansize_t w, x, y;

  for (w = 0, y = 0; w < s; w += 64, ++y) {
    size_t z = y * 64 + r;
    for (x = 0; x < 64; ++x) {
      u = A(a, m[z].b, u);
    }
  }

  c[t].a = u * v;
}