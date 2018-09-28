__kernel void fn_A(__global int* A, __global int* B, __global int* C) {
  int D = get_global_id(0);

  int E = D;

  while (E < 1024) {
    A[E] = get_local_id(0);
    B[10 + E] = get_local_id(0);
    int F = E + 20;
    C[F] = get_local_id(0);
    E = E + 256;
  }
}