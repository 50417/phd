__kernel void fn_A(__global char* A, __global char* B, __global char* C) {
  int D = ((get_global_id(2) - get_global_offset(2)) * get_global_size(1) * get_global_size(0)) + ((get_global_id(1) - get_global_offset(1)) * get_global_size(0)) + (get_global_id(0) - get_global_offset(0));

  unsigned char E = A[D];
  unsigned char F = B[D];
  unsigned char G = E | F;
  C[D] = G;
}