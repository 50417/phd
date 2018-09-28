__kernel void fn_A(__global int* A) {
  uint B = get_global_id(0);
  uint C = get_global_size(0);

  for (uint D = 0; D < 512; ++D)
    for (uint E = 0; E < 512; ++E) {
      uint F = D + E * 512 + B * 512 * 512;

      A[F] = -1;
    }
}