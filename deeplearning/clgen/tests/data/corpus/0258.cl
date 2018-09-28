__kernel void fn_A(int A, __global float* B, __global int* C) {
  int D = get_global_id(0);
  if (D >= A) {
    return;
  }

  B[D] = 3.402823466e+38;
  C[D] = 0;
}

__kernel void fn_B(int A, __global int* B) {
  int C = get_global_id(0);
  if (C >= A) {
    return;
  }

  B[C] = 0;
}

__kernel void fn_C(int A, __global int* B, __global int* C) {
  int D = get_global_id(0);
  if (D >= A) {
    return;
  }

  B[D] = 0;
  C[D] = 0;
}

__kernel void fn_D(int A, __global int* B, int C) {
  int D = get_global_id(0);
  if (D >= A) {
    return;
  }

  B[D] = C;
}