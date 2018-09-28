typedef struct {
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
}

__kernel void fn_D(__global program_state_struct const* restrict A, __global fsm_state* B, __global fsm_state* C, __global uint* D, __global uint* E, __global used_params_struct* F, uint G) {
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

  return;
}