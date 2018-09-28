__kernel void fn_A(__global int* A) {
  for (int B = 0; B < get_global_id(0); B++) {
    A[B + get_global_id(0)] = get_global_id(0);
    barrier(2);
  }
}