typedef struct {
  int starting;
  int no_of_edges;
} Node;

__kernel void fn_A(const __global Node* A, const __global int* B, __global char* C, __global char* D, __global char* E, __global int* F, const int G) {
  int H = get_global_id(0);
  if (H < G && C[H]) {
    C[H] = false;
    for (int I = A[H].starting; I < (A[H].no_of_edges + A[H].starting); I++) {
      int J = B[I];
      if (!E[J]) {
        F[J] = F[H] + 1;
        D[J] = true;
      }
    }
  }
}

__kernel void fn_B(__global char* A, __global char* B, __global char* C, __global char* D, const int E) {
  int F = get_global_id(0);
  if (F < E && B[F]) {
    A[F] = true;
    C[F] = true;
    *D = true;
    B[F] = false;
  }
}