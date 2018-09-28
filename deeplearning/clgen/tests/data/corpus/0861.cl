typedef struct {
  int i;
  int n;
} program_state_struct;

typedef unsigned char fsm_state;

void fn_A(program_state_struct* A, const __global program_state_struct* B) {
  if (A == 0 || B == 0)
    return;

  A->i = B->i;
  A->n = B->n;
}

__kernel void fn_B(__global program_state_struct const* restrict A, __global fsm_state* B, uint C) {
  uint D = C;
  int E = get_global_id(0);
  int F = D / get_global_size(0);

  program_state_struct G;

  for (int H = (E * F); H < ((E + 1) * F); ++H) {
    fn_A(&G, &A[H]);
  }

  return;
}