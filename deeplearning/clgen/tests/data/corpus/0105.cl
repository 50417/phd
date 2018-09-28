struct hop {
  int x, y;
};

__kernel void fn_A(__global int* A, struct hop B) {
  int C = (int)get_global_id(0);
  A[C] = B.x + B.y;
}