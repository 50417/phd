typedef float2 vec2; typedef float3 vec3; typedef float4 vec4; vec3 A(vec3 a, vec3 b) {
  return a - 2.0f * dot(b, a) * b;
}

uint B(float4 c) {
  uint d;
  d = (((uint)c.x)) | (((uint)c.y) << 8) | (((uint)c.z) << 16);
  return d;
}
float C(vec3 e) {
  float f = (sin(e.x) + e.y * .25f) * .35f;
  e = (vec3)(cos(f) * e.x - sin(f) * e.y, sin(f) * e.x + cos(f) * e.y, e.z);
  return dot(cos(e) * cos(e), (vec3)(1.f)) - 1.2f;
}

vec3 D(vec3 e, vec3 g) {
  float h = 0.0f;
  float i = 0.2f;
  float j = 0.0f;
  float k = 0.0f;
  for (int l = 0; l < 50; l++) {
    j = C(e + g * h);
    if (j > 0.0f) {
      k = j;
      h += i;
    }
  }

  if (j > 0.0f)
    return (vec3)(.93f, .94f, .85f);

  h = h - i * j / (j - k);

  vec3 m = (vec3)(0.1f, 0.0f, 0.0f);
  vec3 n = (vec3)(0.0f, 0.1f, 0.0f);
  vec3 o = (vec3)(0.0f, 0.0f, 0.1f);
  vec3 p = e + g * h;
    vec3 q=-fast_normalize((vec3)(C(p+C(p+C(p+o(vec3)((sin(p*75.f)))*.01f);

    return (vec3)(mix( ((max(-dot(q,(vec3)(.577f)),0.f) + 0.125f*max(-dot(q,(vec3)(-.707f,-.707f,0.f)),0.f)))*(fmod
    (fast_length(p.xy)*20.f,2.f)<1.0f?(vec3)(.71f,.85f,.25f):(vec3)(.79f,.93f,.4f))
                           ,(vec3)(.93f,.94f,.85f), (vec3)(__clc_pow(h/9.f,5.f)) ) );
}
__kernel void E(__global uint* r, float s, float t, int u) {
  vec2 v = (vec2)(get_global_id(0), get_global_id(1));

  vec2 p;
  p.x = -1.0f + 2.0f * v.x / s;
  p.y = -1.0f + 2.0f * v.y / t;
  vec4 w = (vec4)(D((vec3)(sin(1.f * 1.5f) * .5f, cos(1.f) * .5f, 1.f), fast_normalize((vec3)(p.xy, 1.0f))), 1.0f);
  do {
    const vec4 x = 255.f * max(min(w, (vec4)(1.f)), (vec4)(0.f));
    r[get_global_id(0) + get_global_id(1) * u] = B(x);
  } while (0);
}