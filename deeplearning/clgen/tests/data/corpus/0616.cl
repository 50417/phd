__kernel void fn_A(__global float* A, __global float* B) {
  __global float* C;

  __global float* D;

  C = A;

  D = B;

  for (int E = 0; E < 100; E++) {
    C[get_global_id(0)] = C[get_global_id(0)] + 1.0f;
  }

  barrier(2);

  for (int E = 0; E < 100; E++) {
    D[get_global_id(0)] = D[get_global_id(0)] + 1.0f;
  }
}