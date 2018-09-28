typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void fn_A(__global const Node* A, __global int* B, __global int* C, __global int* D, __global int* E, __global int* F, int G) {
  unsigned int H = get_global_id(0);

  if (H < G && C[H] != 0) {
    C[H] = 0;
    int I = (A[H].no_of_edges + A[H].starting);
    for (int J = A[H].starting; J < I; J++) {
      int K = B[J];
      if (!E[K]) {
        F[K] = F[H] + 1;
        D[K] = 1;
      }
    }
  }
}

__kernel void fn_B(__global int* A, __global int* B, __global int* C, __global int* D, int E) {
  unsigned int F = get_global_id(0);
  if (F < E && B[F] == 1) {
    A[F] = 1;
    C[F] = 1;
    *D = 1;
    B[F] = 0;
  }
}