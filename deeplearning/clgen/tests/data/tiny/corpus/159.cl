__kernel void A() {
  int a, b;

  a = 5, b = 4;

  __assert(a == 5);
  __assert(b == 4);
}