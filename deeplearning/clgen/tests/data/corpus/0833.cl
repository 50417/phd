kernel void fn_A(global int* A) {
  int B = A[0];

  for (int C = 0; C < A[1]; C++) {
    if (B % 2 == 0) {
      B = B / 2;
    } else {
      B = 3 * B + 1;
    }
  }

  A[2] = B;
}