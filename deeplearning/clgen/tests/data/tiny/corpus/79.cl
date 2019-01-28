__kernel void A(__global int* a, __global int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
  if (b[c] >= 0)
    goto label;

  do {
    b[c] = 1;
  label:
    c += get_local_size(0);
  } while (c < 32);
}