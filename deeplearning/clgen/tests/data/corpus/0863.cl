typedef struct {
  int i;
  int n;
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
  A->n = B->n;
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
void fn_F(bool A, fsm_state B, fsm_state* C) {
  if (B == 5 && (A))
    *C = 5;
  if (B == 5 && (!A))
    *C = 3;
  if (B == 3 && (A))
    *C = 3;
  if (B == 3 && (!A))
    *C = 3;
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

prop0:
  if (I + J <= D[0])
    goto prop1;

  P = C[0];

  for (int V = (I * J); V < ((I + 1) * J); ++V) {
    if (V < D[0])
      continue;
    fn_C(&O, &A[V]);

    S = O.i;
    T = O.n;

    U = (S <= T + 1);

    fn_F(U, P, &Q);
    if (P != Q) {
      atomic_min(&(R), V);
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