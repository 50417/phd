__kernel void A(__global int* a) {
  while ((a[0] < 5)) {
    a[0] = (a[0] + 1);
  };
}