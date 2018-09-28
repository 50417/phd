uint fn_A(uint A, uint B) {
  uchar C = A & 0xff;
  uchar D = B & 0xff;
  uchar E;

  uchar F = (A & 0xff00) >> 8;
  uchar G = (B & 0xff00) >> 8;
  uchar H;

  uchar I = (A & 0xff0000) >> 16;
  uchar J = (B & 0xff0000) >> 16;
  uchar K;

  if (C + D > 255) {
    E = 255;
  } else {
    E = C + D;
  }

  if (F + G > 255) {
    H = 255;
  } else {
    H = F + G;
  }

  if (I + J > 255) {
    K = 255;
  } else {
    K = I + J;
  }

  uint L = 0;

  L |= (uint)E;
  L |= ((uint)H << 8);
  L |= ((uint)K << 16);

  return L;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_B(__global const uint* A, __global uint* B, const uint C, const uint D) {
  const uint E[10][10] = {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0}, {0, 0, 0x0f0f0f, 0, 0, 0, 0, 0x0f0f0f, 0, 0}, {0, 0, 0, 0x0f0f0f, 0, 0, 0x0f0f0f, 0, 0, 0}, {0, 0, 0, 0, 0x0f0f0f, 0x0f0f0f, 0, 0, 0, 0}, {0, 0, 0, 0, 0x0f0f0f, 0x0f0f0f, 0, 0, 0, 0}, {0, 0, 0, 0x0f0f0f, 0, 0, 0x0f0f0f, 0, 0, 0}, {0, 0, 0x0f0f0f, 0, 0, 0, 0, 0x0f0f0f, 0, 0}, {0, 0x0f0f0f, 0, 0, 0, 0, 0, 0, 0x0f0f0f, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}};

  const uint F = C;
  const uint G = D;

  uint H = 0, I = 0;
  uint J = 0, K = 0;

  __attribute__((xcl_pipeline_loop)) for (size_t L = 0; L < G * F; L++) {
    B[L] = fn_A(A[L], E[K][J]);

    I = (I == F - 1) ? 0 : I + 1;
    K = (K == 10 - 1 || I == F - 1) ? 0 : K + 1;
    H = (I == F - 1) ? H + 1 : H;
    J = (I == F - 1) ? ((J == 10 - 1) ? 0 : J + 1) : J;
  }
}