__kernel void fn_A() {
  unsigned A = 0;

  while (__global_invariant(__implies(!__enabled(), A == get_local_id(0))), __invariant(A <= get_local_id(0)), A < get_local_id(0)) {
    A = A + 1;
  }

  __assert(A == get_local_id(0));
}