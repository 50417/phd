__kernel void fn_A(__global float* A, __global float* B, __local float* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);

  C[E] = A[D];

  barrier(1);

  B[D] = (E >= get_local_size(0) - 4) ? 0.f : C[E + 4];
}