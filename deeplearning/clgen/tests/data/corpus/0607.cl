__kernel void fn_A(__global unsigned char* A, unsigned B) {
  int C = get_global_id(0);
  int D = get_global_id(1);

  A[(D * B + C) * 3] = 255 - A[(D * B + C) * 3];
  A[(D * B + C) * 3 + 1] = 255 - A[(D * B + C) * 3 + 1];
  A[(D * B + C) * 3 + 2] = 255 - A[(D * B + C) * 3 + 2];
}