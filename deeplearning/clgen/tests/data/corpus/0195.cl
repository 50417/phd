typedef unsigned int u32; typedef struct {
  u32 m_key;
  u32 m_value;
} SortData;

typedef struct {
  u32 m_startBit;
  u32 m_numGroups;
  u32 m_padding[2];
} ConstBuffer;

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_A(__global SortData* A, __global u32* B, ConstBuffer C) {
  __local u32 D[16][256];

  int E = get_local_id(0);
  int F = get_global_id(0);

  for (int G = 0; G < 16; G++) {
    D[G][E] = 0.f;
    D[G][E + 128] = 0.f;
  }

  barrier(1);

  SortData H[4];
  H[0] = A[F * 4 + 0];
  H[1] = A[F * 4 + 1];
  H[2] = A[F * 4 + 2];
  H[3] = A[F * 4 + 3];

  H[0].m_key = (H[0].m_key >> C.m_startBit) & 0xff;
  H[1].m_key = (H[1].m_key >> C.m_startBit) & 0xff;
  H[2].m_key = (H[2].m_key >> C.m_startBit) & 0xff;
  H[3].m_key = (H[3].m_key >> C.m_startBit) & 0xff;

  int I = E % 16;

  atom_inc(&(D[I][H[0].m_key]));
  atom_inc(&(D[I][H[1].m_key]));
  atom_inc(&(D[I][H[2].m_key]));
  atom_inc(&(D[I][H[3].m_key]));

  barrier(1);

  u32 J, K;
  J = K = 0;
  for (int G = 0; G < 16; G++) {
    J += D[G][E];
    K += D[G][E + 128];
  }

  B[E * C.m_numGroups + get_group_id(0)] = J;
  B[(E + 128) * C.m_numGroups + get_group_id(0)] = K;
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void fn_B(__global SortData* A, __global SortData* B, __global u32* C, ConstBuffer D) {
  __local u32 E[256];

  int F = get_local_id(0);
  int G = get_global_id(0);

  {
    E[F] = C[F * D.m_numGroups + get_group_id(0)];
    E[F + 128] = C[(F + 128) * D.m_numGroups + get_group_id(0)];
  }

  barrier(1);

  SortData H[4];
  int I[4];
  H[0] = A[G * 4 + 0];
  H[1] = A[G * 4 + 1];
  H[2] = A[G * 4 + 2];
  H[3] = A[G * 4 + 3];

  I[0] = (H[0].m_key >> D.m_startBit) & 0xff;
  I[1] = (H[1].m_key >> D.m_startBit) & 0xff;
  I[2] = (H[2].m_key >> D.m_startBit) & 0xff;
  I[3] = (H[3].m_key >> D.m_startBit) & 0xff;

  int J[4];
  for (int K = 0; K < 128; K++) {
    if (K == F) {
      J[0] = atom_inc(&(E[I[0]]));
      J[1] = atom_inc(&(E[I[1]]));
      J[2] = atom_inc(&(E[I[2]]));
      J[3] = atom_inc(&(E[I[3]]));
    }
    barrier(1);
  }
  B[J[0]] = H[0];
  B[J[1]] = H[1];
  B[J[2]] = H[2];
  B[J[3]] = H[3];
}