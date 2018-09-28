__kernel void fn_A(__global int* A, const int B, const int C, const int D) {
  int E = get_local_id(1) + (get_group_id(1) * get_local_size(1));
  int F = get_local_id(0) + (get_group_id(0) * get_local_size(0));

  if (E >= D || F >= C)
    return;
  {
    int G = 0;
    float H = 0.f;
    float I = 0.f;

    float J = 0.f;
    float K = 0.f;
    float L = 4.f * F / C - 2.f;
    float M = 4.f * E / D - 2.f;

    float N = H * H + I * I;

    while (G < B && N <= 4.f) {
      G++;
      J = H * H - I * I + L;
      K = 2.f * H * I + M;
      H = J;
      I = K;
      N = H * H + I * I;
    }

    A[E * D + F] = G;
  }
}