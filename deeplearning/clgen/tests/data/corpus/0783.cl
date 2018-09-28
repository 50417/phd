typedef struct grid_t {
  double dt;
  double dx, dy, dz;
  int ai, aj, ak;
  int ni, nj, nk;
} grid_t;

kernel void fn_A(global double* restrict const A, global double const* restrict const B, global double const* restrict const C, constant grid_t* restrict const D) {
  double const E = D->dt;

  double const F = D->dx;
  double const G = D->dy;
  double const H = D->dz;

  double const I = pown(E, 2);

  double const J = pown(F, -2);
  double const K = pown(G, -2);
  double const L = pown(H, -2);

  size_t const M = D->ai;
  size_t const N = D->aj;
  size_t const O = D->ak;

  size_t const P = D->ni;
  size_t const Q = D->nj;
  size_t const R = D->nk;

  size_t const S = 1;
  size_t const T = S * M;
  size_t const U = T * N;
  size_t const V = get_global_id(0);
  size_t const W = get_global_id(1);
  size_t const X = get_global_id(2);

  if (__builtin_expect(V >= P || W >= Q || X >= R, false))
    return;

  size_t const Y = S * V + T * W + U * X;

  if (__builtin_expect(V == 0 || W == 0 || X == 0 || V == P - 1 || W == Q - 1 || X == R - 1, false)) {
    A[Y] = 0.0;

  } else {
    A[Y] = 2.0 * B[Y] - C[Y] + I * ((B[Y - S] - 2.0 * B[Y] + B[Y + S]) * J + (B[Y - T] - 2.0 * B[Y] + B[Y + T]) * K + (B[Y - U] - 2.0 * B[Y] + B[Y + U]) * L);
  }
}