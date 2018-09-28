typedef struct {
  union {
    float4 m_min;
    float m_minElems[4];
    int m_minIndices[4];
  };
  union {
    float4 m_max;
    float m_maxElems[4];
    int m_maxIndices[4];
  };
} btAabbCL;

bool fn_A(const btAabbCL* A, __local const btAabbCL* B);
bool fn_A(const btAabbCL* A, __local const btAabbCL* B) {
  bool C = true;
  C = (A->m_min.x > B->m_max.x || A->m_max.x < B->m_min.x) ? false : C;
  C = (A->m_min.z > B->m_max.z || A->m_max.z < B->m_min.z) ? false : C;
  C = (A->m_min.y > B->m_max.y || A->m_max.y < B->m_min.y) ? false : C;
  return C;
}
bool fn_B(__global const btAabbCL* A, __global const btAabbCL* B);
bool fn_B(__global const btAabbCL* A, __global const btAabbCL* B) {
  bool C = true;
  C = (A->m_min.x > B->m_max.x || A->m_max.x < B->m_min.x) ? false : C;
  C = (A->m_min.z > B->m_max.z || A->m_max.z < B->m_min.z) ? false : C;
  C = (A->m_min.y > B->m_max.y || A->m_max.y < B->m_min.y) ? false : C;
  return C;
}

bool fn_C(const btAabbCL* A, __global const btAabbCL* B);
bool fn_C(const btAabbCL* A, __global const btAabbCL* B) {
  bool C = true;
  C = (A->m_min.x > B->m_max.x || A->m_max.x < B->m_min.x) ? false : C;
  C = (A->m_min.z > B->m_max.z || A->m_max.z < B->m_min.z) ? false : C;
  C = (A->m_min.y > B->m_max.y || A->m_max.y < B->m_min.y) ? false : C;
  return C;
}

__kernel void fn_D(__global const btAabbCL* A, __global const btAabbCL* B, volatile __global int2* C, volatile __global int* D, int E, int F, int G, int H) {
  int I = get_global_id(0);
  if (I >= E)
    return;

  int J = get_global_id(1);
  if (J >= F)
    return;

  if (fn_B(&A[I], &B[J])) {
    int2 K;

    K.x = A[I].m_minIndices[3];
    K.y = B[J].m_minIndices[3];

    int L = atomic_add(D, 1);
    if (L < H) {
      C[L] = K;
    }
  }
}

__kernel void fn_E(__global const btAabbCL* A, volatile __global int2* B, volatile __global int* C, int D, int E, int F) {
  int G = get_global_id(0);
  if (G >= D)
    return;
  for (int H = G + 1; H < D; H++) {
    if (A[G].m_maxElems[E] < (A[H].m_minElems[E])) {
      break;
    }
    if (fn_B(&A[G], &A[H])) {
      int2 I;
      I.x = A[G].m_minIndices[3];
      I.y = A[H].m_minIndices[3];
      int J = atomic_add(C, 1);
      if (J < F) {
        B[J] = I;
      }
    }
  }
}

__kernel void fn_F(__global const btAabbCL* A, volatile __global int2* B, volatile __global int* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);

  __local int I[1];
  __local int J[1];

  if (H == 0) {
    I[0] = 0;
    J[0] = 0;
  }
  barrier(1);
  atomic_add(I, 1);
  barrier(1);
  int K = 0;

  int L = G + 1;
  do {
    barrier(1);

    if (L < D) {
      if (A[G].m_maxElems[E] < (A[L].m_minElems[E])) {
        if (!K) {
          atomic_add(J, 1);
          K = 1;
        }
      }
    }

    barrier(1);

    if (L >= D && !K) {
      atomic_add(J, 1);
      K = 1;
    }
    barrier(1);

    if (!K) {
      if (fn_B(&A[G], &A[L])) {
        int2 M;
        M.x = A[G].m_minIndices[3];
        M.y = A[L].m_minIndices[3];
        int N = atomic_add(C, 1);
        if (N < F) {
          B[N] = M;
        }
      }
    }
    L++;

  } while (J[0] < I[0]);
}

__kernel void fn_G(__global const btAabbCL* A, volatile __global int2* B, volatile __global int* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);

  __local int I[1];
  __local int J[1];
  __local btAabbCL K[128];

  btAabbCL L;

  L = (G < D) ? A[G] : A[0];
  float M = L.m_maxElems[E];

  if (H == 0) {
    I[0] = 0;
    J[0] = 0;
  }
  int N = 0;
  int O = 0;
  K[H] = (G + O) < D ? A[G + O] : A[0];
  K[H + 64] = (G + O + 64) < D ? A[G + O + 64] : A[0];

  barrier(1);
  atomic_add(I, 1);
  barrier(1);
  int P = 0;

  int Q = G + 1;
  do {
    barrier(1);

    if (Q < D) {
      if (M < (K[N + H + 1].m_minElems[E])) {
        if (!P) {
          atomic_add(J, 1);
          P = 1;
        }
      }
    }

    barrier(1);

    if (Q >= D && !P) {
      atomic_add(J, 1);
      P = 1;
    }
    barrier(1);

    if (!P) {
      if (fn_A(&L, &K[N + H + 1])) {
        int2 R;
        R.x = L.m_minIndices[3];
        R.y = K[N + H + 1].m_minIndices[3];
        int S = atomic_add(C, 1);
        if (S < F) {
          B[S] = R;
        }
      }
    }

    barrier(1);

    N++;
    if (N == 64) {
      N = 0;
      O += 64;
      K[H] = ((G + O) < D) ? A[G + O] : A[0];
      K[H + 64] = ((G + 64 + O) < D) ? A[G + O + 64] : A[0];
    }
    Q++;

  } while (J[0] < I[0]);
}

unsigned int fn_H(float A);
unsigned int fn_H(float A) {
  unsigned int B = *(unsigned int*)&A;
  unsigned int C = -(int)(B >> 31) | 0x80000000;
  return B ^ C;
}
float fn_I(unsigned int A);
float fn_I(unsigned int A) {
  unsigned int B = ((A >> 31) - 1) | 0x80000000;
  unsigned int C = A ^ B;
  return *(float*)&C;
}

__kernel void fn_J(__global const btAabbCL* A, __global btAabbCL* B, int C) {
  int D = get_global_id(0);
  if (D >= C)
    return;
  int E = B[D].m_maxIndices[3];
  B[D] = A[E];
  B[D].m_maxIndices[3] = E;
}

__kernel void fn_K(__global const btAabbCL* A, volatile __global int2* B, int C, int D) {
  int E = get_global_id(0);
  if (E >= C)
    return;

  B[E].x = fn_H(A[E].m_minElems[D]);
  B[E].y = E;
}

__kernel void fn_L(__global const btAabbCL* A, volatile __global const int2* B, __global btAabbCL* C, int D) {
  int E = get_global_id(0);
  if (E >= D)
    return;

  C[E] = A[B[E].y];
}