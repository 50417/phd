__kernel void A(__local int* a) {
  for (int b = 0; b < 100; b++) {
    if (get_local_id(0) == 5) {
      a[get_local_id(0)] = get_local_id(0);
    }
    if (get_local_id(0) == 4) {
      a[get_local_id(0) + 1] = get_local_id(0);
    }
  }
}