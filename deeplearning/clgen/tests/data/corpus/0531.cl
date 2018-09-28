__kernel void fn_A(__global int* A) {
  while (((A[0] < 5) && ((A[1] < 6) || (A[2] > 2)))) {
    A[0] = 1;
  };
}