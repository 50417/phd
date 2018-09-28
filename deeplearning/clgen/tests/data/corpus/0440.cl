typedef struct { int cells[9]; } Mat3X3;

typedef struct { int cells[16]; } Mat4X4;

Mat4X4 __attribute__((noinline)) fn_A(Mat3X3 A) {
  Mat4X4 B;
  return B;
}

kernel void fn_B(global Mat3X3* A, global Mat4X4* B) {
  B[0] = fn_A(A[1]);
}