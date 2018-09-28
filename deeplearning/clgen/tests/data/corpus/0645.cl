__kernel void fn_A(__global int* A) {
  A[get_global_id(0)] = get_local_id(0);
}