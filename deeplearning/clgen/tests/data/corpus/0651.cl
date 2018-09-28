__kernel void fn_A(int A) {
  __requires(A > 32);

  int B = 0;

  while (__invariant(B >= 0), B < (A - (int)get_local_id(0))) {
    B = B + 1;

    __assert(B >= 0);
    __assert(__other_bool(__implies(__enabled(), B >= 0)));
  }
}