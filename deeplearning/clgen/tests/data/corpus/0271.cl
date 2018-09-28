__kernel __attribute__((reqd_work_group_size((28), ((28) + (2) - 1) / (2), 1))) void fn_A(__global float* A, __constant float* B, __global float* C, const float D) {
  __local float E[(28) * (((28) + (2) - 1) / (2) + (3) - 1)] __attribute__((xcl_array_partition(cyclic, 3, 1)));

  __local float F[(3) * (3)] __attribute__((xcl_array_partition(complete, 1)));

  __attribute__((xcl_pipeline_workitems)) {
    int G = get_local_id(0);
    int H = get_local_id(1);
    int I = get_global_id(1);
    if (G < (3) * (3)) {
      F[G] = B[G];
    }
    E[H * (28) + G] = A[I * (28) + G];

    if (H > (get_local_size(1) - (3))) {
      E[(H + (3) - 1) * (28) + G] = A[(I + (3) - 1) * (28) + G];
    }
  }

  barrier(1);

  float J = 0;

  __attribute__((xcl_pipeline_workitems)) {
    int K = get_local_id(0);
    int L = get_local_id(1);
    int I = get_global_id(1);
    for (int M = 0; M < (3); M++) {
      for (int N = 0; N < (3); N++) {
        J += F[M * (3) + N] * E[(L + M) * (28) + K + N];
      }
    }
    C[I * (28) + K] = J + D;
  }
}