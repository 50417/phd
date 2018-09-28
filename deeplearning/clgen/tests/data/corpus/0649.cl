__kernel void fn_A(__global float* A, __global float* B, unsigned C) {
  __local float D[1024];

  D[get_local_id(0)] = A[get_local_id(0)];
  for (int E = get_local_id(0) + 1024; E < C; E += 1024) {
    D[E] += A[E];
  }

  for (int F = 1024 / 2; F > 0; F >>= 1) {
    if (get_local_id(0) < F) {
      D[get_local_id(0)] += D[get_local_id(0) + F];
    }
  }

  if (get_local_id(0) == 0) {
    *B = D[0];
  }
}