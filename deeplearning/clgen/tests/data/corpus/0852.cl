__kernel void fn_A(__global float* A, __global float* B, __global float* C, float D, int E, int F, int G, float H, float I, float J, float K, float L, float M, float N) {
  float O = 80.0;

  int P = get_global_id(0);
  int Q = get_global_id(1);
  int R = P + Q * E;
  int S = E * F;

  int T = (P == 0) ? R : R - 1;
  int U = (P == E - 1) ? R : R + 1;
  int V = (Q == 0) ? R : R - E;
  int W = (Q == F - 1) ? R : R + E;

  float X, Y, Z;
  X = Y = B[R];
  Z = B[R + S];
  C[R] = N * Y + I * B[T] + H * B[U] + K * B[W] + J * B[V] + M * X + L * Z + D * A[R] + L * O;
  R += S;
  T += S;
  U += S;
  V += S;
  W += S;

  for (int AA = 1; AA < G - 1; ++AA) {
    X = Y;
    Y = Z;
    Z = B[R + S];
    C[R] = N * Y + I * B[T] + H * B[U] + K * B[W] + J * B[V] + M * X + L * Z + D * A[R] + L * O;
    R += S;
    T += S;
    U += S;
    V += S;
    W += S;
  }
  X = Y;
  Y = Z;
  C[R] = N * Y + I * B[T] + H * B[U] + K * B[W] + J * B[V] + M * X + L * Z + D * A[R] + L * O;
  return;
}