__kernel void fn_A(__global char16* A, int B) {
  for (int C = 0; C < B; C++) {
    A[C] = (char16)(5);
  }
}