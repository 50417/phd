constant int gb_A[3] = {71, 72, 73};
const constant int gb_B = 1;
constant int gb_C[3] = {3, 2, 1};

constant int4 gb_D = {1, 2, 3, 4};
constant int4 gb_E = {0, -1, -2, -3};

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

constant struct Person gb_F = {{"james"}, (int3)(1, 2, 3)};
constant struct Test1 gb_G = {1, 2};
constant struct Test2 gb_H = {1, 2};

constant int3 gb_I[3] = {(int3)(0, 1, 2), (int3)(3, 4, 5), (int3)(6, 7, 8)};
constant char4 gb_J[3] = {(char4)(0, 1, 2, 3), (char4)(4, 5, 6, 7), (char4)(8, 9, 10, 11)};

constant struct Person gb_K[3] = {{{"abc"}, (int3)(1, 2, 3)}, {{"defg"}, (int3)(4, 5, 6)}, {{"hijk"}, (int3)(7, 8, 9)}};
constant struct Test3 gb_L = {0, 0};
constant int3 gb_M = {0, 0, 0};
constant int gb_N[3] = {0, 0, 0};
constant float gb_O[3] = {0.0f, 0.0f, 0.0f};

__kernel void fn_A(__global int* A, int B, int C) {
  int D = (int)get_global_id(0);

  int4 E = gb_D + gb_E;
  A[D] = gb_A[D % 3] * gb_B * gb_C[2] + B + C * E.y * gb_D.x + gb_L.a0 + gb_M.x + gb_N[1] + (int)gb_O[2];
}

__kernel void fn_B(__global int* A) {
  int B = (int)get_global_id(0);
  A[B] = gb_I[B % 3].y + gb_J[B % 3].w;
}

__kernel void fn_C(__global int* A) {
  int B = (int)get_global_id(0);

  A[B] = gb_F.idNumber.y + gb_G.a1 + gb_H.a1;
}

__kernel void fn_D(__global int* A) {
  int B = (int)get_global_id(0);

  A[B] = gb_K[B % 3].idNumber.z + gb_K[B % 3].name[2];
}