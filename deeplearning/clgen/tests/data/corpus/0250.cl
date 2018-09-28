typedef struct AnsTableEntry_Struct {
  ushort freq;
  ushort cum_freq;
  uchar symbol;
} AnsTableEntry;
void fn_A(const __global AnsTableEntry* A, volatile __local uint* B, const uint C, const __global uchar* D, __global uchar* E) {
  uint F = ((const __global uint*)D)[C];
  uint G = ((const __global uint*)(D + F) - get_local_size(0))[get_local_id(0)];
  uint H = (F - (get_local_size(0) * 4)) / 2;
  const __global ushort* I = (const __global ushort*)D;

  barrier(1);

  for (int J = 0; J < 256; ++J) {
    const uint K = G & ((1 << 11) - 1);
    const __global AnsTableEntry* L = A + K;
    G = (G >> 11) * L->freq - L->cum_freq + K;

    const uint M = ((uint)(G < ((1 << 4) * (1 << 11)))) << get_local_id(0);
    atomic_or(B, M);

    barrier(1);

    const uint N = popcount(*B);
    if (M != 0) {
      const uint O = M - 1;
      uint P = N;
      P -= popcount(*B & O) + 1;
      G = (G << 16) | I[H - P - 1];
    }

    barrier(1);

    atomic_and(B, ~M);

    H -= N;

    const int Q = (get_local_id(0) + C * get_local_size(0)) * 256;
    E[Q + 256 - 1 - J] = L->symbol;
  }
}

__kernel void fn_B(const __global AnsTableEntry* A, const __global uchar* B, __global uchar* C) {
  __local uint D;
  if (0 == get_local_id(0)) {
    D = 0;
  }

  fn_A(A, &D, get_group_id(0), B, C);
}

__kernel void fn_C(const __global AnsTableEntry* A, const uint B, const __global uint* C, const __global uchar* D, __global uchar* E) {
  const __global uint* F = C + B;
  const __global uint* G = C;
  uint H = get_group_id(0) * get_local_size(0) * 256;

  uint I = 0;
  uint J = B - 1;
  uint K = (J + I) / 2;

  const uint L = 32 - clz(J - I + 1);
  for (uint M = 0; M < L; ++M) {
    uint N = (uint)(H < G[K]);
    uint O = (uint)(K < (B - 1) && G[K + 1] <= H);

    I = O * max(I + 1, K) + ((1 - O) * I);
    J = N * min(J - 1, K) + ((1 - N) * J);
    K = (J + I) >> 1;
  }
  __local uint P;
  if (0 == get_local_id(0)) {
    P = 0;
  }

  fn_A(A + K * (1 << 11), &P, (H - G[K]) / (get_local_size(0) * 256), D + F[K], E + G[K]);
}