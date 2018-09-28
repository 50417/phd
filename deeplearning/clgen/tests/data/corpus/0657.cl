__kernel void fn_A(__local int* A) {
  if (get_local_id(0) != 0) {
    A[get_local_id(0)] = get_local_id(0);
  }

  for (int B = 0; B < 100; B++) {
    if (B == 1) {
      A[0] = get_local_id(0);
    }
  }
}