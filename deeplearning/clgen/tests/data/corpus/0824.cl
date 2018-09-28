__kernel void fn_A(__global float* A) {
  float4 B = (float4)(5.0);

  for (int C = 0; C < 1024; C++) {
    vstore4(B, C, A);
  }
}