__kernel void fn_A(__global float4* A, __global float* B, int C) {
  int D = get_global_id(0);

  if (D <= C / 4 + 1) {
    float4 E = A[D];
    B[D] = max(max(E.x, E.y), max(E.z, E.w));
  }
}