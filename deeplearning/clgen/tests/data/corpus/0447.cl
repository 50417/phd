__kernel void fn_A(__global float4* A, __global float4* B, __global float4* C, uint D, uint E) {
  int2 F = (int2)(get_global_id(0), get_global_id(1));

  float4 G = (float4)(0);
  float4 H = (float4)(0);
  float4 I = (float4)(0);
  float4 J = (float4)(0);

  E /= 4;

  for (int K = 0; K < D; K = K + 4) {
    float4 L = A[K / 4 + (F.y << 2) * (D / 4)];
    float4 M = A[K / 4 + ((F.y << 2) + 1) * (D / 4)];
    float4 N = A[K / 4 + ((F.y << 2) + 2) * (D / 4)];
    float4 O = A[K / 4 + ((F.y << 2) + 3) * (D / 4)];

    float4 P = B[F.x + K * E];
    float4 Q = B[F.x + (K + 1) * E];
    float4 R = B[F.x + (K + 2) * E];
    float4 S = B[F.x + (K + 3) * E];

    G.x += L.x * P.x + L.y * Q.x + L.z * R.x + L.w * S.x;
    G.y += L.x * P.y + L.y * Q.y + L.z * R.y + L.w * S.y;
    G.z += L.x * P.z + L.y * Q.z + L.z * R.z + L.w * S.z;
    G.w += L.x * P.w + L.y * Q.w + L.z * R.w + L.w * S.w;

    H.x += M.x * P.x + M.y * Q.x + M.z * R.x + M.w * S.x;
    H.y += M.x * P.y + M.y * Q.y + M.z * R.y + M.w * S.y;
    H.z += M.x * P.z + M.y * Q.z + M.z * R.z + M.w * S.z;
    H.w += M.x * P.w + M.y * Q.w + M.z * R.w + M.w * S.w;

    I.x += N.x * P.x + N.y * Q.x + N.z * R.x + N.w * S.x;
    I.y += N.x * P.y + N.y * Q.y + N.z * R.y + N.w * S.y;
    I.z += N.x * P.z + N.y * Q.z + N.z * R.z + N.w * S.z;
    I.w += N.x * P.w + N.y * Q.w + N.z * R.w + N.w * S.w;

    J.x += O.x * P.x + O.y * Q.x + O.z * R.x + O.w * S.x;
    J.y += O.x * P.y + O.y * Q.y + O.z * R.y + O.w * S.y;
    J.z += O.x * P.z + O.y * Q.z + O.z * R.z + O.w * S.z;
    J.w += O.x * P.w + O.y * Q.w + O.z * R.w + O.w * S.w;
  }
  C[F.x + ((F.y << 2) + 0) * E] = G;
  C[F.x + ((F.y << 2) + 1) * E] = H;
  C[F.x + ((F.y << 2) + 2) * E] = I;
  C[F.x + ((F.y << 2) + 3) * E] = J;
}

__kernel void fn_B(__global float4* A, __global float4* B, __global float4* C, int D, __local float4* E) {
  int F = get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2);

  int G = get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0);

  float4 H = (float4)(0);
  float4 I = (float4)(0);
  float4 J = (float4)(0);
  float4 K = (float4)(0);

  int L = D / 4;

  for (int M = 0; M < (L / get_local_size(0)); M++) {
    int N = M * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * L;

    E[F] = A[N];
    E[F + get_local_size(0)] = A[N + L];
    E[F + 2 * get_local_size(0)] = A[N + 2 * L];
    E[F + 3 * get_local_size(0)] = A[N + 3 * L];

    barrier(1);

    int O = get_global_id(0) + ((M * get_local_size(0)) << 2) * get_global_size(0);

    for (int P = 0; P < get_local_size(0) * 4; P = P + 4) {
      float4 Q = E[(P >> 2) + get_local_id(1) * 4 * get_local_size(0)];
      float4 R = E[(P >> 2) + (get_local_id(1) * 4 + 1) * get_local_size(0)];
      float4 S = E[(P >> 2) + (get_local_id(1) * 4 + 2) * get_local_size(0)];
      float4 T = E[(P >> 2) + (get_local_id(1) * 4 + 3) * get_local_size(0)];

      float4 U = B[O + P * get_global_size(0)];
      float4 V = B[O + (P + 1) * get_global_size(0)];
      float4 W = B[O + (P + 2) * get_global_size(0)];
      float4 X = B[O + (P + 3) * get_global_size(0)];

      H.x += Q.x * U.x + Q.y * V.x + Q.z * W.x + Q.w * X.x;
      H.y += Q.x * U.y + Q.y * V.y + Q.z * W.y + Q.w * X.y;
      H.z += Q.x * U.z + Q.y * V.z + Q.z * W.z + Q.w * X.z;
      H.w += Q.x * U.w + Q.y * V.w + Q.z * W.w + Q.w * X.w;

      I.x += R.x * U.x + R.y * V.x + R.z * W.x + R.w * X.x;
      I.y += R.x * U.y + R.y * V.y + R.z * W.y + R.w * X.y;
      I.z += R.x * U.z + R.y * V.z + R.z * W.z + R.w * X.z;
      I.w += R.x * U.w + R.y * V.w + R.z * W.w + R.w * X.w;

      J.x += S.x * U.x + S.y * V.x + S.z * W.x + S.w * X.x;
      J.y += S.x * U.y + S.y * V.y + S.z * W.y + S.w * X.y;
      J.z += S.x * U.z + S.y * V.z + S.z * W.z + S.w * X.z;
      J.w += S.x * U.w + S.y * V.w + S.z * W.w + S.w * X.w;

      K.x += T.x * U.x + T.y * V.x + T.z * W.x + T.w * X.x;
      K.y += T.x * U.y + T.y * V.y + T.z * W.y + T.w * X.y;
      K.z += T.x * U.z + T.y * V.z + T.z * W.z + T.w * X.z;
      K.w += T.x * U.w + T.y * V.w + T.z * W.w + T.w * X.w;
    }
  }

  C[G] = H;
  C[G + get_global_size(0)] = I;
  C[G + 2 * get_global_size(0)] = J;
  C[G + 3 * get_global_size(0)] = K;
}

