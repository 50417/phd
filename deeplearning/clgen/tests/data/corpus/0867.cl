kernel void fn_A(global float* A, global float* B, local float* C, local float* D) {
  size_t E = get_global_size(0), F = get_local_size(0);

  uint G = get_global_id(0), H = get_global_id(1);

  uint I = get_local_id(0), J = get_local_id(1);

  float K = 0.0f;

  for (uint L = 0; L < E; L += F) {
    C[(I)*F + (J)] = B[(G)*E + (L + J)];
    D[(I)*F + (J)] = B[(L + I) * E + (H)];

    barrier(1);

    for (uint M = 0; M < F; ++M)
      K += C[(I)*F + (M)] * D[(M)*F + (J)];

    barrier(1);
  }

  A[(G)*E + (H)] = K;
}