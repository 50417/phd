__kernel void fn_A(__global int* A) {
  int B = 1;
  for (int C = 0; (C <= (B + 1)); C++) {
    int D = (C + 2);
    A[D] = 2;
  };
}