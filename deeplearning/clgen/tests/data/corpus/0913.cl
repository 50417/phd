__kernel void fn_A(__global float* A, __global float* B) {
  float C = 0.0;
  if (get_global_id(0) == 0) {
    for (int D = 0; D < 1048576; D++) {
      C += A[D];
    }
  }
  *B = C;
}

__kernel void fn_B(__global float* A, __local float* B, __global float* C) {
  int D = get_local_id(0);
  int E = get_local_size(0);

  B[D] = A[get_global_id(0)];
  barrier(1);

  for (int F = E / 2; F > 0; F >>= 1) {
    if (D < F) {
      B[D] += B[D + F];
    }
    barrier(1);
  }

  if (D == 0) {
    C[get_group_id(0)] = B[0];
  }
}

__kernel void fn_C(__global float4* A, __local float4* B, __global float* C) {
  int D = get_local_id(0);
  int E = get_local_size(0);

  B[D] = A[get_global_id(0)];
  barrier(1);

  for (int F = E / 2; F > 0; F >>= 1) {
    if (D < F) {
      B[D] += B[D + F];
    }
    barrier(1);
  }

  if (D == 0) {
    C[get_group_id(0)] = dot(B[0], (float4)(1.0f));
  }
}