int fn_A(int A, int B, int C) {
  return ((B)*C) + A;
}

float fn_B(__global uchar4* A, __private int2 B, int C, int D) {
  __private float E = 0;

  for (int F = -D; F <= D; F++) {
    for (int G = -D; G <= D; G++) {
      E += ((float)A[fn_A(B.x + G, B.y + F, C)].x + (float)A[fn_A(B.x + G, B.y + F, C)].y + (float)A[fn_A(B.x + G, B.y + F, C)].z) / 3.0;
    }
  }
  E = E / (float)(2 * D + 1);
  E = E / (float)(2 * D + 1);

  return E;
}

float fn_C(__global uchar4* A, __global uchar4* B, __private int2 C, __private int2 D, int E, int F) {
  __private float G = fn_B(A, C, E, F);
  __private float H = fn_B(B, D, E, F);
  __private float I = 0;
  __private float J = 0, K = 0;

  for (int L = -F; L <= F; L++) {
    for (int M = -F; M <= F; M++) {
      J = (A[fn_A(C.x + M, C.y + L, E)].x + A[fn_A(C.x + M, C.y + L, E)].y + A[fn_A(C.x + M, C.y + L, E)].z) / 3.0;
      K = (B[fn_A(D.x + M, D.y + L, E)].x + B[fn_A(D.x + M, D.y + L, E)].y + B[fn_A(D.x + M, D.y + L, E)].z) / 3.0;

      I += (J - G) * (K - H);
    }
  }
  return I;
}

float fn_D(__global uchar4* A, __global uchar4* B, __private int2 C, __private int2 D, int E, int F) {
  float G = fn_C(A, A, C, C, E, F);
  if (G == 0)
    return -1;
  float H = fn_C(B, B, D, D, E, F);
  if (H == 0)
    return -1;

  return fn_C(A, B, C, D, E, F) / sqrt(G * H);
}

float fn_E(__global uchar4* A, __global uchar4* B, __private int2 C, __private int2 D, int E, int F) {
  __private float G = 0;
  __private float4 H = 0, I = 0;

  for (int J = -F; J <= F; J++) {
    for (int K = -F; K <= F; K++) {
      H.x = A[fn_A(C.x + J, C.y + K, E)].x;
      H.y = A[fn_A(C.x + J, C.y + K, E)].y;
      H.z = A[fn_A(C.x + J, C.y + K, E)].z;

      I.x = 1.0 * B[fn_A(D.x + J, D.y + K, E)].x;
      I.y = 1.0 * B[fn_A(D.x + J, D.y + K, E)].y;
      I.z = 1.0 * B[fn_A(D.x + J, D.y + K, E)].z;

      G += fast_distance(H, I);
    }
  }
  return G;
}

__kernel void fn_F(__global float4* A, __global uchar4* B, __global uchar4* C, __global float4* D, int E, int F, int G) {
  __private int H = get_global_id(0);

  __private float4 I;
  __private float4 J;

  __private int2 K;
  __private int2 L;

  __private float M = 0x1.fffffep127f;
  __private float N;

  __private int O, P, Q = -100;

  K.y = H / G;
  K.x = H - G * K.y;

  if (5 - 1 < K.x && K.x < G - 5 && 5 - 1 < K.y && K.y < F - 5) {
    I.x = K.x;
    I.y = K.y;
    I.z = 1.0;
    I.w = 0.0;

    for (O = 0; O < E; O++) {
      P = 3 * O;
      J.x = dot(A[P], I);
      J.y = dot(A[P + 1], I);
      J.z = dot(A[P + 2], I);

      if (J.z != 0) {
        L.x = (float)J.x / (float)J.z;
        L.y = (float)J.y / (float)J.z;
      } else {
        L = 0;
      }

      if ((5 - 1) < L.x && L.x < (G - 5) && (5 - 1) < L.y && L.y < (F - 5)) {
        N = -fn_D(B, C, K, L, G, 5);
        if (M > N) {
          M = N;
          Q = O;
        }
      }
    }
    D[H].z = -(0.5) * (float)Q / (float)E;
    if (Q == -100) {
      D[H].z = 0;
      B[H].x = 0;
    }
  } else {
    D[H].z = 0;
    B[H].x = 0;
  }
}

__kernel void fn_G(__global int* A, __global float4* B, int C, int D, float E, int F) {
  __private int G = get_global_id(0);

  __private int2 H;

  H.y = G / D;
  H.x = G - D * H.y;

  if (0 < H.x && H.x < D - 1 && 0 < H.y && H.y < C - 1) {
    B[G].z = ((float)A[G] / (float)F) * 0.3;
  }
}