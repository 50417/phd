__kernel void fn_A(__global float4* A, __global float4* B, __global float4* C, __global float4* D, int E, int F, float G, float H) {
  unsigned int I = get_global_id(0);
  int J;
  float K;

  D[I].xyz = C[I].xyz;
  C[I] = A[I];

  for (int L = 0; L < E; L++) {
    J = I + (L + 1) * F;

    K = D[J].w - G / E;
    if (K <= 0) {
      A[J] = C[I];
      B[J] = B[I];
      K = E * G;
    }
    A[J].z += H;

    A[J].w = 1.;
    D[J].w = K;
  }
}