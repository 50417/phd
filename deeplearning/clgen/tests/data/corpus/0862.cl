typedef struct {
  int i;
  int j;
} program_state_struct;

typedef struct { int dummy; } used_params_struct;

typedef unsigned char fsm_state;

bool fn_A(fsm_state A) {
  if ((A ^ 0x00) == 0 || (A ^ 0x03) == 0)
    return true;
  return false;
}

bool fn_B(char* A, __constant char* B) {
  int C = 0;
  while (A[C] != '\0' && B[C] != '\0') {
    if (A[C] != B[C])
      return false;
    ++C;
  }
  if (A[C] != B[C])
    return false;
  return true;
}

void fn_C(program_state_struct* A, const __global program_state_struct* B) {
  if (A == 0 || B == 0)
    return;

  A->i = B->i;
  A->j = B->j;
}

unsigned int fn_D(unsigned int A, fsm_state B) {
  if (A == 0 && B == 5)
    return 0;
  if (A == 0 && B == 3)
    return 1;

  return 0;
}

fsm_state fn_E(unsigned int A, unsigned int B) {
  if (A == 0 && B == 0)
    return 5;
  if (A == 0 && B == 1)
    return 3;

  return 0;
}
void fn_F(bool A, bool B, fsm_state C, fsm_state* D) {
  if (C == 5 && (A && B))
    *D = 5;
  if (C == 5 && (A && !B))
    *D = 3;
  if (C == 5 && (!A && B))
    *D = 3;
  if (C == 5 && (!A && !B))
    *D = 3;
  if (C == 3 && (A && B))
    *D = 3;
  if (C == 3 && (A && !B))
    *D = 3;
  if (C == 3 && (!A && B))
    *D = 3;
  if (C == 3 && (!A && !B))
    *D = 3;
  else
    return;
}

__kernel void fn_G(__global program_state_struct const* restrict A, __global fsm_state* B, __global fsm_state* C, __global uint* D, __global uint* E, __global used_params_struct* F, uint G) {
  uint H = G;
  int I = get_global_id(0);
  int J = H / get_global_size(0);
  int K = get_group_id(0);
  int L = get_local_id(0);
  uint M = get_num_groups(0);
  unsigned int N = 0;

  program_state_struct O;
  fsm_state P;
  fsm_state Q;

  __local uint R;

  if (L == 0) {
    R = H;
    E[0 * M + K] = H;
  }

  int S;
  int T;

  bool U;
  bool V;

prop0:
  if (I + J <= D[0])
    goto prop1;

  P = C[0];

  for (int T = (I * J); T < ((I + 1) * J); ++T) {
    if (T < D[0])
      continue;
    fn_C(&O, &A[T]);

    S = O.i;
    T = O.j;

    U = (S >= 0);

    V = (T >= 0);

    fn_F(U, V, P, &Q);
    if (P != Q) {
      atomic_min(&(R), T);
      break;
    }
  }

prop1:

  barrier(1);
  if (L == 0) {
    E[0 * M + K] = R;
  }
  return;
}