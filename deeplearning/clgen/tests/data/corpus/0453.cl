__kernel void fn_A(__global int4* A) {
  for (int B = 0; B < 25; B++) {
    A[B] *= 2;
  }
}