__kernel void fn_A(__global int* A, __global int* B) {
  for (int C = 0; __invariant(C == 5), C < 8; C++) {
  }
}