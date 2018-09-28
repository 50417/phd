kernel void fn_A(uint A, const global float4* B, global float4* C) {
  local float D[128];
  size_t E = get_global_id(0);
  const size_t F = get_local_id(0);

  for (uint G = 0; G < 64; G++) {
    float H;
    float4 I, J, K, L;
    float4 M, N, O, P;

    float4 Q = B[E * 4];
    float4 R = B[E * 4 + 1];
    float4 S = B[E * 4 + 2];
    float4 T = B[E * 4 + 3];

    for (uint U = 0; U < 64; U++) {
      I = mad(Q, -R, S);
      J = mad(R, S, T);
      K = mad(S, -T, Q);
      L = mad(T, Q, R);

      D[F] = (L.x + L.y + L.z + L.w) * 0.25f;
      barrier(1);
      H = D[(F + 7) % 128];
      barrier(1);

      I += H;
      M = mad(I, J, K);
      N = mad(J, K, L);
      O = mad(K, L, I);
      P = mad(L, I, J);

      D[F] = (J.x + J.y + J.z + J.w) * 0.25f;
      barrier(1);
      H = D[(F + 55) % 128];
      barrier(1);

      M += H;
      I = mad(M, -N, O);
      J = mad(N, O, -P);
      K = mad(O, -P, M);
      L = mad(P, M, -N);

      Q = __builtin_astype((__builtin_astype(I, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      R = __builtin_astype((__builtin_astype(J, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      S = __builtin_astype((__builtin_astype(K, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
      T = __builtin_astype((__builtin_astype(L, uint4) & (0xc7ffffffU)) | 0x40000000U, float4);
    }

    C[E * 4] = Q;
    C[E * 4 + 1] = R;
    C[E * 4 + 2] = S;
    C[E * 4 + 3] = T;

    E += get_global_size(0);
  }
}