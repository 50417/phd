__kernel void fn_A(int2 A, __global int2* B) {
  B[0] = A;
}