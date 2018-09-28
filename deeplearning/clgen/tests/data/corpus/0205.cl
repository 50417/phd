typedef struct Params {
  int Nodes;
  int StartNode;
  double Alpha;
  double Beta;
  double Evap;
  int K;
} Params;

__kernel void fn_A(__constant struct Params* A, __global double* B, __global int* C, __global double* D) {
  int E = get_global_id(0);
  int F = A->Nodes;
  int G = A->K;
  int H = A->Evap;

  for (int I = 0; I < F; ++I) {
    B[(E * F) + I] = ((1 - H) * B[(E * F) + I]);
  }

  for (int J = 0; J < G; ++J) {
    for (int I = 0; I < F; ++I) {
      if (E == C[(J * (F + 1)) + I]) {
        int K = C[(J * (F + 1)) + I + 1];
        B[(E * F) + K] += (1.f / D[J]);
      }
    }
  }
}