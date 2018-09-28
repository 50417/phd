__kernel void fn_A(const __global float* A, const __global float* B, uint C, uint D, __global float* E, __local float* F) {
  for (uint G = get_group_id(0); G < D; G += get_num_groups(0)) {
    const __global float* H = A + G * C;

    float I = 0;
    for (uint J = get_local_id(0); J < C; J += get_local_size(0))
      I += H[J] * B[J];

    F[get_local_id(0)] = I;

    barrier(1);

    if (get_local_id(0) == 0) {
      float K = 0;
      for (uint L = 0; L < get_local_size(0); ++L)
        K += F[L];
      E[G] = K;
    }

    barrier(1);
  }
}