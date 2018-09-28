typedef unsigned long uint64_t; __kernel void fn_A(__global void* A, __global void* B, uint64_t C, __global double* D, uint64_t E) {
  D[E * C + E] = sqrt(D[E * C + E]);
}

__kernel void fn_B(__global void* A, __global void* B, uint64_t C, __global double* D, uint64_t E) {
  int F = get_global_id(0);

  if (F > E && F < C) {
    double G = D[E * C + E];
    D[F * C + E] = D[F * C + E] / G;

    D[E * C + F] = 0;
  }
}

__kernel void fn_C(__global void* A, __global void* B, uint64_t C, __global double* D, uint64_t E) {
  int F = get_global_id(0);
  int G = get_global_id(1);

  if (F <= E || G <= E)
    return;
  if (F >= C || G > F)
    return;

  double H = D[F * C + E];
  double I = D[G * C + E];
  double J = D[F * C + G];

  D[F * C + G] = J - H * I;
}