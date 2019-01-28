kernel void A() {
  local int a[32];

  a[get_local_id(0)] = 42;

  barrier(1);

  for (int b = 0; __global_invariant(__no_read(a)), __global_invariant(__no_write(a)), b < get_group_id(0); b++) {
    for (int c = 0; c < get_group_id(0); c++) {
      if (b > get_local_id(0)) {
        for (int d = 0; d < get_group_id(0); d++) {
          a[get_local_id(0)] += 42;
        }
      }
      barrier(1);
    }
  }

  a[(get_local_id(0) + 1) % 32] = 1;
}