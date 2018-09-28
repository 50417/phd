kernel void fn_A(global float4* A, global int2* B, global float4* C, global float4* D, global float4* E, global float4* F, global float4* G) {
  int H = get_global_id(0);

  int I = B[H].s0;
  int J = B[H].s1;

  float K = C[H].s0;
  float L = C[H].s1;
  float M = C[H].s2;

  float4 N = D[I];
  float4 O = D[J];

  float4 P = E[I];
  float4 Q = E[J];

  float4 R = N - O;
  float4 S = P - Q;

  float T = distance(N, O);
  if (0 < T) {
    R /= T;
  }

  float U = -(T - M) * K;

  float V = -L * dot(R, S);

  float W = U + V;
  float4 X = R * W;

  F[H] = X;
  G[H] = F[H];
}

kernel void fn_B(global int* A, global int* B, global float4* C, global float4* D, global float4* E, int F) {
  int G = get_global_id(0);
  float4 H = (float4)(0, 0, 0, 0);

  int I = A[G];

  for (int J = 0; J < I; J++) {
    int K = +1;
    int L = B[F * G + J];

    if (L < 0) {
      K = -1;
      L *= -1;
    }
    L -= 1;

    float4 M = C[L];
    H += M * (float)(K);
  }

  D[G] += H;
}