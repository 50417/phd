int fn_A(private int A) {
  return (A + 1);
}
int fn_B(__global int* A, private int B) {
  if ((B == 0)) {
    return fn_A(9);
  } else {
    return A[2];
  };
}
__kernel void fn_C(__global int* A) {
  A[0] = fn_B(A, 0);
}