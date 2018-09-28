void fn_A(__private uint* A, int B, int C); void fn_B(__private uint* A); void fn_C(__private uint* A); __kernel void fn_D(__global uint* A) {
  __private uint B[128];
  A += get_global_id(0) * 128;

  for (int C = 0; C < 128; C++)
    B[C] = A[C];

  for (int D = 0; D < 2; D++) {
    for (int C = 0; C < 3; C++) {
      fn_A(B, 0, 64);
      fn_A(B, 64, 0);
    }
    fn_B(B);
    fn_C(B + 64);
  }
  for (int C = 0; C < 3; C++) {
    fn_A(B, 0, 64);
    fn_A(B, 64, 0);
  }

  for (int C = 0; C < 64; C++)
    A[C] = B[C + 64];
  for (int C = 0; C < 64; C++)
    A[C + 64] = B[C];
}

__kernel void fn_E(__global uint4* A, __local uint4* B) {
  const uint4 C = (uint4)(1);
  size_t D = get_local_id(0);
  uint4 E = (uint4)(0), F;
  B += D & 0xFFFFFFE0;
  A += get_global_id(0) & 0xFFFFFFE0;

  D &= 0x1F;
  B[D] = A[D];
  barrier(1);

  F = (uint4)(D);
  for (int G = 0; G < 32; G++)
    E |= ((B[G] >> F) & C) << (uint4)(G);
  A[D] = E;
}

__kernel void fn_F(__global uint* A, __local uint* B) {
  size_t C = get_local_id(0);
  B += (C & 0xFFFFFFE0) << 2;
  A += (get_global_id(0) & 0xFFFFFFE0) << 2;

  C &= 0x1F;
  B[C * 4 + 0] = A[C * 4 + 0];
  B[C * 4 + 1] = A[C * 4 + 1];
  B[C * 4 + 2] = A[C * 4 + 2];
  B[C * 4 + 3] = A[C * 4 + 3];
  barrier(1);

  A[C + 0] = B[C * 4 + 0];
  A[C + 32] = B[C * 4 + 1];
  A[C + 64] = B[C * 4 + 2];
  A[C + 96] = B[C * 4 + 3];
}

__kernel void fn_G(__global uint* A, __local uint* B) {
  size_t C = get_local_id(0);
  B += (C & 0xFFFFFFE0) << 2;
  A += (get_global_id(0) & 0xFFFFFFE0) << 2;

  C &= 0x1F;
  B[C * 4 + 0] = A[C * 4 + 0];
  B[C * 4 + 1] = A[C * 4 + 1];
  B[C * 4 + 2] = A[C * 4 + 2];
  B[C * 4 + 3] = A[C * 4 + 3];
  barrier(1);

  A[C * 4 + 0] = B[C + 0];
  A[C * 4 + 1] = B[C + 32];
  A[C * 4 + 2] = B[C + 64];
  A[C * 4 + 3] = B[C + 96];
}

void fn_H(__private uint* A, __private uint* B);
void fn_I(__private uint* A, __private uint* B);
void fn_J(__private uint* A, __private uint* B);
void fn_K(__private uint* A, __private uint* B);
void fn_A(__private uint* A, int B, int C) {
  __private uint D[64];
  fn_H(A + B + 0, D + 0);
  fn_I(A + B + 8, D + 8);
  fn_J(A + B + 16, D + 16);
  fn_K(A + B + 24, D + 24);
  fn_I(A + B + 32, D + 32);
  fn_J(A + B + 40, D + 40);
  fn_K(A + B + 48, D + 48);
  fn_H(A + B + 56, D + 56);

  for (int E = 0; E < 8; E++) {
    A[C + E + 0] ^= D[0 + E] ^ D[16 + E] ^ D[24 + E] ^ D[40 + E] ^ D[48 + E] ^ D[56 + E];
    A[C + E + 8] ^= D[0 + E] ^ D[8 + E] ^ D[24 + E] ^ D[32 + E] ^ D[48 + E] ^ D[56 + E];
    A[C + E + 16] ^= D[0 + E] ^ D[8 + E] ^ D[16 + E] ^ D[32 + E] ^ D[40 + E] ^ D[56 + E];
    A[C + E + 24] ^= D[8 + E] ^ D[16 + E] ^ D[24 + E] ^ D[32 + E] ^ D[40 + E] ^ D[48 + E];
    A[C + E + 32] ^= D[0 + E] ^ D[8 + E] ^ D[40 + E] ^ D[48 + E] ^ D[56 + E];
    A[C + E + 40] ^= D[8 + E] ^ D[16 + E] ^ D[32 + E] ^ D[48 + E] ^ D[56 + E];
    A[C + E + 48] ^= D[16 + E] ^ D[24 + E] ^ D[32 + E] ^ D[40 + E] ^ D[56 + E];
    A[C + E + 56] ^= D[0 + E] ^ D[24 + E] ^ D[32 + E] ^ D[40 + E] ^ D[48 + E];
  }
}

