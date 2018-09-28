__kernel void fn_A(__global float* A, __global float* B, uint C, uint D, uint E, uint F) {
  uint G = get_global_id(0);
  uint H = G / (C * D);

  uint I = H / E;
  uint J = H % E;

  uint K = G % (C * D);

  B[G] = A[(J * C * D * F) + (I * C * D) + K];
}