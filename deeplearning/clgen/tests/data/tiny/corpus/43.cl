__kernel void A(__global unsigned char* a, unsigned b, float c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  a[e * b + d] = a[e * b + d] * c;
}