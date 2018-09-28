kernel void fn_A(global uint* A, global uint* B, global uint* C) {
  uint D = A[0];
  uint E = get_global_id(0);
  if (E < D) {
    C[E] = E;
  }
}
kernel void fn_B(global const uint* A, global const uint* B, global uint* C, global uint* D) {
  int E = get_global_id(0);
  int F = get_global_size(0);
  uint G = A[E];
  uint H = B[E];

  int I = 0;
  for (int J = 0; J < F; J++) {
    uint K = A[J];
    bool L = (K < G) || (K == G && J < E);
    I += (L) ? 1 : 0;
  }
  C[I] = G;
  D[I] = H;
}

kernel void fn_C(global const uint* A, global uint* B, int C, int D) {
  int E = get_global_id(0);
  int F = E ^ C;

  uint G = A[E];
  uint H = G;
  uint I = A[F];
  uint J = I;

  bool K = (J < H) || (J == H && F < E);
  bool L = K ^ (F < E) ^ ((D & E) != 0);

  B[E] = (L) ? I : G;
}

kernel void fn_D(global const uint* A, global uint* B, int C, int D) {
  int E = get_global_id(0);
  int F = E & (C - 1);
  int G = (E << 1) - F;
  int H = G | C;

  uint I = A[G];
  uint J = I;
  uint K = A[H];
  uint L = K;

  bool M = (L < J) || (L == J && H < G);
  bool N = M ^ ((D & G) != 0);

  B[G] = (N) ? K : I;
  B[H] = (N) ? I : K;
}
kernel void fn_E(global uint* A, global uint* B, global uint* C) {
  uint D = A[0];
  uint E = A[1];
  int F = get_global_id(0);
  int G = F & (D - 1);
  int H = (F << 1) - G;
  bool I = ((E & H) == 0);
  B += H;
  C += H;

  uint J = B[0];
  uint K = C[0];
  uint L = B[D];
  uint M = C[D];

  bool N = I ^ (J < L);

  B[0] = (N) ? L : J;
  C[0] = (N) ? M : K;
  B[D] = (N) ? J : L;
  C[D] = (N) ? K : M;
}

