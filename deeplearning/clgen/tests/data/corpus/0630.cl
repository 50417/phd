void __kernel fn_A(__global int* A) {
  A[get_global_id(0)] += 5;
}