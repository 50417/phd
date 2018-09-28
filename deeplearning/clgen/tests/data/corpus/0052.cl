void fn_A(unsigned char* A, unsigned int B, unsigned char* C, unsigned int D, unsigned int E) {
  for (unsigned int F = 0; F < E; ++F) {
    C[D + F] = A[B + F];
  }
}

void fn_B(__global unsigned char* A, unsigned int B, unsigned char* C, unsigned int D, unsigned int E) {
  for (unsigned int F = 0; F < E; ++F) {
    C[D + F] = A[B + F];
  }
}

void fn_C(unsigned char* A, unsigned int B, __global unsigned char* C, unsigned int D, unsigned int E) {
  for (unsigned int F = 0; F < E; ++F) {
    C[D + F] = A[B + F];
  }
}

void fn_D(__global unsigned char* A, unsigned int B, __global unsigned char* C, unsigned int D, unsigned int E) {
  for (unsigned int F = 0; F < E; ++F) {
    C[D + F] = A[B + F];
  }
}

unsigned int fn_E(unsigned char* A, unsigned int B) {
  return A[B] | (A[B + 1] << 8) | (A[B + 2] << 16) | (A[B + 3] << 24);
}

void fn_F(unsigned char* A, unsigned int B, unsigned int C) {
  A[B] = C & 0x0ff;
  A[B + 1] = (C >> 8) & 0x0ff;
  A[B + 2] = (C >> 16) & 0x0ff;
  A[B + 3] = (C >> 24) & 0x0ff;
}

unsigned long fn_G(unsigned char* A, unsigned int B) {
  return A[B] | ((unsigned long)A[B + 1] << 8) | ((unsigned long)A[B + 2] << 16) | ((unsigned long)A[B + 3] << 24) | ((unsigned long)A[B + 4] << 32) | ((unsigned long)A[B + 5] << 40) | ((unsigned long)A[B + 6] << 48) | ((unsigned long)A[B + 7] << 56);
}

void fn_H(unsigned char* A, unsigned int B, unsigned long C) {
  A[B] = C & 0x0ff;
  A[B + 1] = (C >> 8) & 0x0ff;
  A[B + 2] = (C >> 16) & 0x0ff;
  A[B + 3] = (C >> 24) & 0x0ff;
  A[B + 4] = (C >> 32) & 0x0ff;
  A[B + 5] = (C >> 40) & 0x0ff;
  A[B + 6] = (C >> 48) & 0x0ff;
  A[B + 7] = (C >> 56) & 0x0ff;
}

unsigned long fn_I(__global unsigned char* A, unsigned int B) {
  return (A[B] << 24) | (A[B + 1] << 16) | (A[B + 2] << 8) | A[B + 3];
}

void fn_J(__global unsigned char* A, unsigned int B, unsigned long C) {
  A[B] = (C >> 24) & 0x0ff;
  A[B + 1] = (C >> 16) & 0x0ff;
  A[B + 2] = (C >> 8) & 0x0ff;
  A[B + 3] = C & 0x0ff;
}

unsigned long fn_K(unsigned char* A, unsigned int B) {
  return ((unsigned long)A[B] << 56) | ((unsigned long)A[B + 1] << 48) | ((unsigned long)A[B + 2] << 40) | ((unsigned long)A[B + 3] << 32) | ((unsigned long)A[B + 4] << 24) | ((unsigned long)A[B + 5] << 16) | ((unsigned long)A[B + 6] << 8) | A[B + 7];
}

void fn_L(unsigned char* A, unsigned int B, unsigned long C) {
  A[B] = (C >> 56) & 0x0ff;
  A[B + 1] = (C >> 48) & 0x0ff;
  A[B + 2] = (C >> 40) & 0x0ff;
  A[B + 3] = (C >> 32) & 0x0ff;
  A[B + 4] = (C >> 24) & 0x0ff;
  A[B + 5] = (C >> 16) & 0x0ff;
  A[B + 6] = (C >> 8) & 0x0ff;
  A[B + 7] = C & 0x0ff;
}

void fn_M(__global unsigned char* A, unsigned int B, unsigned long C) {
  A[B] = (C >> 56) & 0x0ff;
  A[B + 1] = (C >> 48) & 0x0ff;
  A[B + 2] = (C >> 40) & 0x0ff;
  A[B + 3] = (C >> 32) & 0x0ff;
  A[B + 4] = (C >> 24) & 0x0ff;
  A[B + 5] = (C >> 16) & 0x0ff;
  A[B + 6] = (C >> 8) & 0x0ff;
  A[B + 7] = C & 0x0ff;
}