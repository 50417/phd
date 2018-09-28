struct hop {
  int x[16];
};

__kernel void fn_A(__global int* A, struct hop B) {
  int C = (int)get_global_id(0);
  A[C] = B.x[get_local_id(0)];
}