__kernel void fn_C(__global float4* A, __global float4* B, __global float4* C, int D, __local float4* E, __local float4* F)

{
  float4 G = (float4)(0);
  float4 H = (float4)(0);
  float4 I = (float4)(0);
  float4 J = (float4)(0);

  int K = D / 4;

  for (int L = 0; L < (K / get_local_size(0)); L++) {
    E[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2)] = A[L * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0)];
    E[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + get_local_size(0)] = A[L * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + get_global_size(0)];
    E[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 2 * get_local_size(0)] = A[L * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 2 * get_global_size(0)];
    E[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 3 * get_local_size(0)] = A[L * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 3 * get_global_size(0)];

    F[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2)] = B[get_global_id(0) + ((L * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0)];
    F[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + get_local_size(0)] = B[get_global_id(0) + ((L * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + get_global_size(0)];
    F[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 2 * get_local_size(0)] = B[get_global_id(0) + ((L * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + 2 * get_global_size(0)];
    F[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 3 * get_local_size(0)] = B[get_global_id(0) + ((L * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + 3 * get_global_size(0)];

    barrier(1);

    for (int M = 0; M < get_local_size(0) << 2; M = M + 4) {
      float4 N = E[(M >> 2) + get_local_id(1) * 4 * get_local_size(0)];
      float4 O = E[(M >> 2) + (get_local_id(1) * 4 + 1) * get_local_size(0)];
      float4 P = E[(M >> 2) + (get_local_id(1) * 4 + 2) * get_local_size(0)];
      float4 Q = E[(M >> 2) + (get_local_id(1) * 4 + 3) * get_local_size(0)];

      float4 R = F[get_local_id(0) + M * get_local_size(0)];
      float4 S = F[get_local_id(0) + (M + 1) * get_local_size(0)];
      float4 T = F[get_local_id(0) + (M + 2) * get_local_size(0)];
      float4 U = F[get_local_id(0) + (M + 3) * get_local_size(0)];

      G.x += N.x * R.x + N.y * S.x + N.z * T.x + N.w * U.x;
      G.y += N.x * R.y + N.y * S.y + N.z * T.y + N.w * U.y;
      G.z += N.x * R.z + N.y * S.z + N.z * T.z + N.w * U.z;
      G.w += N.x * R.w + N.y * S.w + N.z * T.w + N.w * U.w;

      H.x += O.x * R.x + O.y * S.x + O.z * T.x + O.w * U.x;
      H.y += O.x * R.y + O.y * S.y + O.z * T.y + O.w * U.y;
      H.z += O.x * R.z + O.y * S.z + O.z * T.z + O.w * U.z;
      H.w += O.x * R.w + O.y * S.w + O.z * T.w + O.w * U.w;

      I.x += P.x * R.x + P.y * S.x + P.z * T.x + P.w * U.x;
      I.y += P.x * R.y + P.y * S.y + P.z * T.y + P.w * U.y;
      I.z += P.x * R.z + P.y * S.z + P.z * T.z + P.w * U.z;
      I.w += P.x * R.w + P.y * S.w + P.z * T.w + P.w * U.w;

      J.x += Q.x * R.x + Q.y * S.x + Q.z * T.x + Q.w * U.x;
      J.y += Q.x * R.y + Q.y * S.y + Q.z * T.y + Q.w * U.y;
      J.z += Q.x * R.z + Q.y * S.z + Q.z * T.z + Q.w * U.z;
      J.w += Q.x * R.w + Q.y * S.w + Q.z * T.w + Q.w * U.w;
    }
  }
  C[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0)] = G;
  C[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + get_global_size(0)] = H;
  C[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 2 * get_global_size(0)] = I;
  C[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 3 * get_global_size(0)] = J;
}