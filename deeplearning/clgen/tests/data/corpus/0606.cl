__kernel void fn_A(__global unsigned char* A, unsigned B, float C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  A[E * B + D] = A[E * B + D] * C;
}