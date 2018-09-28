__kernel void fn_A(__global int* A, char B, short C, int D) {
  int E = (int)get_global_id(0);
  A[E] = B + C + D;
}