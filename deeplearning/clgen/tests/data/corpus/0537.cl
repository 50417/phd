typedef char char3 __attribute((ext_vector_type(3))); ; void fn_A(char3* A, char3* B) {
  *A = *B;
}