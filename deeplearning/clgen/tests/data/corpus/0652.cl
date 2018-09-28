__kernel void fn_A() {
  for (int A = 0; __invariant(__uniform_int(A)), A < 4; ++A) {
    if (get_local_id(0) < 4) {
      if (A == 0) {
      }
      if (A == 1) {
      }
      if (A == 2) {
      }
      if (A == 3) {
      }
    }
    barrier(1);
  }
}