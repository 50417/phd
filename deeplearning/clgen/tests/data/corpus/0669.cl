__kernel void fn_A() {
  int A[16];
  int B = get_global_id(0);
  A[B] = B * B;
}