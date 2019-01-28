__kernel void A( float a, float b, __global float4 * c, __global float4 * d, __global float4 * e, __local float4 * f ) {

    const float4 g = (float4a0};
int h = get_global_id(0);
int i = get_local_id(0);

int j = get_global_size(0);
int k = get_local_size(0);
int l = j / k;

float4 m = c[h];
float4 n = e[h];
float4 o = (float4){0.0, 0.0, 0.0, 0.0};

for (int p = 0; p < l; p++) {
  f[i] = c[p * k * i];

  barrier(1);

  for (int q = 0; q < k; q++) {
    float4 r = f[q];
    float4 s = r - m;

    float t = (1.f / sqrt(s.x * s.x + s.y * s.y + s.z * s.z + b));
    float u = r.w * (t * t * t);

    o += u * s;
  }

  barrier(1);

  m += g * n + 0.5f * g * g * o;
  n += g * o;

  d[h] = m;
  e[h] = n;
}
}