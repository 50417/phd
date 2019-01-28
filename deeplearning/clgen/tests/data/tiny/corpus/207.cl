kernel void A(global float* a, global float* b, uint c) {
  size_t d = get_global_id(0), e = get_global_id(1), f = d * c + e;

  a[f] = 0;
  for (uint g = 0; g < c; ++g)
    a[f] += b[d * c + g] * b[g * c + e];
}