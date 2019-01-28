constant int a[3] = {71, 72, 73};
const constant int b = 1;
constant int c[3] = {3, 2, 1};

constant int4 d = {1, 2, 3, 4};
constant int4 e = {0, -1, -2, -3};

struct Person {
  char name[7];
  int3 idNumber;
};

struct Test1 {
  int a0;
  char a1;
};

struct Test2 {
  char a0;
  int a1;
};
struct Test3 {
  int a0;
  int a1;
};
struct Test4 {
  float a0;
  float a1;
};

constant struct Person f = {{"james"}, (int3)(1, 2, 3)};
constant struct Test1 g = {1, 2};
constant struct Test2 h = {1, 2};

constant int3 i[3] = {(int3)(0, 1, 2), (int3)(3, 4, 5), (int3)(6, 7, 8)};
constant char4 j[3] = {(char4)(0, 1, 2, 3), (char4)(4, 5, 6, 7), (char4)(8, 9, 10, 11)};

constant struct Person k[3] = {{{"abc"}, (int3)(1, 2, 3)}, {{"defg"}, (int3)(4, 5, 6)}, {{"hijk"}, (int3)(7, 8, 9)}};
constant struct Test3 l = {0, 0};
constant int3 m = {0, 0, 0};
constant int n[3] = {0, 0, 0};
constant float o[3] = {0.0f, 0.0f, 0.0f};

__kernel void A(__global int* p, int q, int r) {
  int s = (int)get_global_id(0);

  int4 t = d + e;
  p[s] = a[s % 3] * b * c[2] + q + r * t.y * d.x + l.a0 + m.x + n[1] + (int)o[2];
}

__kernel void B(__global int* p) {
  int s = (int)get_global_id(0);
  p[s] = i[s % 3].y + j[s % 3].w;
}

__kernel void C(__global int* p) {
  int s = (int)get_global_id(0);

  p[s] = f.idNumber.y + g.a1 + h.a1;
}

__kernel void D(__global int* p) {
  int s = (int)get_global_id(0);

  p[s] = k[s % 3].idNumber.z + k[s % 3].name[2];
}