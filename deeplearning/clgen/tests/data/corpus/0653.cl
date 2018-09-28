__kernel void fn_A(__local int* A) {
  A[get_local_id(0)] = get_local_id(0);
  if (get_local_id(0) == 0)
    A[7] = 0;
}