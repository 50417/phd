int fn_A(private int A, private int B) {
  return (B + A);
}
int fn_B(private int A) {
  return (A + 1);
}
__kernel void fn_C(__global int* A) {
  int B = 1;
  int C = fn_A(B, 9);
  A[0] = C;
}