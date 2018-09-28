typedef float real_t; __kernel void fn_A(__global real_t* A, __global real_t* B, size_t C, size_t D, size_t E, __constant real_t* F, size_t G, size_t H, __local real_t* I, size_t J, size_t K) {
  const size_t L = H;
  const size_t M = (H / 2);

  const size_t N = K;
  const size_t O = J;

  const size_t P = get_local_size(1);
  const size_t Q = get_local_size(0);

  size_t R = get_group_id(0) * O + get_local_id(0);
  size_t S = get_group_id(1) * N + get_local_id(1);

  int T = R - M;
  int U = S - M * E;

  if (T >= 0 && T < C && U >= 0 && U < D) {
    I[get_local_id(0) * P + get_local_id(1)] = B[T * D + U];
  } else {
    I[get_local_id(0) * P + get_local_id(1)] = 0.0;
  }

  barrier(1);
  real_t V = 0.0;
  if (get_local_id(0) < O && get_local_id(1) < N) {
    for (size_t W = 0U; W < L; ++W) {
      for (size_t X = 0U; X < L; ++X) {
        size_t Y = get_local_id(1) + X * E;
        V += F[W * L + X] * I[(get_local_id(0) + W) * P + Y];
      }
    }
  }

  if (R < C && S < D) {
    A[R * D + S] = V;
  }
}