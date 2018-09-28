__kernel void fn_A() {
  const int A = get_global_id(0);
  const int B = get_global_id(1);
}