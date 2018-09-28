typedef unsigned int u32; u32 fn_A(__local u32* A, u32 B, int C, int D) {
  u32 E;
  int F = 1;
  for (int G = B >> 1; G > 0; G >>= 1, F <<= 1) {
    barrier(1);
    for (int H = C; H < G; H += D) {
      int I = F * (2 * H + 1) - 1;
      int J = F * (2 * H + 2) - 1;
      A[J] += A[I];
    }
  }

  barrier(1);

  if (C == 0) {
    E = A[B - 1];
    A[B - 1] = 0;
  }

  barrier(1);

  F >>= 1;
  for (int G = 1; G < B; G <<= 1, F >>= 1) {
    barrier(1);
    for (int H = C; H < G; H += D) {
      int I = F * (2 * H + 1) - 1;
      int J = F * (2 * H + 2) - 1;
      u32 K = A[I];
      A[I] = A[J];
      A[J] += K;
    }
  }
  barrier(1);

  return E;
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void fn_B(__global u32* A, __global u32* B, __global u32* C, uint4 D) {
  __local u32 E[128 * 2];

  int F = get_global_id(0);
  int G = get_local_id(0);

  E[2 * G] = (2 * F < D.x) ? B[2 * F] : 0;
  E[2 * G + 1] = (2 * F + 1 < D.x) ? B[2 * F + 1] : 0;

  u32 H = fn_A(E, 128 * 2, get_local_id(0), get_local_size(0));

  if (G == 0)
    C[get_group_id(0)] = H;

  if ((2 * F) < D.x) {
    A[2 * F] = E[2 * G];
  }
  if ((2 * F + 1) < D.x) {
    A[2 * F + 1] = E[2 * G + 1];
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void fn_C(__global u32* A, __global u32* B, uint4 C) {
  const u32 D = 128 * 2;

  int E = get_group_id(0) + 1;
  int F = get_local_id(0);

  u32 G = B[E];

  int H = min((E + 1) * (D), C.x);
  for (int I = E * D + F; I < H; I += get_local_size(0)) {
    A[I] += G;
  }
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void fn_D(__global u32* A, uint4 B) {
  __local u32 C[2048];
  int D = get_global_id(0);
  int E = get_local_id(0);
  int F = get_local_size(0);

  for (int G = E; G < B.z; G += F) {
    C[G] = (G < B.y) ? A[G] : 0;
  }

  barrier(1);

  u32 H = fn_A(C, B.z, get_local_id(0), get_local_size(0));

  for (int G = E; G < B.y; G += F) {
    A[G] = C[G];
  }

  if (D == 0) {
    A[B.y] = H;
  }
}