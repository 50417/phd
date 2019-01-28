float* A(float* a); __kernel void B() {
  float b = 0;
  float* c = A(&b);
  c[0] = c[0] + 1;
}