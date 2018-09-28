__kernel void fn_A(__global float* A, const uint B, const __global ushort* C, const uint D, const int E) {
  uint F = get_global_id(0);
  uint G = get_global_id(1);

  A[F + B * G] = C[F * E + D * G * E] / 1000.0f;
}