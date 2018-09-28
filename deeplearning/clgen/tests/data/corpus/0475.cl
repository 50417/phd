constant int gb_A[4] = {7, 42, 0, -1};

kernel void fn_A(global int* A) {
  int B = get_global_id(0);
  A[B] = gb_A[B];
}