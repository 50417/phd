__kernel void fn_A() {
  __local int A[128];

  A[get_local_id(0)] = get_local_id(0);

  __barrier_invariant_1(A[get_local_id(0)] == get_local_id(0), 0);
  barrier(1);

  A[get_local_id(0)] = get_local_id(0) + 1;

  __barrier_invariant_binary_1(__implies(get_local_id(0) != 0 & __other_int(get_local_id(0)) != 0, A[0] == 0), get_local_id(0), __other_int(get_local_id(0)));
  barrier(1);
}