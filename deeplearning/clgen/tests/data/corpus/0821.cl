__kernel void fn_A(const float A, const float B, const float C, const float D, const unsigned int E, __global unsigned int* F) {
  int G = get_global_id(0);
  int H = get_global_id(0);
  if ((G < E) && (H < E)) {
    int I = 0;
    float J = A + G * C;
    float K = B + H * D;
    float L = 0, M = 0;
    float N = 0, O = 0;

    while ((I < E) && ((N + O) < 4)) {
      L = N - O + J;
      M = 2 * L * M + K;
      N = L * L;
      O = M * M;
      I++;
    }
    F[G * E + H] = I;
  }
}