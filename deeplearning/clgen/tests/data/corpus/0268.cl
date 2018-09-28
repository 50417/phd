__kernel void fn_A(const __global float* restrict A, const __global float* restrict B, const __global float* restrict C, __global float* restrict D, const unsigned int E, const unsigned int F, const unsigned int G) {
  const int H = get_global_id(0);
  const int I = get_global_id(1);
  const int J = get_global_id(2);

  const int K = get_global_size(0);
  const int L = get_global_size(1);
  const int M = K + E - 1;
  const int N = L + E - 1;

  int O = H * F;
  int P = I * F;
  int Q = O + E;
  int R = P + E;

  const int S = J * E * E * G;
  int T = (int)E;
  float U, V;
  float4 W = 0.0;
  float X = 0.0;
  float Y = 0.0;
  for (unsigned int Z = 0; Z < G; Z++) {
    for (unsigned int AA = 0; AA < E; AA++) {
      const int AB = S + Z * E * E + AA * E;
      const int AC = ((Z * N) + P + AA) * M + O;
      int AD = 0;
      int AE = 0;

      while (AD <= T - 4) {
        float4 AF = vload4(AE, B + AB);
        float4 AG = vload4(AE, A + AC);
        W += AF * AG;
        AD += 4;
        AE++;
      }

      for (int AH = AD; AH < E; AH++) {
        W.x += B[AB + AH] * A[AC + AH];
      }
    }
  }
  Y = W.x + W.y + W.z + W.w + C[J];
  D[((J * L) + I) * K + H] = fmax(X, Y);
}
__kernel void fn_B(const __global float* restrict A, __global float* restrict B, const int C, const int D, const int E, const int F) {
  const int G = get_global_id(0);
  const int H = get_global_id(1);
  const int I = get_global_id(2);

  const int J = get_global_size(0);
  const int K = get_global_size(1);

  float L = -3.402823e+37;
  int M = H * F;
  int N = G * F;
  int O = M + E;
  int P = N + E;
  for (unsigned int Q = M; Q < O; Q++) {
    for (unsigned int R = N; R < P; R++) {
      unsigned int S = I * D * C + Q * C + R;
      L = fmax(L, A[S]);
    }
  }
  B[(((I * K) + H) * J) + G] = L;
}

__kernel void fn_C(const __global float* restrict A, const __global float* restrict B, __global float* restrict C, const int D, const __global float* restrict E, const unsigned char F) {
  const int G = get_global_id(0);
  const int H = G * D;
  float I = 0;
  float J = 0;
  for (int K = 0; K < D; K++) {
    I += B[H + K] * A[K];
  }
  I += E[G];
  if (F == 1) {
    C[G] = fmax(J, I);
  } else {
    C[G] = I;
  }
}

__attribute__((max_work_group_size(1000))) __kernel void fn_D(__global float* A) {
  const int B = get_global_id(0);
  A[B] = exp(A[B]);
}

__kernel void fn_E(__global float* restrict A,

                   __global float* restrict B, __global float* restrict C, __global float* restrict D) {
  const int E = get_global_id(2);
  const int F = get_global_id(1);
  const int G = get_global_id(0);
  const int H = get_global_size(0);
  const int I = get_global_size(1);
  float J;
  const int K = E * H * I + F * H + G;
  J = A[K] * B[E] + C[E];
  D[K] = J;
}