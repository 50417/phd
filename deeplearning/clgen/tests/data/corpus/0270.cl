__kernel void fn_A(const __global float* A, const __global float* B, __global float* C, const int D, const int E, const int F, const __global float* G) {
  const int H = get_global_id(0);
  const int I = get_global_id(1);
  const int J = get_global_id(2);

  const int K = get_global_size(0);
  const int L = get_global_size(1);
  const int M = K + D - 1;
  const int N = L + E - 1;
  float4 O = 0;
  int P = J * E * D * F;

  for (int Q = 0; Q < F; Q++) {
    for (int R = 0; R < E; R++) {
      const int S = P + (Q * E + R) * D;
      const int T = (((Q * N) + I + R) * M) + H;
      int U = 0;
      int V = 0;
      while (U <= D - 4) {
        float4 W = vload4(V, B + S);
        float4 X = vload4(V, A + T);
        O += X * W;
        U += 4;
        V++;
      }
      for (int Y = U; Y < D; Y++) {
        const int Z = S + Y;
        const int AA = T + Y;
        O.x += B[Z] * A[AA];
      }
    }
  }
  C[((J * L * K) + (I * K) + H)] = O.x + O.y + O.z + O.w + G[J];
}

__kernel void fn_B(const __global float* A, __global float* B, const int C, const int D, const int E, const int F) {
  const int G = get_global_id(0);
  const int H = get_global_id(1);
  const int I = get_global_id(2);

  const int J = get_global_size(0);
  const int K = get_global_size(1);

  float L = 0.0;
  int M = H * F;
  int N = G * F;
  int O = min(M + E, D);
  int P = min(N + E, C);
  for (unsigned int Q = M; Q < O; Q++) {
    for (unsigned int R = N; R < P; R++) {
      unsigned int S = I * D * C + Q * C + R;
      L = fmax(L, A[S]);
    }
  }
  B[(((I * K) + H) * J) + G] = L;
}

__kernel void fn_C(const __global float* A, const __global float* B, __global float* C, const int D, const __global float* E) {
  const int F = get_global_id(0);
  const int G = F * D;
  float H = 0;
  for (int I = 0; I < D; I++) {
    H += B[G + I] * A[I];
  }
  C[F] = H + E[F];
}

__kernel void fn_D(__global float* A) {
  const int B = get_global_id(0);
  float C = 0.0;
  A[B] = fmax(C, A[B]);
}

__kernel void fn_E(__global float* A) {
  __local float B, C[10];
  const int D = get_local_id(0);
  C[D] = exp(A[D]);

  barrier(1);
  if (get_local_id(0) == 0) {
    for (int E = 0; E < get_local_size(0); E++)
      B += C[E];
  }
  barrier(1);

  A[D] = C[D] / B;
}