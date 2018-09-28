void fn_A(global float* A, float B) {
  *A = __builtin_amdgpu_rsqf(B);
}

void fn_B(global double* A, double B) {
  *A = __builtin_amdgpu_rsq(B);
}

void fn_C(global float* A, float B, int C) {
  *A = __builtin_amdgpu_ldexpf(B, C);
}

void fn_D(global double* A, double B, int C) {
  *A = __builtin_amdgpu_ldexp(B, C);
}