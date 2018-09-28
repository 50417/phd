int fn_A(private int A, private int B) {
  return ((1 + A) + B);
}
int fn_B(private int A) {
  return (7 - A);
}
int fn_C(private int A, private int B) {
  return (fn_A(1, 2) - ((A * B) / fn_B(53)));
}
__kernel void fn_D(__global int* A) {
  A[0] = fn_C(1, 4);
}