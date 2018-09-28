__kernel void fn_A(void) {
  __local int A;
  ++A;
}

__kernel void __attribute__((__overloadable__)) fn_B(local int* A) {
  *A = 5;
}