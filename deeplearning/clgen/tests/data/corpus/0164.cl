kernel void fn_A(global float* A, int B, int C) {
  int D = get_global_id(1) + C + 1;
  A[C + D * B] /= A[C + C * B];
}

kernel void fn_B(global float* A, int B, int C) {
  int D = get_global_id(0) + C + 1;
  int E = get_global_id(1) + C + 1;

  A[D + E * B] -= A[D + C * B] * A[C + E * B];
}

kernel void fn_C(global float* A, global float* B, int C, int D) {
  B[D] = A[(C - 1) + D * C] / A[D + D * C];
}

kernel void fn_D(global float* A, global float* B, int C, int D) {
  int E = get_global_id(1);

  A[(C - 1) + E * C] -= B[D] * A[D + E * C];
}