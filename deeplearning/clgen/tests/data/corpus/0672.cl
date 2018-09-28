__kernel void fn_A() {
  unsigned int A = 1;
  signed int B = 2;

  A <<= A;
  B <<= A;
}