__kernel void fn_A() {
  local int A[64];
  ((local char*)A)[get_global_id(0)] = get_global_size(0);
}