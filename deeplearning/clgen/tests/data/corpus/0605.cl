__kernel void fn_A(__global unsigned char* A, unsigned B) {
  int C = get_global_id(0);
  int D = get_global_id(1);

  for (int E = 0; E < 3; E++) {
    if (A[(D * B + C) * 3 + E] >= 125) {
      A[(D * B + C) * 3 + E] = 255;
    } else {
      A[(D * B + C) * 3 + E] = 0;
    }
  }
}