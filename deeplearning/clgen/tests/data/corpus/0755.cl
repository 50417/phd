__kernel void fn_A(const global float4* A, const int B, global float4* C, constant float* D, const int E, const int F) {
  int G = get_global_id(0);
  int H = get_global_id(1);
  int I = G + H * get_global_size(0);

  int J = E / 2;
  int K = G + (H + F) * B;

  float4 L = 0.0f;

  for (int M = -J; M <= J; M++) {
    L += A[K + M * B] * D[M + J];
  }

  C[I] = L;
}

__kernel void fn_B(const global float4* A, const int B, global float4* C, constant float* D, const int E, const int F) {
  int G = get_global_id(0);
  int H = get_global_id(1);
  int I = G + H * get_global_size(0);

  int J = E / 2;
  int K = H * B + (G + F);

  float4 L = 0.0f;

  for (int M = -J; M <= J; M++) {
    L += A[K + M] * D[M + J];
  }

  C[I] = L;
}