kernel void fn_F(global uint* A, int B, int C) {
  B >>= 1;
  int D = get_global_id(0);
  int E = D & (B - 1);
  int F = ((D - E) << 2) + E;
  bool G = ((C & F) == 0);
  A += F;

  uint H = A[0];
  uint I = A[B];
  uint J = A[2 * B];
  uint K = A[3 * B];

  {
    bool L = G ^ (H < J);
    uint M = H;
    uint N = J;
    H = (L) ? N : M;
    J = (L) ? M : N;
  }
  {
    bool L = G ^ (I < K);
    uint M = I;
    uint N = K;
    I = (L) ? N : M;
    K = (L) ? M : N;
  }
  {
    bool L = G ^ (H < I);
    uint M = H;
    uint N = I;
    H = (L) ? N : M;
    I = (L) ? M : N;
  }
  {
    bool L = G ^ (J < K);
    uint M = J;
    uint N = K;
    J = (L) ? N : M;
    K = (L) ? M : N;
  }

  A[0] = H;
  A[B] = I;
  A[2 * B] = J;
  A[3 * B] = K;
}
kernel void fn_G(global uint* A, int B, int C) {
  B >>= 2;
  int D = get_global_id(0);
  int E = D & (B - 1);
  int F = ((D - E) << 3) + E;
  bool G = ((C & F) == 0);
  A += F;

  uint H[8];
  for (int I = 0; I < 8; I++)
    H[I] = A[I * B];

  {
    for (int J = 0; J < 4; J++) {
      {
        bool K = G ^ (H[0 + J] < H[0 + J + 4]);
        uint L = H[0 + J];
        uint M = H[0 + J + 4];
        H[0 + J] = (K) ? M : L;
        H[0 + J + 4] = (K) ? L : M;
      }
    }
    {
      for (int N = 0; N < 2; N++) {
        {
          bool K = G ^ (H[0 + N] < H[0 + N + 2]);
          uint L = H[0 + N];
          uint M = H[0 + N + 2];
          H[0 + N] = (K) ? M : L;
          H[0 + N + 2] = (K) ? L : M;
        }
      }
      {{bool K = G ^ (H[0] < H[0 + 1]);
      uint L = H[0];
      uint M = H[0 + 1];
      H[0] = (K) ? M : L;
      H[0 + 1] = (K) ? L : M;
    }
  }
  {
    {
      bool K = G ^ (H[0 + 2] < H[0 + 2 + 1]);
      uint L = H[0 + 2];
      uint M = H[0 + 2 + 1];
      H[0 + 2] = (K) ? M : L;
      H[0 + 2 + 1] = (K) ? L : M;
    }
  }
}
{
  for (int N = 0; N < 2; N++) {
    {
      bool K = G ^ (H[0 + 4 + N] < H[0 + 4 + N + 2]);
      uint L = H[0 + 4 + N];
      uint M = H[0 + 4 + N + 2];
      H[0 + 4 + N] = (K) ? M : L;
      H[0 + 4 + N + 2] = (K) ? L : M;
    }
  }
  {{bool K = G ^ (H[0 + 4] < H[0 + 4 + 1]);
  uint L = H[0 + 4];
  uint M = H[0 + 4 + 1];
  H[0 + 4] = (K) ? M : L;
  H[0 + 4 + 1] = (K) ? L : M;
}
}
{
  {
    bool K = G ^ (H[0 + 4 + 2] < H[0 + 4 + 2 + 1]);
    uint L = H[0 + 4 + 2];
    uint M = H[0 + 4 + 2 + 1];
    H[0 + 4 + 2] = (K) ? M : L;
    H[0 + 4 + 2 + 1] = (K) ? L : M;
  }
}
}
}

for (int I = 0; I < 8; I++)
  A[I * B] = H[I];
}

