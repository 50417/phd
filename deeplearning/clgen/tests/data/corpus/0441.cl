typedef unsigned long ulong; typedef unsigned int uint; ulong fn_A() {
  return __builtin_amdgcn_s_memrealtime();
}

void fn_B(int A) {
  __builtin_amdgcn_s_sleep(A);
}

void fn_C(int A) {
  __builtin_amdgcn_s_incperflevel(A);
}

void fn_D(int A) {
  __builtin_amdgcn_s_decperflevel(A);
}

void fn_E(global ulong* A, int B, int C, uint D) {
  *A = __builtin_amdgcn_sicmp(B, C, D);
}

void fn_F(global ulong* A, uint B, uint C, uint D) {
  *A = __builtin_amdgcn_uicmp(B, C, D);
}

void fn_G(global ulong* A, long B, long C, uint D) {
  *A = __builtin_amdgcn_sicmpl(B, C, D);
}

void fn_H(global ulong* A, ulong B, ulong C, uint D) {
  *A = __builtin_amdgcn_uicmpl(B, C, D);
}

void fn_I(global ulong* A, float B, float C, uint D) {
  *A = __builtin_amdgcn_fcmpf(B, C, D);
}

void fn_J(global ulong* A, double B, double C, uint D) {
  *A = __builtin_amdgcn_fcmp(B, C, D);
}

void fn_K(global int* A, int B, int C) {
  *A = __builtin_amdgcn_ds_swizzle(B, C);
}

void fn_L(global int* A, int B) {
  *A = __builtin_amdgcn_s_getreg(B);
}