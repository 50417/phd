float fn_A(float A) {
  int B = (int)(A);
  if (A - B < .5f)
    return B;
  else
    return B++;
}
float fn_B(__global unsigned char* A, __global int* B, int C, int D) {
  float E = 0.0;
  int F;
  for (F = 0; F < C; F++)
    E += (__clc_pow((float)(A[B[D * C + F]] - 100), 2) - __clc_pow((float)(A[B[D * C + F]] - 228), 2)) / 50.0;
  return E;
}

void fn_C(__global float* A, __global float* B, int C) {
  int D;
  A[0] = B[0];
  for (D = 1; D < C; D++) {
    A[D] = B[D] + A[D - 1];
  }
}

float fn_D(__global int* A, int B) {
  int C = 2147483647;
  int D = 1103515245;
  int E = 12345;
  int F = D * A[B] + E;
  A[B] = F % C;
  return __clc_fabs(A[B] / ((float)C));
}
float fn_E(__global int* A, int B) {
  float C = 3.14159265358979323846;
  float D = fn_D(A, B);
  float E = fn_D(A, B);
  float F = cos(2 * C * E);
  float G = -2 * log(D);
  return sqrt(G) * F;
}
float fn_F(__global float* A, __global float* B, int C) {
  int D;
  float E = 0;
  for (D = 0; D < C; D++) {
    A[D] = A[D] * exp(B[D]);
    E += A[D];
  }
  return E;
}

int fn_G(__global float* A, int B, int C, float D) {
  if (C < B)
    return -1;
  int E;
  while (C > B) {
    E = B + ((C - B) / 2);
    if (A[E] >= D) {
      if (E == 0)
        return E;
      else if (A[E - 1] < D)
        return E;
      else if (A[E - 1] == D) {
        while (A[E] == D && E >= 0)
          E--;
        E++;
        return E;
      }
    }
    if (A[E] > D)
      C = E - 1;
    else
      B = E + 1;
  }
  return -1;
}

float fn_H(__read_only image2d_t A, int B) {
  const sampler_t C = 0x0000 | 0x0004 | 0x0000;

  if (B < 0)
    return 0;

  int D = B >> 2;

  int2 E;
  E.x = D >> 13;
  E.y = D & 0x1fff;
  float4 F = read_imagef(A, C, E);

  D = B & 0x0003;

  if (D < 2) {
    if (D == 0)
      return F.x;
    else
      return F.y;
  } else {
    if (D == 2)
      return F.z;
    else
      return F.w;
  }
}
__kernel void fn_I(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __global float* F, __global float* G, int H) {
  int I = get_global_id(0);

  if (I < H) {
    int J = -1;
    int K;

    for (K = 0; K < H; K++) {
      if (C[K] >= D[I]) {
        J = K;
        break;
      }
    }
    if (J == -1) {
      J = H - 1;
    }

    E[I] = A[J];
    F[I] = B[J];
  }
  barrier(2);
}
__kernel void fn_J(__global float* A, int B, __global float* C, __global float* D, __global float* E, __global int* F) {
  int G = get_global_id(0);
  int H = get_local_id(0);
  __local float I;
  __local float J;

  if (0 == H)
    J = C[0];

  barrier(1);

  if (G < B) {
    A[G] = A[G] / J;
  }

  barrier(2);

  if (G == 0) {
    fn_C(D, A, B);
    E[0] = (1 / ((float)(B))) * fn_D(F, G);
  }

  barrier(2);

  if (0 == H)
    I = E[0];

  barrier(1);

  if (G < B) {
    E[G] = I + G / ((float)(B));
  }
}

__kernel void fn_K(__global float* A, int B) {
  int C = get_global_id(0);
  size_t D = get_local_size(0);

  if (C == 0) {
    int E;
    float F = 0;
    int G = __clc_ceil((float)B / (float)D);
    for (E = 0; E < G; E++) {
      F += A[E];
    }
    A[0] = F;
  }
}
__kernel void fn_L(__global float* A, __global float* B, __global float* C, __global float* D, __global float* E, __global int* F, __global int* G, __global float* H, __global unsigned char* I, __global float* J, __global float* K, const int L, const int M, const int N, int O, const int P, const int Q, __global int* R, __global float* S, __local float* T) {
  int U = get_group_id(0);
  int V = get_local_id(0);
  int W = get_global_id(0);
  size_t X = get_local_size(0);
  int Y;
  int Z, AA;

  if (W < L) {
    A[W] = C[W];
    B[W] = D[W];

    K[W] = 1 / ((float)(L));

    A[W] = A[W] + 1.0 + 5.0 * fn_E(R, W);
    B[W] = B[W] - 2.0 + 2.0 * fn_E(R, W);
  }

  barrier(2);

  if (W < L) {
    for (Y = 0; Y < M; Y++) {
      Z = fn_A(A[W]) + G[Y * 2 + 1];
      AA = fn_A(B[W]) + G[Y * 2];

      F[W * M + Y] = abs(Z * P * Q + AA * Q + O);
      if (F[W * M + Y] >= N)
        F[W * M + Y] = 0;
    }
    H[W] = fn_B(I, F, M, W);

    H[W] = H[W] / M - 300;

    K[W] = K[W] * exp(H[W]);
  }

  T[V] = 0.0;

  barrier(1 | 2);

  if (W < L) {
    T[V] = K[W];
  }

  barrier(1);

  for (unsigned int AB = X / 2; AB > 0; AB >>= 1) {
    if (V < AB) {
      T[V] += T[V + AB];
    }
    barrier(1);
  }
  if (V == 0) {
    S[U] = T[0];
  }
}