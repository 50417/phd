bool fn_A() {
  return true;
}

kernel void fn_B() {
  __function_wide_invariant(fn_A());
}