__kernel void fn_A(__global float* A, __global float* B) {
  int C = (int)get_global_id(0);
  if (get_local_id(0) > 5)
    B[C] = max(A[C], A[7]);
  else
    B[C] = min(A[C], A[10]);
}