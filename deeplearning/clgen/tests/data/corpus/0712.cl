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
__kernel void fn_E(__global struct tree_global* A, __global float4* B, __global float* C, __local float4* D, __local float4* E, __global float4* F, __global float4* G, __global float* H, __global float4* I, __global uint* J, __global int* K, __global int* L, __global uint* M, __global int* N, __global uint* O, __global uint* P, const uint Q, const uint R) {
  uint S;

  S = get_global_id(0);
  while (S < Q) {
    O[S] = 0;
    S += get_global_size(0);
  }

  S = get_global_id(0);
  while (S < R) {
    J[S] = 0;
    K[S] = -1;
    for (int T = 0; T < 4; T++) {
      N[S * 4 + T] = -1;
    }
    for (int T = 0; T < 4; T++) {
      M[S * 4 + T] = 0;
    }
    S += get_global_size(0);
  }

  float4 U = (float4)0x1.fffffep127f;
  float4 V = (float4)-0x1.fffffep127f;
  S = get_global_id(0);
  while (S < Q) {
    float4 W = B[S];
    U = min(W, U);
    V = max(W, V);
    S += get_global_size(0);
  }
  D[get_global_id(0)] = U;
  E[get_global_id(0)] = V;

  barrier(1);

  if (get_global_id(0) == 0) {
    U = (float4)0x1.fffffep127f;
    V = (float4)-0x1.fffffep127f;
    for (S = 0; S < get_global_size(0); S++) {
      U = min(D[S], U);
      V = max(E[S], V);
    }
    float X = fmax(fmax(__clc_fabs(U.x), __clc_fabs(V.x)), fmax(__clc_fabs(U.y), __clc_fabs(V.y)));
    F[0] = 0.0f;
    G[0] = fn_D(X);
    J[0] = 1;
    L[0] = 0;
    A->nextNode = 1;
    A->activeNodes = 1;
  }

  barrier(2);

  int Y = 0;

  do {
    Y++;

    S = get_global_id(0);
    while (S < Q) {
      const uint Z = O[S];

      if (J[Z] == 1) {
        float4 AA = B[S] - F[Z];
        const uint T = fn_B(AA);
        P[S] = T;
        atomic_add(&M[Z * 4 + T], 1);
      }
      S += get_global_size(0);
    }

    barrier(2 | 1);

    uint AB = A->nextNode;

    S = get_global_id(0);
    while (S < AB) {
      if (J[S] == 1) {
        int AC = -1;
        for (int T = 0; T < 4; T++) {
          uint AD = M[S * 4 + T];
          if (AD == 0)
            continue;

          uint AE = atomic_add(&A->nextNode, 1);
          N[S * 4 + T] = AE;
          G[AE] = G[S] / 2.0f;
          F[AE] = F[S] + G[AE] * fn_C(T);
          K[AE] = S;
          L[AE] = Y;
          A->depth = Y;
          if (AD <= 4) {
            J[AE] = 3;
          } else {
            J[AE] = 1;
            AC++;
          }
        }

        J[S] = 2;
        atomic_add(&A->activeNodes, AC);
      }
      S += get_global_size(0);
    }

    barrier(2);

    S = get_global_id(0);
    while (S < Q) {
      if (J[O[S]] == 2) {
        uint AF = O[S];
        uint T = P[S];
        uint AD = M[AF * 4 + T];
        uint AG = N[AF * 4 + T];

        O[S] = AG;

        if (AD <= 4) {
          fn_A(N + AG * 4, S);
        }
      }
      S += get_global_size(0);
    }

    barrier(2);

  } while (Y <= A->depth);

  for (int AH = Y; AH >= 0; AH--) {
    S = get_global_id(0);
    while (S < R) {
      if (L[S] == AH) {
        if (J[S] == 2) {
          float4 AI = (float)0;
          float AJ = (float)0;
          for (uint T = 0; T < 4; T++) {
            int AG = N[S * 4 + T];
            if (AG < 0)
              continue;
            AI += I[AG];
            AJ += H[AG];
          }
          I[S] = AI / AJ;
          H[S] = AJ;
        } else if (J[S] == 3) {
          float4 AI = (float)0;
          float AJ = (float)0;
          for (uint T = 0; T < 4; T++) {
            int AK = N[S * 4 + T];
            if (AK < 0)
              break;
            AI += B[AK] * C[AK];
            AJ += C[AK];
          }
          I[S] = AI / AJ;
          H[S] = AJ;
        }
      }
      S += get_global_size(0);
    }

    barrier(2);
  }
}