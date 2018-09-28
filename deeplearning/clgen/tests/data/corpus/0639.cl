__kernel void fn_A(__local unsigned int* A) {
  for (unsigned int B = 0; B < 8; ++B) {
    if (get_local_id(0) == 0) {
      A[get_local_id(0)] = 0 + B;
    }

    barrier(1);
  }
}