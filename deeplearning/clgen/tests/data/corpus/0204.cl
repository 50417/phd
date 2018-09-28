typedef struct Params {
  int Nodes;
  int StartNode;
  double Alpha;
  double Beta;
  double Evap;
  int K;
} Params;

double fn_A(double A, int B) {
  double C = 1000;
  long D = B + A;
  D = (D * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
  int E = (D >> 16) % ((int)C);
  return (E / C);
}

__kernel void fn_B(__constant struct Params* A, __global double* B, __global double* C, __global double* D, __global int* E, __global double* F) {
  int G = get_global_id(0);
  int H = A->Nodes;

  int I = 0;

  double J = fn_A(D[I], G);
  F[G] = J;
}