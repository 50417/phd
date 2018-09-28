__kernel void fn_A(__global int4* A) {
  int4 B = (int4)(0, 1, 2, 3);
  B.z = get_global_id(0);
  A[get_global_id(0)] = B;
}