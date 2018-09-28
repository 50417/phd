kernel void fn_A() {
  local int A[32];

  A[get_local_id(0)] = 42;

  barrier(1);

  for (int B = 0; __global_invariant(__no_read(A)), __global_invariant(__no_write(A)), B < get_group_id(0); B++) {
    for (int C = 0; C < get_group_id(0); C++) {
      if (B > get_local_id(0)) {
        for (int D = 0; D < get_group_id(0); D++) {
          A[get_local_id(0)] += 42;
        }
      }
      barrier(1);
    }
  }

  A[(get_local_id(0) + 1) % 32] = 1;
}