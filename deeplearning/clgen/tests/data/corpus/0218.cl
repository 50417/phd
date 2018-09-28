__kernel void fn_A(__global int* A, __global int* B) {
  int C = (int)get_global_id(0);
  B[C] = A[C];
  if (B[C] >= 0)
    goto label;

  do {
    B[C] = 1;
  label:
    C += get_local_size(0);
  } while (C < 32);
}