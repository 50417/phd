typedef struct { int cells[9]; } Mat3X3;

typedef struct { int cells[16]; } Mat4X4;

Mat4X4 A(Mat3X3 a) {
  Mat4X4 b;
  return b;
}

kernel void B(global Mat3X3* a, global Mat4X4* b) {
  b[0] = A(a[1]);
}