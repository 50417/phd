typedef float real_t; __kernel void fn_A(__global real_t* A, real_t B) {
  const int C = get_global_id(0);
  A[C] = B;
}