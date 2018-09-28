__kernel void fn_A(__global int* A) {
  for (int B = 0; (B <= 3); B++) {
    int C = (B * B);
    A[0] = C;
  };
}