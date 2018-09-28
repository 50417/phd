__kernel void fn_A(global int* A) {
  local int B[64];
  B[A[get_global_id(0)]] = get_global_size(0);
}