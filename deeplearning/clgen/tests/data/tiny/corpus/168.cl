__kernel void A(int a) {
  if (a == 10) {
    barrier(1);
  }
}