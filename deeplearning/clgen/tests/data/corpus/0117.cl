kernel void fn_A(__global int* A, __global int* B) {
  *A = get_global_size(*B);
}