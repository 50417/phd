int fn_A(int A, int B) {
  return (A + B) / 2;
}

__kernel void fn_B(__global int* A) {
  int B = get_global_id(0) * get_global_size(0) + get_local_id(0);
  A[B] = fn_A(B, B);
}