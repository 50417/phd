typedef __attribute__((ext_vector_type(4))) unsigned char uchar4; typedef __attribute__((ext_vector_type(8))) unsigned char uchar8; void fn_A(uchar8 A) {
  uchar4 B[4] = {{(uchar4){A.lo}}};
}