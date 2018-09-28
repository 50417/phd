int fn_A(private int A, private int B) {
  int C = 0;
  return ((A + B) + C);
}
__kernel void fn_B(__global int* A) {
  int B = 9;
  A[0] = fn_A(7, 9);
}