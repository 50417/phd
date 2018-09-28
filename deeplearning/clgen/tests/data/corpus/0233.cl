__kernel void fn_A(__global int* A, __global int* B) {
  const int C = get_global_id(0);
  B[C] = C;
  if (C < 11 && (A[C] > 0 || A[C + 16] < 2))
    return;
  B[C] = A[C];
}