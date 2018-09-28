__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void fn_A(__global int* A, __global int* B, __global int* C, int D, int E, int F) {
  int G = E;
  int H = D;
  int I = F;

  int J[16][16] __attribute__((xcl_array_partition(complete, 1)));
  ;
  int K[16][16] __attribute__((xcl_array_partition(complete, 2)));
  ;
  int L[16][16] __attribute__((xcl_array_partition(complete, 0)));
  ;

  __attribute__((xcl_pipeline_loop)) readA : for (int M = 0, N = 0, O = 0; M < D * E; M++, O++) {
    if (O == E) {
      N++;
      O = 0;
    }
    J[N][O] = A[M];
  }

  __attribute__((xcl_pipeline_loop)) readB : for (int M = 0, N = 0, O = 0; M < G * F; M++, O++) {
    if (O == F) {
      N++;
      O = 0;
    }
    K[N][O] = B[M];
  }
  __attribute__((xcl_pipeline_loop)) systolic1 : for (int P = 0; P < E; P++) {
  systolic2:
    for (int N = 0; N < 16; N++) {
    systolic3:
      for (int O = 0; O < 16; O++) {
        int Q = (P == 0) ? 0 : L[N][O];

        int R = (N < D && P < E) ? J[N][P] : 0;
        int S = (P < G && O < F) ? K[P][O] : 0;
        int T = Q + R * S;

        L[N][O] = T;
      }
    }
  }

  __attribute__((xcl_pipeline_loop)) writeC : for (int M = 0, N = 0, O = 0; M < H * I; M++, O++) {
    if (O == I) {
      N++;
      O = 0;
    }
    C[M] = L[N][O];
  }
}