__kernel void fn_A(__global float* A, __global float* B, __local float* C) {
  int D = get_global_id(0);
  int E = get_local_id(0);

  C[E] = A[D];

  barrier(1);

  for (unsigned F = 0; F < 10; ++F) {
    C[E] += 1.f;

    barrier(1);

    if (E != 0)
      C[E] += C[E - 1];

    barrier(1);
  }
  B[D] = C[E];
}