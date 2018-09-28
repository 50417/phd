__kernel void fn_A(const int A, const int B, const int C, const __global float* D, const __global float* E, __global float* F, __local float* G) {
  int H = get_global_id(0);
  int I = get_local_id(0);
  int J = get_local_size(0);
  int K = H * C;
  int L = B >> 2;

  for (int M = 0; M < C; M++) {
    int N = M * B;
    for (int O = I; (((O & 3) == 0) && O < B); O += J) {
      *((__local float4*)&G[O]) = *((__global float4*)&E[O + N]);
    }

    barrier(1);

    int P = B * H;
    int Q = 0;
    float R = 0.0f;
    for (int S = 0; S < L; S++) {
      float4 T = (*((__global float4*)&D[P]));
      float4 U = (*((__local float4*)&G[Q]));
      R += dot(T, U);
      Q += 4;
      P += 4;
    }
    F[K + M] = R;

    barrier(1);
  }
}