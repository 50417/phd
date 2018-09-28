__kernel void fn_A(__global float* A, __local float* B, const uint C, const uint D) {
  const uint E = get_local_id(0);
  const uint F = get_global_id(0);

  const float G = (1.0 / (float)C);
  float H = 0.0;

  for (uint I = F * D; I < (F * D) + D; I++) {
    float J = G * ((float)I - 0.5);
    H += 4.0 / (1.0 + J * J);
  }

  B[E] = H;

  barrier(1);

  float K = 0;

  if (E == 0) {
    const uint L = E + get_local_size(0);
    for (uint I = E; I < L; I++) {
      K += B[I];
    }

    A[get_group_id(0)] = K;
  }
}