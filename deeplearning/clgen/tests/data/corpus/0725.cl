__kernel void fn_A(__global uint4* A, __global uchar4* B, uint C) {
  int D = get_global_id(0);
  int E = get_global_id(1);
  int F = get_global_size(0);
  int G = get_global_size(1);
  int H = (C - 1) / 2;

  if (D < H || E < H || D > F - H - 1 || E > G - H - 1) {
    B[D + E * F] = (uchar4)(0);
    return;
  }

  int4 I = (int4)(C * C);

  int2 J = (int2)(D - H, E - H);
  int2 K = (int2)(D + H, E - H);
  int2 L = (int2)(D + H, E + H);
  int2 M = (int2)(D - H, E + H);

  int4 N = (int4)(0);
  int4 O = (int4)(0);
  int4 P = (int4)(0);
  int4 Q = (int4)(0);

  J.x -= 1;
  J.y -= 1;
  K.y -= 1;
  M.x -= 1;

  if (J.x >= 0 && J.y >= 0) {
    N = convert_int4(A[J.x + J.y * F]);
  }
  if (K.x >= 0 && K.y >= 0) {
    O = convert_int4(A[K.x + K.y * F]);
  }
  if (M.x >= 0 && M.y >= 0) {
    Q = convert_int4(A[M.x + M.y * F]);
  }
  P = convert_int4(A[L.x + L.y * F]);

  B[D + E * F] = convert_uchar4((N + P - O - Q) / I);
}

__kernel void fn_B(__global uchar4* A, __global uint4* B, int C, int D, int E) {
  int F = get_global_id(0);
  int G = get_global_id(1);
  int H = F + G * E;

  int I = __clc_pow((float)D, (float)C);

  uint4 J = 0;

  for (int K = 0; K < D; K++) {
    if ((F - (K * I)) < 0) {
      B[H] = J;
      return;
    }

    J += convert_uint4(A[H - (K * I)]);
  }

  B[H] = J;
}

__kernel void fn_C(__global uint4* A, __global uint4* B, int C, int D, int E) {
  int F = get_global_id(0);
  int G = get_global_id(1);
  int H = F + G * E;

  int I = __clc_pow((float)D, (float)C);

  uint4 J = 0;

  for (int K = 0; K < D; K++) {
    if (F - (K * I) < 0) {
      B[H] = J;
      return;
    }
    J += A[H - (K * I)];
  }

  B[H] = J;
}

__kernel void fn_D(__global uint4* A, __global uint4* B, int C, int D, int E) {
  int F = get_global_id(0);
  int G = get_global_id(1);

  int H = __clc_pow((float)D, (float)C);

  uint4 I = (uint4)(0);

  for (int J = 0; J < D; J++) {
    if (G - (J * H) < 0) {
      B[F + G * E] = I;
      return;
    }

    I += A[F + E * (G - (J * H))];
  }

  B[F + G * E] = I;
}

__kernel void fn_E(__global uchar4* A, __global uchar4* B, int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  int H = D + E * F;
  int I = (C - 1) / 2;

  if (D < I || D >= (F - I)) {
    B[H] = (uchar4)(0);
    return;
  }

  int4 J = (int4)(C);

  int4 K = 0;

  for (int L = -I; L < I; L = L + 2) {
    K += convert_int4(A[H + L]);
    K += convert_int4(A[H + L + 1]);
  }
  K += convert_int4(A[H + I]);
  B[H] = convert_uchar4(K / J);
}

__kernel void fn_F(__global uchar4* A, __global uchar4* B, int C) {
  int D = get_global_id(0);
  int E = get_global_id(1);

  int F = get_global_size(0);
  int G = get_global_size(1);

  int H = D + E * F;
  int I = (C - 1) / 2;

  if (E < I || E >= (G - I)) {
    B[H] = (uchar4)(0);
    return;
  }

  int4 J = (int4)(C);

  int4 K = 0;

  for (int L = -I; L < I; L = L + 2) {
    K += convert_int4(A[H + L * F]);
    K += convert_int4(A[H + (L + 1) * F]);
  }
  K += convert_int4(A[H + I * F]);
  B[H] = convert_uchar4(K / J);
}

__kernel void fn_G(__global uchar4* A, __global uchar4* B, int C, __local uchar4* D) {
  int E = get_global_id(0);
  int F = get_global_id(1);

  int G = get_global_size(0);
  int H = get_global_size(1);

  int I = E + F * G;
  int J = (C - 1) / 2;

  int K = get_local_id(0);
  int L = get_group_id(0);
  int M = get_group_id(1);

  int N = get_local_size(0);
  int O = get_local_size(1);

  int P = N * L + G * M * O;

  if (K < J) {
    D[K] = A[P - J + K];
    D[256 + J + K] = A[P + K + 256];
  }

  D[K + J] = A[P + K];

  barrier(1);

  if (E < J || E >= (G - J))
    return;

  int4 Q = (int4)(C);

  int4 R = 0;

  for (int S = -J; S <= J; S++) {
    R += convert_int4(D[K + S + J]);
  }
  B[I] = convert_uchar4(R / Q);
}