__kernel void fn_A(__local int* A) {
  int B = get_local_id(0);

  A[B] = 0;

  for (int C = 0; C < 100; C++) {
    A[B]++;
  }
}