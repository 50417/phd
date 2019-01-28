typedef struct {
  float a;
  float b;
  float c;
} Structure;

kernel void A(Structure a, global float* b) {
  *b = a.a * a.b + a.c;
}