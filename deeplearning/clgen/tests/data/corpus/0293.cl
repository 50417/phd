__kernel void fn_A(__global const char* A, __global char* B) {
  int C = get_global_id(0);
  B[C] = A[C] + 1;
}
__kernel void fn_B(__global const char* A, __global char* B) {
  int C = get_global_id(0);
  B[C] = A[C] - 1;
}

__kernel void fn_C(__global const char* A, __global char* B) {
  int C = get_global_id(0);
  B[C] = A[C] - 2;
}
__kernel void fn_D(__global const char* A, __global char* B) {
  int C = get_global_id(0);
  B[C] = A[C] + 2;
}