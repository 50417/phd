__kernel void fn_A(int A, __global int* B, __global bool* C) {
  __global int* D;

  if (A == 0)
    D = B;
  else
    D = ((void*)0);

  if (D > (__global int*)0)
    B[get_global_id(0)] = get_global_id(0);
  else
    B[0] = get_global_id(0);
}