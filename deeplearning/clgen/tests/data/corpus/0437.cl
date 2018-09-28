kernel void fn_A() {
  volatile local int A[120000];
  A[0] = 2;
}