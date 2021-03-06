inline void A(float* a) {
  float b = a[0] + a[7];
  float c = a[1] + a[6];
  float d = a[2] + a[5];
  float e = a[3] + a[4];

  float f = a[0] - a[7];
  float g = a[6] - a[1];
  float h = a[2] - a[5];
  float i = a[4] - a[3];

  float j = b + e;
  float k = b - e;
  float l = c + d;
  float m = c - d;

  a[0] = 0.35355339059327376220042218105242f * (j + l);
  a[2] = 0.35355339059327376220042218105242f * (1.3065629648763765278566431734272f * k + 0.54119610014619698439972320536639f * m);
  a[4] = 0.35355339059327376220042218105242f * (j - l);
  a[6] = 0.35355339059327376220042218105242f * (0.54119610014619698439972320536639f * k - 1.3065629648763765278566431734272f * m);

  a[1] = 0.35355339059327376220042218105242f * (1.3870398453221474618216191915664f * f - 1.1758756024193587169744671046113f * g + 0.78569495838710218127789736765722f * h - 0.27589937928294301233595756366937f * i);
  a[3] = 0.35355339059327376220042218105242f * (1.1758756024193587169744671046113f * f + 0.27589937928294301233595756366937f * g - 1.3870398453221474618216191915664f * h + 0.78569495838710218127789736765722f * i);
  a[5] = 0.35355339059327376220042218105242f * (0.78569495838710218127789736765722f * f + 1.3870398453221474618216191915664f * g + 0.27589937928294301233595756366937f * h - 1.1758756024193587169744671046113f * i);
  a[7] = 0.35355339059327376220042218105242f * (0.27589937928294301233595756366937f * f + 0.78569495838710218127789736765722f * g + 1.1758756024193587169744671046113f * h + 1.3870398453221474618216191915664f * i);
}

inline void B(float* a) {
  float n = a[0] + a[4];
  float o = 1.3065629648763765278566431734272f * a[2] + 0.54119610014619698439972320536639f * a[6];

  float p = n + o;
  float q = n - o;
  float r = 0.27589937928294301233595756366937f * a[7] + 1.3870398453221474618216191915664f * a[1] + 1.1758756024193587169744671046113f * a[3] + 0.78569495838710218127789736765722f * a[5];
  float s = 1.3870398453221474618216191915664f * a[7] - 0.27589937928294301233595756366937f * a[1] + 0.78569495838710218127789736765722f * a[3] - 1.1758756024193587169744671046113f * a[5];

  float t = a[0] - a[4];
  float u = 0.54119610014619698439972320536639f * a[2] - 1.3065629648763765278566431734272f * a[6];

  float v = t + u;
  float w = t - u;
  float x = 1.1758756024193587169744671046113f * a[1] - 0.78569495838710218127789736765722f * a[7] - 0.27589937928294301233595756366937f * a[3] - 1.3870398453221474618216191915664f * a[5];
  float y = 0.78569495838710218127789736765722f * a[1] + 1.1758756024193587169744671046113f * a[7] - 1.3870398453221474618216191915664f * a[3] + 0.27589937928294301233595756366937f * a[5];

  a[0] = 0.35355339059327376220042218105242f * (p + r);
  a[7] = 0.35355339059327376220042218105242f * (p - r);
  a[4] = 0.35355339059327376220042218105242f * (q + s);
  a[3] = 0.35355339059327376220042218105242f * (q - s);

  a[1] = 0.35355339059327376220042218105242f * (v + x);
  a[5] = 0.35355339059327376220042218105242f * (w - y);
  a[2] = 0.35355339059327376220042218105242f * (w + y);
  a[6] = 0.35355339059327376220042218105242f * (v - x);
}
__kernel void C(__global float* z, __global float* aa, uint ab, uint ac, uint ad) {
  __local float ae[16][32 + 1];
  const uint af = get_local_id(0);
  const uint ag = 8 * get_local_id(1);
  const uint ah = af & (8 - 1);
  const uint ai = get_group_id(0) * 32 + af;
  const uint aj = get_group_id(1) * 16 + ag;

  if ((ai - ah + 8 - 1 >= ad) || (aj + 8 - 1 >= ac))
    return;

  __local float* ak = &ae[ag + 0][af + 0];
  __local float* al = &ae[ag + ah][af - ah];
  aa += aj * ab + ai;
  z += aj * ab + ai;

  float a[8];
  for (uint am = 0; am < 8; am++)
    ak[am * (32 + 1)] = aa[am * ab];

  for (uint am = 0; am < 8; am++)
    a[am] = al[am];
  A(a);
  for (uint am = 0; am < 8; am++)
    al[am] = a[am];

  for (uint am = 0; am < 8; am++)
    a[am] = ak[am * (32 + 1)];
  A(a);

  for (uint am = 0; am < 8; am++)
    z[am * ab] = a[am];
}

__kernel void D(__global float* z, __global float* aa, uint ab, uint ac, uint ad) {
  __local float ae[16][32 + 1];
  const uint af = get_local_id(0);
  const uint ag = 8 * get_local_id(1);
  const uint ah = af & (8 - 1);
  const uint ai = get_group_id(0) * 32 + af;
  const uint aj = get_group_id(1) * 16 + ag;

  if ((ai - ah + 8 - 1 >= ad) || (aj + 8 - 1 >= ac))
    return;

  __local float* ak = &ae[ag + 0][af + 0];
  __local float* al = &ae[ag + ah][af - ah];
  aa += aj * ab + ai;
  z += aj * ab + ai;

  float a[8];
  for (uint am = 0; am < 8; am++)
    ak[am * (32 + 1)] = aa[am * ab];

  for (uint am = 0; am < 8; am++)
    a[am] = al[am];
  B(a);
  for (uint am = 0; am < 8; am++)
    al[am] = a[am];

  for (uint am = 0; am < 8; am++)
    a[am] = ak[am * (32 + 1)];
  B(a);
  for (uint am = 0; am < 8; am++)
    z[am * ab] = a[am];
}