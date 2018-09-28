__kernel void fn_A(__local int* A) {
  int B;
  int C = 1;
  while (C < get_local_size(0)) {
    if (C < get_local_id(0))
      B = A[get_local_id(0) - C];
    barrier(1);
    if (C < get_local_id(0))
      A[get_local_id(0)] = A[get_local_id(0)] + B;
    C = C * 2;
  }
}