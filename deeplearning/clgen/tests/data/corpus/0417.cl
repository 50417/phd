__kernel void fn_A(__read_only image2d_t A, __read_only image2d_t B, __global float4* C) {
  float4 D = 0;
  int2 E;
  int F = (int)get_global_size(0);
  int G = (int)get_global_size(1);
  const sampler_t H = 0x0000 | 0x0004 | 0x0000;
  int I, J;

  int K = (int)get_global_id(0);
  int L = (int)get_global_id(1);

  for (I = 0; I < 4; I++) {
    E.x = K + I * F;
    for (J = 0; J < 4; J++) {
      E.y = L + J * G;
      D = D + read_imagef(A, H, E) + read_imagef(B, H, E);
    }
  }
  C[L * F + K] = D;
}