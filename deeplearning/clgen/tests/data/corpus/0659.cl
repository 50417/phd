__kernel void fn_A() {
  for (int A = get_global_id(0); __invariant(__implies(__uniform_bool(__enabled()), __distinct_int(A))), A < 100; A++) {
    ;
  }
}