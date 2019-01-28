__kernel void A() {
  __local int a[8];
  __local int b[8];
  a[get_local_id(0)] = get_local_id(0);
  __barrier_invariant_2(a[get_local_id(0)] == get_local_id(0), get_local_id(0), ((get_local_id(0) + 1) % 8));
  barrier(1);
  b[a[(get_local_id(0) + 1) % 8]] = get_local_id(0);
  __assert(b[(get_local_id(0) + 1) % 8] == get_local_id(0));
}