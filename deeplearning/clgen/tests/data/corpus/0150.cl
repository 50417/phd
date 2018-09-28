void fn_A(__global const float* A, int2 B, __local float C[8][4 * 32]) {
  const int D = B.x;

  const int E = 4 * 32 - B.x;

  const int F = ((B.x & 1) ? (-32) : (32));
  const int G = ((B.x & 1) ? (E) : (D));

  C[B.y][G] = *(A - 32);
  C[B.y][G + F] = *(A);
  C[B.y][G + 2 * F] = *(A + 32);
  C[B.y][G + 3 * F] = *(A + 2 * 32);
}

inline int fn_B(int A) {
  return ((A & 1) ? (2 * (32 / 2 - (128 / 2) + 32 - A) + 1) : (2 * (A + ((32 / 2) - (128 / 2) + 1))));
}

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void fn_C(__global const float* A, unsigned int B, unsigned int C, __global float* D, unsigned int E, unsigned int F, __constant float* G) {
  const int2 H = (int2)(get_global_id(0), get_global_id(1));
  const int2 I = (int2)(get_local_id(0), get_local_id(1));

  __local float J[8][4 * 32];

  const int K = H.y * C + H.x + get_group_id(0) * 32 + B;

  fn_A(&A[K], I, J);

  barrier(1);

  int L = fn_B(I.x);

  float M = 0.f;

  for (int N = 0; N < 128; ++N)
    M += G[N] * J[I.y][L + 2 * N];

  D[H.y * F + (H.x ^ 0) + E] = M;
}