void fn_B(__private uint* A) {
  for (int B = 0; B < 4; B++) {
    for (int C = 0; C < 7; C++)
      A[32 + B * 8 + C + 1] ^= A[B * 8 + C];
  }
  A[32] ^= A[15];
  A[40] ^= A[23];
  A[48] ^= A[31];
  A[56] ^= A[7];

  for (int B = 0; B < 32; B++)
    A[B] ^= A[B + 32];
}

void fn_C(__private uint* A) {
  for (int B = 0; B < 32; B++)
    A[B] ^= A[B + 32];

  for (int B = 0; B < 4; B++) {
    for (int C = 0; C < 7; C++)
      A[32 + B * 8 + C + 1] ^= A[B * 8 + C];
  }
  A[32] ^= A[15];
  A[40] ^= A[23];
  A[48] ^= A[31];
  A[56] ^= A[7];
}

void fn_H(__private uint* A, __private uint* B) {
  uint C, D, E, F, G, H, I, J;
  uint K, L, M, N, O, P, Q, R;
  uint S, T, U, V, W, X, Y, Z, AA, AB, AC, AD, AE, AF, AG;

  K = A[0];
  L = A[1];
  M = A[2];
  N = A[3];
  O = A[4];
  P = A[5];
  Q = A[6];
  R = A[7];

  S = L ^ N ^ Q ^ R;
  K ^= S;
  C = K ^ M;
  D = N ^ Q ^ 0xFFFFFFFF;
  E = K ^ O ^ 0xFFFFFFFF;
  F = L ^ O;
  G = M ^ S ^ 0xFFFFFFFF;
  H = L ^ R ^ 0xFFFFFFFF;
  I = K ^ M ^ P;
  J = M ^ Q;

  K = C ^ G;
  L = D ^ H;
  M = E ^ I;
  N = F ^ J;

  S = N & F;
  T = (M & E) ^ S;
  U = S ^ (M & F) ^ (N & E);
  V = L & D;
  W = (K & C) ^ V;
  X = V ^ (K & D) ^ (L & C);
  S = K ^ M;
  V = L ^ N;
  C ^= E;
  D ^= F;
  Y = V & D;
  E = (S & C) ^ Y ^ W;
  F = Y ^ (S & D) ^ (V & C) ^ X;
  C = U ^ W;
  D = T ^ U ^ X;

  S = C ^ I ^ J;
  T = D ^ J;
  U = E ^ G ^ J;
  V = F ^ G ^ H ^ I;

  W = S & V;
  X = T & U;
  Y = T & V;
  Z = U & V;
  AA = S & X;
  AB = S & Y;
  AC = S & Z;
  AD = T & Z;
  AE = T ^ U;
  AF = AD ^ AC;
  AG = W ^ X;
  O = S ^ AE ^ AF ^ Y ^ AB ^ AG ^ AA;
  P = AE ^ V ^ AD ^ AB ^ (S & U);
  Q = U ^ AF ^ AG;
  R = U ^ V ^ AD ^ W;

  S = O ^ Q;
  T = P ^ R;
  U = R & J;
  V = (Q & I) ^ U;
  W = U ^ (Q & J) ^ (R & I);
  X = P & H;
  Y = (O & G) ^ X;
  Z = X ^ (O & H) ^ (P & G);
  U = G ^ I;
  X = H ^ J;
  AA = T & X;
  G = W ^ Y;
  H = V ^ W ^ Z;
  I = (S & U) ^ AA ^ Y;
  J = AA ^ (S & X) ^ (T & U) ^ Z;
  U = R & N;
  V = (Q & M) ^ U;
  W = U ^ (Q & N) ^ (R & M);
  X = P & L;
  Y = (O & K) ^ X;
  Z = X ^ (O & L) ^ (P & K);
  U = K ^ M;
  X = L ^ N;
  AA = T & X;
  C = W ^ Y;
  D = V ^ W ^ Z;
  E = (S & U) ^ AA ^ Y;
  F = AA ^ (S & X) ^ (T & U) ^ Z;

  S = D ^ I;
  T = H ^ J;
  B[0] = T ^ S;
  B[1] = F ^ J ^ 0xFFFFFFFF;
  B[2] = C ^ E ^ J ^ 0xFFFFFFFF;
  S ^= E ^ F;
  B[3] = T ^ S ^ 0xFFFFFFFF;
  B[4] = C ^ E ^ H;
  B[5] = G ^ S ^ 0xFFFFFFFF;
  B[6] = D ^ H ^ 0xFFFFFFFF;
  B[7] = D ^ F ^ H;
}

void fn_I(__private uint* A, __private uint* B) {
  uint C;
  fn_H(A, B);
  C = B[7];
  for (int D = 7; D > 0; D--)
    B[D] = B[D - 1];
  B[0] = C;
}

void fn_J(__private uint* A, __private uint* B) {
  uint C;
  fn_H(A, B);
  C = B[0];
  for (int D = 0; D < 7; D++)
    B[D] = B[D + 1];
  B[7] = C;
}

void fn_K(__private uint* A, __private uint* B) {
  uint C;
  C = A[7];
  for (int D = 7; D > 0; D--)
    B[D] = A[D - 1];
  B[0] = C;
  fn_H(B, B);
}