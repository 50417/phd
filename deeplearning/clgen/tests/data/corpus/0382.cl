kernel void fn_A(global double* A, global int* B, global uint* C) {
  int D = get_global_id(0);

  if (D % 3) {
    int E = A[D];
    B[D] = E;

    uint F = A[D];
    C[D] = F;
  }
}

kernel void fn_B(global double* A, global float* B) {
  int C = get_global_id(0);

  float D = A[C];
  B[C] = D;
}

kernel void fn_C(global double* A, global short* B, global ushort* C) {
  int D = get_global_id(0);

  if (D % 3) {
    short E = A[D];
    B[D] = E;

    ushort F = A[D];
    C[D] = F;
  }
}

kernel void fn_D(global double* A, global long* B, global ulong* C) {
  int D = get_global_id(0);

  if (D % 3) {
    long E = A[D];
    B[D] = E;

    ulong F = A[D];
    C[D] = F;
  }
}

kernel void fn_E(global double* A, global char* B, global uchar* C) {
  int D = get_global_id(0);

  if (D % 3) {
    char E = A[D];
    B[D] = E;

    uchar F = A[D];
    C[D] = F;
  }
}

kernel void fn_F(global long* A, global ulong* B, global double* C, global double* D) {
  int E = get_global_id(0);

  double F = A[E];
  C[E] = F;

  F = B[E];
  D[E] = F;
}

kernel void fn_G(global int* A, global uint* B, global double* C, global double* D) {
  int E = get_global_id(0);

  double F = A[E];
  C[E] = F;

  F = B[E];
  D[E] = F;
}

kernel void fn_H(global short* A, global ushort* B, global double* C, global double* D) {
  int E = get_global_id(0);

  double F = A[E];
  C[E] = F;

  F = B[E];
  D[E] = F;
}

kernel void fn_I(global char* A, global uchar* B, global double* C, global double* D) {
  int E = get_global_id(0);

  double F = A[E];
  C[E] = F;

  F = B[E];
  D[E] = F;
}

kernel void fn_J(global float* A, global double* B) {
  int C = get_global_id(0);

  double D = A[C];
  B[C] = D;
}