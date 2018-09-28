int fn_A(private int A) {
  return (6 - A);
}
int fn_B(private int A) {
  return fn_A(A);
}
__kernel void fn_C(__global int* A) {
  A[0] = fn_B(7);
}