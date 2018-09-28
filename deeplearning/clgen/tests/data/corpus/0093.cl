__kernel void fn_A(__global int* A, short B) {
  int C = (int)get_global_id(0);
  A[C] = B;
}