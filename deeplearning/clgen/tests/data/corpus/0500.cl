int fn_A(double* A, int B, double C) {
  int D = -1;
  int E;
  for (E = 0; E < B; E++) {
    if (A[E] >= C) {
      D = E;
      break;
    }
  }
  if (D == -1)
    return B - 1;
  return D;
}

int fn_B(double* A, int B, int C, double D) {
  if (C < B)
    return -1;
  int E;
  while (C > B) {
    E = B + ((C - B) / 2);
    if (A[E] >= D) {
      if (E == 0)
        return E;
      else if (A[E - 1] < D)
        return E;
      else if (A[E - 1] == D) {
        while (A[E] == D && E >= 0)
          E--;
        E++;
        return E;
      }
    }
    if (A[E] > D)
      C = E - 1;
    else
      B = E + 1;
  }
  return -1;
}
__kernel void fn_C(__global double* A, __global double* B, __global double* C, __global double* D, __global double* E, __global double* F, int G) {
  int H = get_global_id(0);

  if (H < G) {
    int I = -1;
    int J;

    for (J = 0; J < G; J++) {
      if (C[J] >= D[H]) {
        I = J;
        break;
      }
    }
    if (I == -1) {
      I = G - 1;
    }

    E[H] = A[I];
    F[H] = B[I];
  }
}