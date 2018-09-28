__kernel void fn_A(__global int* A) {
  if ((2 == 0)) {
    int B = 1;
    A[0] = B;
  } else {
    int C = 2;
    A[0] = C;
  };
}