inline void fn_A(__local uint* A) {
  int B = get_local_id(0);
  int C = 2 * get_local_size(0) - 1 - B;

  A[B] = B * 2 + 1;
  A[C] = B * 2;
}

inline void fn_B(__local uint* A, __local uint* B, const int C) {
  uint D;

  if ((*A > *B) == C) {
    D = *A;
    *A = *B;
    *B = D;
  }
}

inline void fn_C(__local uint* A, int B) {
  int C = get_local_id(0);
  int D;

  for (uint E = B >> 1; E > 0; E >>= 1) {
    barrier(1);
    D = 2 * C - (C & (E - 1));
    fn_B(&A[D], &A[D + E], 1);
  }
}

__kernel void fn_D(__local uint* A) {
  fn_A(A);
  barrier(1);

  fn_C(A, get_local_size(0) * 2);
}