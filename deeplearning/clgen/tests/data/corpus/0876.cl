inline uint fn_A(uint A, __local uint* B, uint C) {
  uint D = 2 * get_local_id(0) - (get_local_id(0) & (C - 1));
  B[D] = 0;
  D += C;
  B[D] = A;

  for (uint E = 1; E < C; E <<= 1) {
    barrier(1);
    uint F = B[D] + B[D - E];
    barrier(1);
    B[D] = F;
  }

  return B[D];
}

inline uint fn_B(uint A, __local uint* B, uint C) {
  return fn_A(A, B, C) - A;
}
inline uint4 fn_C(uint4 A, __local uint* B, uint C) {
  A.y += A.x;
  A.z += A.y;
  A.w += A.z;

  uint D = fn_A(A.w, B, C / 4) - A.w;

  return (A + (uint4)D);
}

inline uint4 fn_D(uint4 A, __local uint* B, uint C) {
  return fn_C(A, B, C) - A;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void fn_E(__global uint4* A, __global uint4* B, __local uint* C, uint D) {
  uint4 E = B[get_global_id(0)];

  uint4 F = fn_D(E, C, D);

  A[get_global_id(0)] = F;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void fn_F(__global uint* A, __global uint* B, __global uint* C, __local uint* D, uint E, uint F) {
  uint G = 0;
  if (get_global_id(0) < E)
    G = B[(4 * 256 - 1) + (4 * 256) * get_global_id(0)] + C[(4 * 256 - 1) + (4 * 256) * get_global_id(0)];

  uint H = fn_B(G, D, F);

  if (get_global_id(0) < E)
    A[get_global_id(0)] = H;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void fn_G(__global uint4* A, __global uint* B) {
  __local uint C[1];

  uint4 D = A[get_global_id(0)];

  if (get_local_id(0) == 0)
    C[0] = B[get_group_id(0)];

  barrier(1);
  D += (uint4)C[0];
  A[get_global_id(0)] = D;
}