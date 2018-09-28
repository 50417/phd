__kernel void fn_A(__global int4* A, __global int4* B) {
  int4 C = (int4)(0, 0, 0, 0);

  B[get_global_id(0)] = C < A[get_global_id(0)];
}