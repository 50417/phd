typedef unsigned long ulong; typedef unsigned int uint; void fn_A(global int* A, int B) {
  __builtin_amdgcn_s_memrealtime();
  *A = __builtin_amdgcn_mov_dpp(B, 0, 0, 0, false);
}

void fn_B(int A) {
  __builtin_amdgcn_s_sleep(A);
}

void fn_C(int A) {
  __builtin_amdgcn_s_waitcnt(A);
}

void fn_D(int A) {
  __builtin_amdgcn_s_sendmsg(A, 1);
}

void fn_E(int A, int B) {
  __builtin_amdgcn_s_sendmsg(A, B);
}

void fn_F(int A) {
  __builtin_amdgcn_s_sendmsghalt(A, 1);
}

void fn_G(int A, int B) {
  __builtin_amdgcn_s_sendmsghalt(A, B);
}

void fn_H(int A) {
  __builtin_amdgcn_s_incperflevel(A);
}

void fn_I(int A) {
  __builtin_amdgcn_s_decperflevel(A);
}

void fn_J(global ulong* A, int B, int C, uint D) {
  *A = __builtin_amdgcn_sicmp(B, C, D);
}

void fn_K(global ulong* A, uint B, uint C, uint D) {
  *A = __builtin_amdgcn_uicmp(B, C, D);
}

void fn_L(global ulong* A, long B, long C, uint D) {
  *A = __builtin_amdgcn_sicmpl(B, C, D);
}

void fn_M(global ulong* A, ulong B, ulong C, uint D) {
  *A = __builtin_amdgcn_uicmpl(B, C, D);
}

void fn_N(global ulong* A, float B, float C, uint D) {
  *A = __builtin_amdgcn_fcmpf(B, C, D);
}

void fn_O(global ulong* A, double B, double C, uint D) {
  *A = __builtin_amdgcn_fcmp(B, C, D);
}

void fn_P(global int* A, int B, int C) {
  *A = __builtin_amdgcn_ds_swizzle(B, C);
}

void fn_Q(global int* A, int B) {
  *A = __builtin_amdgcn_s_getreg(B);
}

void fn_R(global int* A, int B, int C, int D, int E, bool F) {
  *A = __builtin_amdgcn_mov_dpp(B, C, 0, 0, false);
  *A = __builtin_amdgcn_mov_dpp(B, 0, D, 0, false);
  *A = __builtin_amdgcn_mov_dpp(B, 0, 0, E, false);
  *A = __builtin_amdgcn_mov_dpp(B, 0, 0, 0, F);
}