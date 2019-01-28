typedef float2 vec2; typedef float3 vec3; typedef float4 vec4; float A(float a, float b) {
  return a - b * __clc_floor(a / b);
}

float2 A(float2 c, float2 d) { return (floct2)dcx),dAy));
}

float3 A(float3 c, float3 d) { return (floct3)dcx),dcy),dAz));
}

inline vec3 B(vec3 e, vec3 f) {
  return e - 2.0f * dot(f, e) * f;
}

inline uint C(float4 g) {
  uint h;
  h = (((uint)g.x)) | (((uint)g.y) << 8) | (((uint)g.z) << 16);
  return h;
}

float D(vec3 i) {
  return max(i.x, max(i.y, i.z));
}

float E(vec3 i, vec3 d) {
  vec3 j = __clc_fabs(i) - d;
  float k = D(j);
  return min(k, fast_length(max(j, 0.0f)));
}

vec4 F(vec3 i) {
  float l = E(i, (vec3)(1.0f));
  float4 m = (vec4)(l, 1.f, 0.f, 0.f);

  float n = 1.0f;
  for (int o = 0; o < 3; o++) {
    vec3 c = A(i * n, 2.0f) - 1.0f;
    n *= 3.0f;
    float p = __clc_fabs(1.0f - 3.0f * __clc_fabs(c.x));
    float q = __clc_fabs(1.0f - 3.0f * __clc_fabs(c.y));
    float r = __clc_fabs(1.0f - 3.0f * __clc_fabs(c.z));

    float s = max(p, q);
    float t = max(q, r);
    float u = max(r, p);
    float v = (min(s, min(t, u)) - 1.0f) / n;
    if (v > l) {
      l = v;
      m = (vec4)(l, 0.2f * stu(1.0f + (float)(o)) / 4.0f, 0.0f);
    }
  }
  return (vec4)(m, m, m, 0.f);
}

vec4 G(vec3 w, vec3 x) {
  float y = 0.0f;
  for (int z = 0; z < 64; z++) {
    vec4 aa = F(w + x * y);
    if (aa.x < 0.002f)
      return (vec4)(y, aaa.yzw);
    y += aa.x;
  }
  return (vec4)(-1.0f);
}

vec3 H(vec3 ab) {
  vec3 ac = (vec3)(.001f, 0.0f, 0.0f);
  vec3 ad = (vec3)(0.0f, .001f, 0.0f);
  vec3 ae = (vec3)(0.0f, 0.0f, .001f);
  vec3 af;
  af.x = F(ab + ac).x - F(ab - ac).x;
  af.y = F(ab + ad).x - F(ab - ad).x;
  af.z = F(ab + ae).x - F(ab - ae).x;
  return fast_normalize(af);
}

__kernel void I(__global uint* ag, float ah, float ai, int aj) {
  vec2 ak = (vec2)(get_global_id(0), get_global_id(1));
    vec2 i=-1.0f+2.0f*ak.xy/(vec2)(aai


    vec3 al = fast_normalize((vec3)(1.0f,0.8f,-0.6f));

    float am = 1.f;

    vec3 w = 1.1f*(vec3)(2.5f*cos(0.5f*am.5f*cos(am3f),2.5f*sin(0.5f*am
    vec3 an = fast_normalize((vec3)(0.0f) - w);
    vec3 ao = fast_normalize(cross( (vec3)(0.0f,1.0f,0.0f), an ));
    vec3 ap = fast_normalize(cross(an,ao));
    vec3 x = fast_normalize( i.x*ao + i.y*ap + 1.5f*an );
    vec3 aq = (vec3)(0.0f);
    vec4 ar = G(w,x);
    if( ar.x>0.0f )
    {
    vec3 ab = w + ar.x * x;
    vec3 af = H(ab);

    float as = max(0.4f + 0.6f * dot(af, al), 0.0f);
        float at = max(0.4f + 0.6f*dot(af,(vec3)(-alal-al),0.0f);


        float au = 4.0f;
        vec4 av = G( ab + al*au, -al );
        if( av.x>0.0f && av.x<(au-0.01f) ) as=0.0f;

        float aw = ar.y;
        aq = 1.0f*aw*(vec3) (0.2f,0.2f,0.2f);
        aq += 2.0f*(0.5f+0.5f*aw)*as*(vec3)(1.0f,0.97f,0.85f);
        aq += 0.2f*(0.5f+0.5f*aw)*at*(vec3)(1.0f,0.97f,0.85f);
        aq += 1.0f*(0.5f+0.5f*aw)*(0.5f+0.5f*af.y)*(vec3)(0.1f,0.15f,0.2f);


        aq = aq*0.5f+0.5f*sqrt(aq)*1.2f;

        vec3 ax = (vec3)(
            0.6f+0.4f*cos(5.0f+6.2831f*ar),
            0.6f+0.4f*cos(5.4f+6.2831f*ar),
            0.6f+0.4f*cos(5.7f+6.2831f*ar) );
        aq *= ax;
        aq *= 1.5f*exp(-0.5f*ar.x);
    }


  vec4 ay = (vec4)(aq1.0f);
  do {
        const vec4 az = 255.f * max(min(ay, (vec4)(1.f)), (vec4)(0.f));
        ag[get_global_id(0) + get_global_id(1) * aj] = C(az); } while (0);
}