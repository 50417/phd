inline void fn_A(uint* A, uint* B, uint* C, uint* D, uint E) {
  if ((*A > *C) == E) {
    uint F;
    F = *A;
    *A = *C;
    *C = F;
    F = *B;
    *B = *D;
    *D = F;
  }
}

inline void fn_B(__local uint* A, __local uint* B, __local uint* C, __local uint* D, uint E) {
  if ((*A > *C) == E) {
    uint F;
    F = *A;
    *A = *C;
    *C = F;
    F = *B;
    *B = *D;
    *D = F;
  }
}

__kernel __attribute__((reqd_work_group_size(1024 / 2, 1, 1))) void fn_C(__global uint* A, __global uint* B, __global uint* C, __global uint* D, uint E, uint F) {
  __local uint G[1024];
  __local uint H[1024];

  C += get_group_id(0) * 1024 + get_local_id(0);
  D += get_group_id(0) * 1024 + get_local_id(0);
  A += get_group_id(0) * 1024 + get_local_id(0);
  B += get_group_id(0) * 1024 + get_local_id(0);
  G[get_local_id(0) + 0] = C[0];
  H[get_local_id(0) + 0] = D[0];
  G[get_local_id(0) + (1024 / 2)] = C[(1024 / 2)];
  H[get_local_id(0) + (1024 / 2)] = D[(1024 / 2)];

  for (uint I = 2; I < E; I <<= 1) {
    uint J = ((get_local_id(0) & (I / 2)) != 0);
    for (uint K = I / 2; K > 0; K >>= 1) {
      barrier(1);
      uint L = 2 * get_local_id(0) - (get_local_id(0) & (K - 1));
      fn_B(&G[L + 0], &H[L + 0], &G[L + K], &H[L + K], J);
    }
  }

  {
    for (uint K = E / 2; K > 0; K >>= 1) {
      barrier(1);
      uint L = 2 * get_local_id(0) - (get_local_id(0) & (K - 1));
      fn_B(&G[L + 0], &H[L + 0], &G[L + K], &H[L + K], F);
    }
  }

  barrier(1);
  A[0] = G[get_local_id(0) + 0];
  B[0] = H[get_local_id(0) + 0];
  A[(1024 / 2)] = G[get_local_id(0) + (1024 / 2)];
  B[(1024 / 2)] = H[get_local_id(0) + (1024 / 2)];
}
__kernel __attribute__((reqd_work_group_size(1024 / 2, 1, 1))) void fn_D(__global uint* A, __global uint* B, __global uint* C, __global uint* D) {
  __local uint E[1024];
  __local uint F[1024];

  C += get_group_id(0) * 1024 + get_local_id(0);
  D += get_group_id(0) * 1024 + get_local_id(0);
  A += get_group_id(0) * 1024 + get_local_id(0);
  B += get_group_id(0) * 1024 + get_local_id(0);
  E[get_local_id(0) + 0] = C[0];
  F[get_local_id(0) + 0] = D[0];
  E[get_local_id(0) + (1024 / 2)] = C[(1024 / 2)];
  F[get_local_id(0) + (1024 / 2)] = D[(1024 / 2)];

  uint G = get_global_id(0) & ((1024 / 2) - 1);

  for (uint H = 2; H < 1024; H <<= 1) {
    uint I = (G & (H / 2)) != 0;
    for (uint J = H / 2; J > 0; J >>= 1) {
      barrier(1);
      uint K = 2 * get_local_id(0) - (get_local_id(0) & (J - 1));
      fn_B(&E[K + 0], &F[K + 0], &E[K + J], &F[K + J], I);
    }
  }

  {
    uint I = (get_group_id(0) & 1);
    for (uint J = 1024 / 2; J > 0; J >>= 1) {
      barrier(1);
      uint K = 2 * get_local_id(0) - (get_local_id(0) & (J - 1));
      fn_B(&E[K + 0], &F[K + 0], &E[K + J], &F[K + J], I);
    }
  }

  barrier(1);
  A[0] = E[get_local_id(0) + 0];
  B[0] = F[get_local_id(0) + 0];
  A[(1024 / 2)] = E[get_local_id(0) + (1024 / 2)];
  B[(1024 / 2)] = F[get_local_id(0) + (1024 / 2)];
}

__kernel void fn_E(__global uint* A, __global uint* B, __global uint* C, __global uint* D, uint E, uint F, uint G, uint H) {
  uint I = get_global_id(0);
  uint J = I & (E / 2 - 1);

  uint K = H ^ ((J & (F / 2)) != 0);
  uint L = 2 * I - (I & (G - 1));

  uint M = C[L + 0];
  uint N = D[L + 0];
  uint O = C[L + G];
  uint P = D[L + G];

  fn_A(&M, &N, &O, &P, K);

  A[L + 0] = M;
  B[L + 0] = N;
  A[L + G] = O;
  B[L + G] = P;
}

__kernel __attribute__((reqd_work_group_size(1024 / 2, 1, 1))) void fn_F(__global uint* A, __global uint* B, __global uint* C, __global uint* D, uint E, uint F, uint G, uint H) {
  __local uint I[1024];
  __local uint J[1024];

  C += get_group_id(0) * 1024 + get_local_id(0);
  D += get_group_id(0) * 1024 + get_local_id(0);
  A += get_group_id(0) * 1024 + get_local_id(0);
  B += get_group_id(0) * 1024 + get_local_id(0);
  I[get_local_id(0) + 0] = C[0];
  J[get_local_id(0) + 0] = D[0];
  I[get_local_id(0) + (1024 / 2)] = C[(1024 / 2)];
  J[get_local_id(0) + (1024 / 2)] = D[(1024 / 2)];

  uint K = get_global_id(0) & ((E / 2) - 1);
  uint L = H ^ ((K & (G / 2)) != 0);
  for (; F > 0; F >>= 1) {
    barrier(1);
    uint M = 2 * get_local_id(0) - (get_local_id(0) & (F - 1));
    fn_B(&I[M + 0], &J[M + 0], &I[M + F], &J[M + F], L);
  }

  barrier(1);
  A[0] = I[get_local_id(0) + 0];
  B[0] = J[get_local_id(0) + 0];
  A[(1024 / 2)] = I[get_local_id(0) + (1024 / 2)];
  B[(1024 / 2)] = J[get_local_id(0) + (1024 / 2)];
}