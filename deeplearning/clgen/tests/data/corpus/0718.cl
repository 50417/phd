__kernel void fn_A(int A, int B, int C, __global const float* D, __global const float* E, __global float* F, float G) {
  const int H = get_local_id(0);
  const int I = get_local_id(1);
  const int J = get_group_id(0);

  const int K = 64;
  const int L = 4;
  const int M = 64 * I + H;
  const int N = 256 * J + (64 * I + H);
  const int O = 256 * J + (64 * I + H) + A;
  if (256 * J + (64 * I + H) + A < C) {
    float P = 0.0;
    float Q = 0.0;
    float R = 0.0;
    const float S = D[3 * (256 * J + (64 * I + H) + A)];
    const float T = D[3 * (256 * J + (64 * I + H) + A) + 1];
    const float U = D[3 * (256 * J + (64 * I + H) + A) + 2];
    for (int V = 0; V < C; V++) {
      const float W = D[3 * V] - S;
      const float X = D[3 * V + 1] - T;
      const float Y = D[3 * V + 2] - U;
      const float Z = (D[3 * V] - S) * (D[3 * V] - S) + (D[3 * V + 1] - T) * (D[3 * V + 1] - T) + (D[3 * V + 2] - U) * (D[3 * V + 2] - U) + G;
      const float AA = E[V] / (((D[3 * V] - S) * (D[3 * V] - S) + (D[3 * V + 1] - T) * (D[3 * V + 1] - T) + (D[3 * V + 2] - U) * (D[3 * V + 2] - U) + G) * sqrt((D[3 * V] - S) * (D[3 * V] - S) + (D[3 * V + 1] - T) * (D[3 * V + 1] - T) + (D[3 * V + 2] - U) * (D[3 * V + 2] - U) + G));
      P = P + (D[3 * V] - S) * AA;
      Q = Q + (D[3 * V + 1] - T) * AA;
      R = R + (D[3 * V + 2] - U) * AA;
    }
    F[3 * (256 * J + (64 * I + H))] = P;
    F[3 * (256 * J + (64 * I + H)) + 1] = Q;
    F[3 * (256 * J + (64 * I + H)) + 2] = R;
  }
}