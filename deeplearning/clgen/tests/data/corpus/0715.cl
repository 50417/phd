struct tree_global {
  volatile int nextNode;
  volatile int activeNodes;
  int depth;
  int pad;
};

struct tree_node {
  float4 containerCenter;
  float4 containerHalf;
  float4 centerOfGravity;
  int entries[4];
  uint childCount[4];
  uint state;
  int depth;
  int parent;
  float mass;
};

void fn_A(__global struct tree_node* A, const uint B);
int fn_B(__global struct tree_node* A, float4 B);
float4 fn_C(int A);
float fn_D(float A);

void fn_A(__global struct tree_node* A, const uint B) {
  for (int C = 0; C < 4; C++) {
    if (atomic_cmpxchg(&A->entries[C], -1, B) == -1) {
      break;
    }
  }
}

int fn_B(__global struct tree_node* A, float4 B) {
  float4 C = B - A->containerCenter;

  if (C.x <= 0 && C.y <= 0)
    return 0;
  else if (C.x <= 0 && C.y >= 0)
    return 1;
  else if (C.x >= 0 && C.y <= 0)
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
__kernel void fn_E(__global size_t* A) {
  *A = sizeof(struct tree_node);
}

__kernel void fn_F(__global uint* A) {
  const uint B = get_global_id(0);

  A[B] = 0;
}

__kernel void fn_G(__global struct tree_node* A) {
  const uint B = get_global_id(0);
  __global struct tree_node* C = A + B;

  C->state = 0;
  C->parent = -1;
  C->depth = -1;
  for (int D = 0; D < 4; D++) {
    C->entries[D] = -1;
  }
  for (int D = 0; D < 4; D++) {
    C->childCount[D] = 0;
  }
}

__kernel void fn_H(__global struct tree_global* A, __global float4* B, __global float4* C, __global float4* D, const uint E, const uint F) {
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

__kernel void fn_I(__global struct tree_global* A, __global struct tree_node* B, __global float4* C, __global float4* D, const uint E) {
  float4 F = (float4)0x1.fffffep127f;
  float4 G = (float4)-0x1.fffffep127f;
  for (uint H = 0; H < E; H++) {
    F = min(C[H], F);
    G = max(D[H], G);
  }

  float I = fmax(fmax(__clc_fabs(F.x), __clc_fabs(G.x)), fmax(__clc_fabs(F.y), __clc_fabs(G.y)));

  B[0].containerCenter = 0.0f;
  B[0].containerHalf = fn_D(I);
  B[0].state = 1;
  B[0].depth = 0;

  A->nextNode = 1;
  A->activeNodes = 1;
}

__kernel void fn_J(__global float4* A, __global struct tree_node* B, __global uint* C, __global uint* D) {
  const uint E = get_global_id(0);
  __global struct tree_node* F = B + C[E];

  if (F->state == 1) {
    float4 G = A[E];
    const uint H = fn_B(F, G);
    D[E] = H;
    atomic_add(&F->childCount[H], 1);
  }
}

__kernel void fn_K(__global struct tree_global* A, __global struct tree_node* B, __global uint* C, __global uint* D, const int E) {
  const uint F = get_global_id(0);
  __global struct tree_node* G = B + F;
  if (G->state == 1) {
    int H = -1;
    for (int I = 0; I < 4; I++) {
      uint J = G->childCount[I];
      if (J == 0)
        continue;

      uint K = atomic_add(&A->nextNode, 1);
      G->entries[I] = K;
      __global struct tree_node* L = B + K;
      L->containerHalf = G->containerHalf / 2.0f;
      L->containerCenter = G->containerCenter + L->containerHalf * fn_C(I);
      L->parent = F;
      L->depth = E;
      A->depth = E;
      if (J <= 4) {
        L->state = 3;
      } else {
        L->state = 1;
        H++;
      }
    }

    G->state = 2;
    atomic_add(&A->activeNodes, H);
  }
}

__kernel void fn_L(__global struct tree_node* A, __global uint* B, __global uint* C) {
  const uint D = get_global_id(0);

  if (A[B[D]].state == 2) {
    uint E = B[D];
    uint F = C[D];
    __global struct tree_node* G = A + E;
    uint H = G->childCount[F];
    uint I = G->entries[F];

    B[D] = I;

    if (H <= 4) {
      fn_A(A + I, D);
    }
  }
}

__kernel void fn_M(__global float4* A, __global float* B, __global struct tree_node* C, const int D) {
  const uint E = get_global_id(0);
  __global struct tree_node* F = C + E;

  if (F->depth == D) {
    if (F->state == 2) {
      float4 G = (float)0;
      float H = (float)0;
      for (uint I = 0; I < 4; I++) {
        int J = F->entries[I];
        if (J < 0)
          continue;
        G += C[J].centerOfGravity;
        H += C[J].mass;
      }
      F->centerOfGravity = G / H;
      F->mass = H;
    } else if (F->state == 3) {
      float4 G = (float)0;
      float H = (float)0;
      for (uint I = 0; I < 4; I++) {
        int K = F->entries[I];
        if (K < 0)
          break;
        G += A[K] * B[K];
        H += B[K];
      }
      F->centerOfGravity = G / H;
      F->mass = H;
    }
  }
}