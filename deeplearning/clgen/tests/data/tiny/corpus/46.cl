__constant int a = 1; __constant int b = 0; __constant int c = 0; __kernel void A(__global int* d) {
  char e = 2;
  char f = 1;
  uchar g = 2;
  uchar h = 1;
  char4 i = (char4)(2, 4, 8, 16);
  char4 j = (char4)(1, 2, 8, 4);
  uchar4 k = (uchar4)(2, 4, 8, 16);
  uchar4 l = (uchar4)(1, 2, 8, 4);

  short m = 2;
  short n = 1;
  ushort o = 2;
  ushort p = 1;
  short4 q = (short4)(2, 4, 8, 16);
  short4 r = (short4)(1, 2, 8, 4);
  ushort4 s = (ushort4)(2, 4, 8, 16);
  ushort4 t = (ushort4)(1, 2, 8, 4);

  int u = 2;
  int v = 1;
  uint w = 2;
  uint x = 1;
  int4 y = (int4)(2, 4, 8, 16);
  int4 z = (int4)(1, 2, 8, 4);
  uint4 aa = (uint4)(2, 4, 8, 16);
  uint4 ab = (uint4)(1, 2, 8, 4);

  long ac = 2;
  long ad = 1;
  ulong ae = 2;
  ulong af = 1;
  long4 ag = (long4)(2, 4, 8, 16);
  long4 ah = (long4)(1, 2, 8, 4);
  ulong4 ai = (ulong4)(2, 4, 8, 16);
  ulong4 aj = (ulong4)(1, 2, 8, 4);
  float ak = 2;
  float al = 1;
  float4 am = (float4)(2, 4, 8, 16);
  float4 an = (float4)(1, 2, 8, 4);

  double ao = 2;
  double ap = 1;
  double4 aq = (double4)(2, 4, 8, 16);
  double4 ar = (double4)(1, 2, 8, 4);

  uint4 as = (uint4)(2, 4, 8, 16);
  int2 at = (int2)(1, 2);
  long2 au = (long2)(1, 2);

  float2 av = (float2)(1, 2);

  double2 aw = (double2)(1, 2);

  d[get_global_id(0)] = 1;
}