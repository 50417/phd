__kernel void fn_A(__global char* A) {
  int B = (int)get_global_id(0);
  A[B] = (char)B;
}