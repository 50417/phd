__kernel void A(__global uchar4* a, __global uchar4* b) {
  uint c = get_global_id(0);
  uint d = get_global_id(1);

  uint e = get_global_size(0);
  uint f = get_global_size(1);

  float4 g = (float4)(0);
  float4 h = (float4)(0);
  if (c >= 1 && c < (e - 1) && d >= 1 && d < f - 1) {
    float4 i = convert_float4(a[(c - 1) + (d - 1) * e]);
    float4 j = convert_float4(a[c + (d - 1) * e]);
    float4 k = convert_float4(a[(c + 1) + (d - 1) * e]);
    float4 l = convert_float4(a[(c - 1) + d * e]);
    float4 m = convert_float4(a[c + d * e]);
    float4 n = convert_float4(a[(c + 1) + d * e]);
    float4 o = convert_float4(a[(c - 1) + (d + 1) * e]);
    float4 p = convert_float4(a[c + (d + 1) * e]);
    float4 q = convert_float4(a[(c + 1) + (d + 1) * e]);

    g = i + (float4)(2) * j + k - o - (float4)(2) * p - q;

    h = i - k + (float4)(2) * l - (float4)(2) * n + o - q;

    b[c + d * e] = convert_uchar4(hypot(g, h) / (float4)(2));
  }
}