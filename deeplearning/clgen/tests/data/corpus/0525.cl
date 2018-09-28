__kernel void fn_A(__global int* A) {
  while ((A[0] < 5)) {
    int B = (A[0] + 1);
    A[0] = (B * B);
  };
}