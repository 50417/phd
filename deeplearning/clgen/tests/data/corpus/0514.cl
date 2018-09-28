typedef float4 keypoint; __kernel void fn_A(__global keypoint* A, __global float* B, __global float* C, __global int* D, int E, float F, int G, int H, int I, int J, int K) {
  int L = get_global_id(0);
  keypoint M = A[L];
  if (!(H <= L && L < I && M.s1 >= 0.0f))
    return;
  int N, O = 0, P = 0;
  int Q, R, S, T;
  int U;
  float V, W, X, Y = 0.0;
  float Z, AA, AB;
  float AC[36];

  for (Q = 0; Q < 36; Q++)
    AC[Q] = 0.0f;

  int AD = (int)(M.s1 + 0.5), AE = (int)(M.s2 + 0.5);

  float AF = F * M.s3;
  int AG = (int)(AF * 3.0);
  int AH = ((0) < (AD - AG) ? (AD - AG) : (0));
  int AI = ((0) < (AE - AG) ? (AE - AG) : (0));
  int AJ = ((AD + AG) < (K - 2) ? (AD + AG) : (K - 2));
  int AK = ((AE + AG) < (J - 2) ? (AE + AG) : (J - 2));

  for (S = AH; S <= AJ; S++) {
    for (T = AI; T <= AK; T++) {
      W = B[S * J + T];

      float AL = (S - M.s1);
      V = AL * AL;
      AL = (T - M.s2);
      V += AL * AL;

      if (W > 0.0f && V < ((float)(AG * AG)) + 0.5f) {
        X = C[S * J + T];
        N = (int)(36.0f * (X + 0x1.921fb6p+1f + 0.001f) / (2.0f * 0x1.921fb6p+1f));
        if (N >= 0 && N <= 36) {
          N = ((N) < (35) ? (N) : (35));
          AC[N] += exp(-V / (2.0f * AF * AF)) * W;
        }
      }
    }
  }

  for (R = 0; R < 6; R++) {
    float O, AM;
    O = AC[35];
    for (Q = 0; Q < 36; Q++) {
      AM = AC[Q];
      AC[Q] = (O + AC[Q] + AC[(Q + 1 == 36) ? 0 : Q + 1]) / 3.0;
      O = AM;
    }
  }

  float AN = 0.0f;
  int AO = 0;
  for (Q = 0; Q < 36; Q++) {
    if (AN < AC[Q]) {
      AN = AC[Q];
      AO = Q;
    }
  }

  O = (AO == 0 ? 35 : AO - 1);
  P = (AO == 35 ? 0 : AO + 1);
  Z = AC[O];
  AB = AC[P];
  if (AN < 0.0f) {
    Z = -Z;
    AN = -AN;
    AB = -AB;
  }
  Y = 0.5f * (Z - AB) / (Z - 2.0f * AN + AB);
  X = 2.0f * 0x1.921fb6p+1f * (AO + 0.5f + Y) / 36.0f - 0x1.921fb6p+1f;

  M.s0 = M.s2 * E;
  M.s1 = M.s1 * E;
  M.s2 = M.s3 * E;
  M.s3 = X;
  A[L] = M;

  for (Q = 0; Q < 36; Q++) {
    int O = (Q == 0 ? 35 : Q - 1);
    int P = (Q == 35 ? 0 : Q + 1);
    float Z = AC[O];
    float AA = AC[Q];
    float AB = AC[P];
    if (AA > Z && AA > AB && AA >= 0.8f * AN && Q != AO) {
      if (AA < 0.0f) {
        Z = -Z;
        AA = -AA;
        AB = -AB;
      }
      float Y = 0.5f * (Z - AB) / (Z - 2.0f * AA + AB);
      float X = 2.0f * 0x1.921fb6p+1f * (Q + 0.5f + Y) / 36.0 - 0x1.921fb6p+1f;
      if (X >= -0x1.921fb6p+1f && X <= 0x1.921fb6p+1f) {
        M.s3 = X;
        U = atomic_add(D, 1);
        if (U < G)
          A[U] = M;
      }
    }
  }
}