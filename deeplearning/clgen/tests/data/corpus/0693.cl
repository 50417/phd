int fn_A(int A) {
  __requires(__uniform_bool(__enabled()));
  __requires(__implies(get_group_id(0) == __other_int(get_group_id(0)), __distinct_int(A)));
  __ensures(__implies(__enabled() & (get_group_id(0) == __other_int(get_group_id(0))), __distinct_int(__return_val_int())));
  return A + 1;
}

__kernel void fn_B() {
  int A = fn_A(get_local_id(0));
}