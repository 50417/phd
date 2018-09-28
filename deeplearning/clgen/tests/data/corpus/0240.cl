__kernel void fn_A(__global int* A, __global int* B) {
  const int C = get_global_id(0);
  B[C] = C;
  if (A[C] > 0)
    return;
  B[C] = A[C];
}