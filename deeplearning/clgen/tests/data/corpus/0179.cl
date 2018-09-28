typedef struct { float f0; } point3;

point3 fn_A(point3 A, point3 B);
point3 fn_A(point3 A, point3 B) {
  point3 C;
  C.f0 = A.f0 - B.f0;
  return C;
}

__kernel void fn_B(__global point3* A) {
  *A = fn_A(*A, *A);
}