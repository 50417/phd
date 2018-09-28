float* fn_A(float* A) {
  A[0] += 1;
  return A;
}

__kernel void fn_B(int A) {
  float B = 0;
  float* C;

  if (A == 0)
    C = fn_A(0);
  else
    C = fn_A(&B);

  B += 1;
}