const sampler_t a = 0x0000 | 0x0004 | 0x0000; float A(float b, float c, float d) {
  if (d > 1.0)
    d = 1.0;
  else if (d <= 0)
    d = 0.0;
  float e = b * (1.0 - d) + d * c;

  return e;
}

float B(float f) {
  if (f < 0)
    return f * -1;
  return f;
}

__kernel void C(__read_only image2d_t g, __read_only image2d_t h, __write_only image2d_t i) {
  int j = get_global_id(0);
  int k = get_global_id(1);

  int2 l = (int2)(j, k);

  int2 m = get_image_dim(h);
  float4 n;
  n.x = 255;
  n.y = 0;
  n.z = 0;
  n.w = 255;

  int3 o[] = {

      {30, 31, 33},    {31, 36, 45},    {32, 45, 40},

      {255, 255, 255}, {201, 228, 239}, {224, 226, 232}, {161, 180, 167},

      {88, 110, 62},   {135, 151, 90},

      {48, 73, 45},    {79, 101, 66},

      {102, 122, 77},  {69, 109, 64},

      {255, 249, 180}, {252, 227, 132}, {206, 131, 68},  {185, 132, 71},

      {207, 204, 107}, {233, 216, 107}, {227, 213, 111},

      {144, 182, 114}, {67, 102, 67},

      {115, 159, 80},  {72, 110, 67},

      {41, 61, 40},    {55, 77, 51},    {49, 76, 47},

      {45, 69, 42},    {48, 74, 45},    {60, 89, 56}};

  int3 p[] = {{146, 166, 118}, {145, 162, 132}, {162, 179, 151}, {184, 200, 168}, {215, 226, 196}, {158, 169, 149}};

  float q = read_imagef(g, a, l).x;
  float r = read_imagef(h, a, l).x;

  if (q < 1) {
    int s = (l.x + l.y) % 2;
    n.x = A(o[0].x, o[0 + s].x, B(sin(l.x / 256.0)));
    n.y = A(o[0].y, o[0 + s].y, B(sin(l.x / 256.0)));
    n.z = A(o[0].z, o[0 + s].z, B(sin(l.x / 256.0)));
  }

  write_imagef(i, l, n);
}