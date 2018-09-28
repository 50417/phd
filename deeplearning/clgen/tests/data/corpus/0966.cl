int fn_A(private int A) {
  int B = (1 + A);
  return B;
}
__kernel void fn_B(__global int* A) {
  A[0] = fn_A(1);
}