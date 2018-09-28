__kernel void fn_A(__local float* A, __local float* B) {
  __local float* C;

  __local float* D;

  C = A;

  D = B;

  for (int E = 0; E < 100; E++) {
    C[get_local_id(0)] = C[get_local_id(0)] + 1.0f;
  }

  barrier(1);

  for (int E = 0; E < 100; E++) {
    D[get_local_id(0)] = D[get_local_id(0)] + 1.0f;
  }
}