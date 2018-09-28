typedef unsigned char __attribute__((ext_vector_type(3))) uchar3; kernel void fn_A(uchar3 A) {
  A.odd = 1;
}

kernel void fn_B(uchar3 A) {
  A.hi = 2;
}