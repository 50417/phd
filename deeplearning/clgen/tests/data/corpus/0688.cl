kernel void fn_A() {
  for (int A = 0; A < get_group_id(0); A++) {
    barrier(1);
  }
}