void A(int* a) {
  *a = 1;
}

void B() {
  int* b;
  int c;

  b = &c;

  A(&c);
  A(b);

  if (c == 1 && *b == 1) {
  }
}

__kernel void C(__global int* d, uint e) {
  B();
}