kernel void fn_H(global uint* A, int B, int C) {
  B >>= 3;
  int D = get_global_id(0);
  int E = D & (B - 1);
  int F = ((D - E) << 4) + E;
  bool G = ((C & F) == 0);
  A += F;

  uint H[16];
  for (int I = 0; I < 16; I++)
    H[I] = A[I * B];

  {
    for (int J = 0; J < 8; J++) {
      {
        bool K = G ^ (H[0 + J] < H[0 + J + 8]);
        uint L = H[0 + J];
        uint M = H[0 + J + 8];
        H[0 + J] = (K) ? M : L;
        H[0 + J + 8] = (K) ? L : M;
      }
    }
    {
      for (int N = 0; N < 4; N++) {
        {
          bool K = G ^ (H[0 + N] < H[0 + N + 4]);
          uint L = H[0 + N];
          uint M = H[0 + N + 4];
          H[0 + N] = (K) ? M : L;
          H[0 + N + 4] = (K) ? L : M;
        }
      }
      {
        for (int O = 0; O < 2; O++) {
          {
            bool K = G ^ (H[0 + O] < H[0 + O + 2]);
            uint L = H[0 + O];
            uint M = H[0 + O + 2];
            H[0 + O] = (K) ? M : L;
            H[0 + O + 2] = (K) ? L : M;
          }
        }
        {{bool K = G ^ (H[0] < H[0 + 1]);
        uint L = H[0];
        uint M = H[0 + 1];
        H[0] = (K) ? M : L;
        H[0 + 1] = (K) ? L : M;
      }
    }
    {
      {
        bool K = G ^ (H[0 + 2] < H[0 + 2 + 1]);
        uint L = H[0 + 2];
        uint M = H[0 + 2 + 1];
        H[0 + 2] = (K) ? M : L;
        H[0 + 2 + 1] = (K) ? L : M;
      }
    }
  }
  {
    for (int O = 0; O < 2; O++) {
      {
        bool K = G ^ (H[0 + 4 + O] < H[0 + 4 + O + 2]);
        uint L = H[0 + 4 + O];
        uint M = H[0 + 4 + O + 2];
        H[0 + 4 + O] = (K) ? M : L;
        H[0 + 4 + O + 2] = (K) ? L : M;
      }
    }
    {{bool K = G ^ (H[0 + 4] < H[0 + 4 + 1]);
    uint L = H[0 + 4];
    uint M = H[0 + 4 + 1];
    H[0 + 4] = (K) ? M : L;
    H[0 + 4 + 1] = (K) ? L : M;
  }
}
{
  {
    bool K = G ^ (H[0 + 4 + 2] < H[0 + 4 + 2 + 1]);
    uint L = H[0 + 4 + 2];
    uint M = H[0 + 4 + 2 + 1];
    H[0 + 4 + 2] = (K) ? M : L;
    H[0 + 4 + 2 + 1] = (K) ? L : M;
  }
}
}
}
{
  for (int N = 0; N < 4; N++) {
    {
      bool K = G ^ (H[0 + 8 + N] < H[0 + 8 + N + 4]);
      uint L = H[0 + 8 + N];
      uint M = H[0 + 8 + N + 4];
      H[0 + 8 + N] = (K) ? M : L;
      H[0 + 8 + N + 4] = (K) ? L : M;
    }
  }
  {
    for (int O = 0; O < 2; O++) {
      {
        bool K = G ^ (H[0 + 8 + O] < H[0 + 8 + O + 2]);
        uint L = H[0 + 8 + O];
        uint M = H[0 + 8 + O + 2];
        H[0 + 8 + O] = (K) ? M : L;
        H[0 + 8 + O + 2] = (K) ? L : M;
      }
    }
    {{bool K = G ^ (H[0 + 8] < H[0 + 8 + 1]);
    uint L = H[0 + 8];
    uint M = H[0 + 8 + 1];
    H[0 + 8] = (K) ? M : L;
    H[0 + 8 + 1] = (K) ? L : M;
  }
}
{
  {
    bool K = G ^ (H[0 + 8 + 2] < H[0 + 8 + 2 + 1]);
    uint L = H[0 + 8 + 2];
    uint M = H[0 + 8 + 2 + 1];
    H[0 + 8 + 2] = (K) ? M : L;
    H[0 + 8 + 2 + 1] = (K) ? L : M;
  }
}
}
{
  for (int O = 0; O < 2; O++) {
    {
      bool K = G ^ (H[0 + 8 + 4 + O] < H[0 + 8 + 4 + O + 2]);
      uint L = H[0 + 8 + 4 + O];
      uint M = H[0 + 8 + 4 + O + 2];
      H[0 + 8 + 4 + O] = (K) ? M : L;
      H[0 + 8 + 4 + O + 2] = (K) ? L : M;
    }
  }
  {{bool K = G ^ (H[0 + 8 + 4] < H[0 + 8 + 4 + 1]);
  uint L = H[0 + 8 + 4];
  uint M = H[0 + 8 + 4 + 1];
  H[0 + 8 + 4] = (K) ? M : L;
  H[0 + 8 + 4 + 1] = (K) ? L : M;
}
}
{
  {
    bool K = G ^ (H[0 + 8 + 4 + 2] < H[0 + 8 + 4 + 2 + 1]);
    uint L = H[0 + 8 + 4 + 2];
    uint M = H[0 + 8 + 4 + 2 + 1];
    H[0 + 8 + 4 + 2] = (K) ? M : L;
    H[0 + 8 + 4 + 2 + 1] = (K) ? L : M;
  }
}
}
}
}

for (int I = 0; I < 16; I++)
  A[I * B] = H[I];
}