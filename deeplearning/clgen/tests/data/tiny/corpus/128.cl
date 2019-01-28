kernel void A(unsigned int a, global unsigned int* b, global unsigned int* c, local unsigned int* d) {
  unsigned int e = get_local_id(0);
  unsigned int f = get_local_size(0);
  unsigned int g = 0;
  for (unsigned int h = e; h < a; h += f) {
    g += b[h];
  }

  d[e] = g;
  for (unsigned int i = f / 2; i > 0; i /= 2) {
    barrier(1);
    if (e < i) {
      d[e] += d[e + i];
    }
  }

  if (e == 0) {
    *c = d[e];
  }
}