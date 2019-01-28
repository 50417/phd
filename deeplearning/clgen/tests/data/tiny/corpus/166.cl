kernel void A(local int* a, local unsigned int* b, global int* c, global unsigned int* d) {
  atomic_add(a, 10);
  atomic_sub(a, 10);
  atomic_xchg(a, 10);
  atomic_min(a, 10);
  atomic_max(a, 10);
  atomic_and(a, 10);
  atomic_or(a, 10);
  atomic_xor(a, 10);
  atomic_add(a, 1);
  atomic_sub(a, 1);
  atomic_cmpxchg(a, 10, 10);

  atomic_add(b, 10);
  atomic_sub(b, 10);
  atomic_xchg(b, 10);
  atomic_min(b, 10);
  atomic_max(b, 10);
  atomic_and(b, 10);
  atomic_or(b, 10);
  atomic_xor(b, 10);
  atomic_add(b, 1);
  atomic_sub(b, 1);
  atomic_cmpxchg(b, 10, 10);

  atomic_add(c, 10);
  atomic_sub(c, 10);
  atomic_xchg(c, 10);
  atomic_min(c, 10);
  atomic_max(c, 10);
  atomic_and(c, 10);
  atomic_or(c, 10);
  atomic_xor(c, 10);
  atomic_add(c, 1);
  atomic_sub(c, 1);
  atomic_cmpxchg(c, 10, 10);

  atomic_add(d, 10);
  atomic_sub(d, 10);
  atomic_xchg(d, 10);
  atomic_min(d, 10);
  atomic_max(d, 10);
  atomic_and(d, 10);
  atomic_or(d, 10);
  atomic_xor(d, 10);
  atomic_add(d, 1);
  atomic_sub(d, 1);
  atomic_cmpxchg(d, 10, 10);
}