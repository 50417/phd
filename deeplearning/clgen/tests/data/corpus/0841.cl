__kernel void fn_A(__global float2* A) {
  int B = get_global_id(0);

  A[B].x = 0;
  A[B].y = 0;
}

__kernel void fn_B(__global const float2* A, __global float2* B) {
  int C = get_global_id(0);

  B[C].x += A[C].x;
  B[C].y += A[C].y;
}