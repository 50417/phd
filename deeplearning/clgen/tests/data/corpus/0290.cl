__constant sampler_t gb_A = 0x0000 | 0x0000 | 0x0000; __kernel void fn_A(__read_only image2d_t A, __global char* B, __global char* C, __private float D, __private float E) {
  const int2 F = {get_global_id(0), get_global_id(1)};
  const uint G = F.x + F.y * get_global_size(0);

  int2 H[8] = {{1, 0}, {0, 1}, {1, 1}, {-1, 0}, {0, -1}, {-1, -1}, {-1, 1}, {1, -1}};

  if (B[G] == 2) {
    float I = (float)read_imageui(A, gb_A, F).x;
    if (I >= D && I <= E) {
      B[G] = 1;

      for (int J = 0; J < 8; J++) {
        int2 K = F + H[J];
        if (K.x < 0 || K.y < 0 || K.x >= get_global_size(0) || K.y >= get_global_size(1))
          continue;
        uint L = K.x + K.y * get_global_size(0);
        if (B[L] == 0) {
          B[L] = 2;
          C[0] = 0;
        }
      }
    } else {
      B[G] = 0;
    }
  }
}