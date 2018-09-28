__kernel void fn_A(__global uint* A, uint B) {
  A[get_global_id(0)] <<= B;
}

__kernel void fn_B(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  A[D] = B[D] + C[D];
}

__kernel void fn_C(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  A[D] = B[D] * C[D];
}

__kernel void fn_D(__global float* A, __global float* B, __global float* C) {
  unsigned int D = get_global_id(0);
  A[D] = A[D] + (B[D] * C[D]);
}

__kernel void fn_E(__global float* A, __global float* B, __global float* C) {
  unsigned int D = 0;
  unsigned int E = 65535;
  for (D = 0; D < E; D++)
    fn_D(A, B, C);
}