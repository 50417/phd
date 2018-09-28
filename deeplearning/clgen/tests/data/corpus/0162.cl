__kernel void fn_A(__global char* A, __global char* B) {
  int C = ((get_global_id(2) - get_global_offset(2)) * get_global_size(1) * get_global_size(0)) + ((get_global_id(1) - get_global_offset(1)) * get_global_size(0)) + (get_global_id(0) - get_global_offset(0));

  B[C] = 255 - A[C];
}