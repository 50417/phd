__kernel void fn_A(__global short* A) {
  int B = (int)get_global_id(0);
  A[B] = (short)B;
}