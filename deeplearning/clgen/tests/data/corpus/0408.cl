kernel void fn_A(global uint* A, global uint* B, global ushort* C, global ushort* D, int E, global int* F, short G, global short* H, global ulong* I, global ulong* J, long K, global long* L) {
  if (get_global_id(0) % 2 == 0) {
    B[get_global_id(0)] = __builtin_bswap32(A[get_global_id(0)]);
  } else {
    B[get_global_id(0)] = A[get_global_id(0)];
  }

  D[get_global_id(0)] = __builtin_bswap16(C[get_global_id(0)]);
  if (get_global_id(0) % 2 == 1) {
    D[get_global_id(0)] = __builtin_bswap16(D[get_global_id(0)] + 1);
  }

  F[get_global_id(0)] = __builtin_bswap32(E);
  H[get_global_id(0)] = __builtin_bswap16(G);
  J[get_global_id(0)] = ((((I[get_global_id(0)]) & 0xff00000000000000) >> 56) | (((I[get_global_id(0)]) & 0x00ff000000000000) >> 40) | (((I[get_global_id(0)]) & 0x0000ff0000000000) >> 24) | (((I[get_global_id(0)]) & 0x000000ff00000000) >> 8) | (((I[get_global_id(0)]) & 0x00000000ff000000) << 8) | (((I[get_global_id(0)]) & 0x0000000000ff0000) << 24) | (((I[get_global_id(0)]) & 0x000000000000ff00) << 40) | (((I[get_global_id(0)]) & 0x00000000000000ff) << 56));
  L[get_global_id(0)] = ((((K)&0xff00000000000000) >> 56) | (((K)&0x00ff000000000000) >> 40) | (((K)&0x0000ff0000000000) >> 24) | (((K)&0x000000ff00000000) >> 8) | (((K)&0x00000000ff000000) << 8) | (((K)&0x0000000000ff0000) << 24) | (((K)&0x000000000000ff00) << 40) | (((K)&0x00000000000000ff) << 56));
}