struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

void fn_A(__global int* A, const uint B);
int fn_B(float4 A);
float4 fn_C(int A);
float fn_D(float A);

void fn_A(__global int* A, const uint B) {
  for (int C = 0; C < 4; C++) {
    if (atomic_cmpxchg(&A[C], -1, B) == -1) {
      break;
    }
  }
}

int fn_B(float4 A) {
  if (A.x <= 0 && A.y <= 0)
    return 0;
  else if (A.x <= 0 && A.y >= 0)
    return 1;
  else if (A.x >= 0 && A.y <= 0)
    return 2;
  else
    return 3;
}

float4 fn_C(int A) {
  switch (A) {
    case 0:
      return (float4)(-1.0f, -1.0f, 0.0f, 0.0f);
    case 1:
      return (float4)(-1.0f, 1.0f, 0.0f, 0.0f);
    case 2:
      return (float4)(1.0f, -1.0f, 0.0f, 0.0f);
    case 3:
    default:
      return (float4)(1.0f, 1.0f, 0.0f, 0.0f);
  }
}
float fn_D(float A) {
  int B;
  float C = frexp(A, &B);

  int D = (int)(1.0f / C);

  D--;
  D |= D >> 1;
  D |= D >> 2;
  D |= D >> 4;
  D |= D >> 8;
  D |= D >> 16;
  D++;

  return (1.0f / D) * __clc_pow(2.0f, B);
}
__kernel void fn_E(__global uint* A) {
  const uint B = get_global_id(0);

  A[B] = 0;
}

__kernel void fn_F(__global int* A, __global uint* B, __global uint* C, __global int* D, __global int* E) {
  const uint F = get_global_id(0);

  C[F] = 0;
  D[F] = -1;
  E[F] = -1;
  for (int G = 0; G < 4; G++) {
    A[F * 4 + G] = -1;
  }
  for (int G = 0; G < 4; G++) {
    B[F * 4 + G] = 0;
  }
}

__kernel void fn_G(__global struct tree_global* A, __global float4* B, __global float4* C, __global float4* D, const uint E, const uint F) {
  const uint G = get_global_id(0);
  const uint H = G * E;
  const uint I = min((G + 1) * E, F);

  float4 J = (float4)0x1.fffffep127f;
  float4 K = (float4)-0x1.fffffep127f;
  for (uint L = H; L < I; L++) {
    float4 M = B[L];
    J = min(M, J);
    K = max(M, K);
  }
  C[G] = J;
  D[G] = K;
}

__kernel void fn_H(__global struct tree_global* A, __global float4* B, __global float4* C, __global uint* D, __global int* E, __global float4* F, __global float4* G, const uint H) {
  float4 I = (float4)0x1.fffffep127f;
  float4 J = (float4)-0x1.fffffep127f;
  for (uint K = 0; K < H; K++) {
    I = min(F[K], I);
    J = max(G[K], J);
  }

  float L = fmax(fmax(__clc_fabs(I.x), __clc_fabs(J.x)), fmax(__clc_fabs(I.y), __clc_fabs(J.y)));

  B[0] = 0.0f;
  C[0] = fn_D(L);
  D[0] = 1;
  E[0] = 0;

  A->nextNode = 1;
  A->activeNodes = 1;
}

__kernel void fn_I(__global float4* A, __global float4* B, __global uint* C, __global uint* D, __global uint* E, __global uint* F) {
  const uint G = get_global_id(0);
  const uint H = E[G];

  if (C[H] == 1) {
    float4 I = A[G] - B[H];
    const uint J = fn_B(I);
    F[G] = J;
    atomic_add(&D[H * 4 + J], 1);
  }
}

__kernel void fn_J(__global struct tree_global* A, __global float4* B, __global float4* C, __global uint* D, __global uint* E, __global int* F, __global int* G, __global int* H, __global uint* I, __global uint* J, const int K) {
  const uint L = get_global_id(0);
  if (D[L] == 1) {
    int M = -1;
    for (int N = 0; N < 4; N++) {
      uint O = E[L * 4 + N];
      if (O == 0)
        continue;

      uint P = atomic_add(&A->nextNode, 1);
      F[L * 4 + N] = P;
      C[P] = C[L] / 2.0f;
      B[P] = B[L] + C[P] * fn_C(N);
      G[P] = L;
      H[P] = K;
      A->depth = K;
      if (O <= 4) {
        D[P] = 3;
      } else {
        D[P] = 1;
        M++;
      }
    }

    D[L] = 2;
    atomic_add(&A->activeNodes, M);
  }
}

__kernel void fn_K(__global uint* A, __global uint* B, __global int* C, __global uint* D, __global uint* E) {
  const uint F = get_global_id(0);

  if (A[D[F]] == 2) {
    uint G = D[F];
    uint H = E[F];
    uint I = B[G * 4 + H];
    uint J = C[G * 4 + H];

    D[F] = J;

    if (I <= 4) {
      fn_A(C + J * 4, F);
    }
  }
}

__kernel void fn_L(__global float4* A, __global float* B, __global uint* C, __global int* D, __global int* E, __global float* F, __global float4* G, const int H) {
  const uint I = get_global_id(0);

  if (E[I] == H) {
    if (C[I] == 2) {
      float4 J = (float)0;
      float K = (float)0;
      for (uint L = 0; L < 4; L++) {
        int M = D[I * 4 + L];
        if (M < 0)
          continue;
        J += G[M];
        K += F[M];
      }
      G[I] = J / K;
      F[I] = K;
    } else if (C[I] == 3) {
      float4 J = (float)0;
      float K = (float)0;
      for (uint L = 0; L < 4; L++) {
        int N = D[I * 4 + L];
        if (N < 0)
          break;
        J += A[N] * B[N];
        K += B[N];
      }
      G[I] = J / K;
      F[I] = K;
    }
  }
}