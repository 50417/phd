struct sfloat8 {
  float a;
  float b;
  float c;
  float d;
  float e;
  float f;
  float g;
  float h;
};

__kernel void fn_A(struct sfloat8 A, __global struct sfloat8* B) {
  B[0].a = A.a;
  B[0].b = 12.0f;
  B[0].c = 12.0f;
  B[0].d = 12.0f;
  B[0].e = 12.0f;
  B[0].f = 12.0f;
  B[0].g = 12.0f;
  B[0].h = A.a + A.h;

  B[1].a = A.a;
  B[1].b = 12.0f;
  B[1].c = 12.0f;
  B[1].d = 12.0f;
  B[1].e = 12.0f;
  B[1].f = 12.0f;
  B[1].g = 12.0f;
  B[1].h = A.a + A.h;

  B[2].a = A.a;
  B[2].b = 12.0f;
  B[2].c = 12.0f;
  B[2].d = 12.0f;
  B[2].e = 12.0f;
  B[2].f = 12.0f;
  B[2].g = 12.0f;
  B[2].h = A.a + A.h;

  B[3].a = A.a;
  B[3].b = 12.0f;
  B[3].c = 12.0f;
  B[3].d = 12.0f;
  B[3].e = 12.0f;
  B[3].f = 12.0f;
  B[3].g = 12.0f;
  B[3].h = A.a + A.h;

  B[4].a = A.a;
  B[4].b = 12.0f;
  B[4].c = 12.0f;
  B[4].d = 12.0f;
  B[4].e = 12.0f;
  B[4].f = 12.0f;
  B[4].g = 12.0f;
  B[4].h = A.a + A.h;

  B[5].a = A.a;
  B[5].b = 12.0f;
  B[5].c = 12.0f;
  B[5].d = 12.0f;
  B[5].e = 12.0f;
  B[5].f = 12.0f;
  B[5].g = 12.0f;
  B[5].h = A.a + A.h;

  B[6] = B[0];
}