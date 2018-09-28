typedef short JCOEF; typedef JCOEF JBLOCK[64]; typedef JBLOCK* JBLOCKROW; typedef JBLOCKROW* JBLOCKARRAY; typedef JBLOCKARRAY* JBLOCKIMAGE; typedef unsigned char JSAMPLE; typedef JSAMPLE* JSAMPROW; typedef JSAMPROW* JSAMPARRAY; typedef JSAMPARRAY* JSAMPIMAGE; typedef unsigned int JDIMENSION; typedef int INT32; typedef short INT16; typedef float FAST_FLOAT; typedef FAST_FLOAT FLOAT_MULT_TYPE; typedef float DCT_FLOAT; struct ComponentInfo {
  unsigned int src_width;
  unsigned int src_height;
  unsigned int resize_blks_in_row;
  unsigned int resize_blks_in_height;
  unsigned int resize_blks_out_row;
  unsigned int resize_blks_out_height;

  int idct_blks_in_row;

  unsigned int dst_blks_in_row;
  unsigned int dst_blks_in_height;
  float idct_table[64];
  float fdct_table[64];
  int idct_int_table[64];
  int fdct_int_table[64];
};

struct DecodeInfo {
  struct ComponentInfo compInfo[10];
};

struct QuantiTable {
  float idct_table_f[4][64];
  float fdct_table_f[4][64];
  int idct_table_i[4][64];
  int fdct_table_i[4][64];
};

void fn_A(__local JCOEF* A, __local DCT_FLOAT* B, uchar8* C, __local FAST_FLOAT* D) {
  FAST_FLOAT E, F, G, H, I, J, K, L;
  FAST_FLOAT M, N, O, P;
  FAST_FLOAT Q, R, S, T, U;
  __local DCT_FLOAT* V;
  __local FAST_FLOAT* W;
  __local JCOEF* X;
  X = A;
  int Y = get_global_id(1);
  W = D;
  V = B;

  X += Y;
  V += Y;
  W += Y;
  if (X[8 * 1] == 0 && X[8 * 2] == 0 && X[8 * 3] == 0 && X[8 * 4] == 0 && X[8 * 5] == 0 && X[8 * 6] == 0 && X[8 * 7] == 0) {
    FAST_FLOAT Z = (((FAST_FLOAT)(X[8 * 0])) * (V[8 * 0]));

    W[8 * 0] = Z;
    W[8 * 1] = Z;
    W[8 * 2] = Z;
    W[8 * 3] = Z;
    W[8 * 4] = Z;
    W[8 * 5] = Z;
    W[8 * 6] = Z;
    W[8 * 7] = Z;
  } else {
    E = (((FAST_FLOAT)(X[8 * 0])) * (V[8 * 0]));
    F = (((FAST_FLOAT)(X[8 * 2])) * (V[8 * 2]));
    G = (((FAST_FLOAT)(X[8 * 4])) * (V[8 * 4]));
    H = (((FAST_FLOAT)(X[8 * 6])) * (V[8 * 6]));

    M = E + G;
    N = E - G;

    P = F + H;
    O = (F - H) * ((FAST_FLOAT)1.414213562) - P;

    E = M + P;
    H = M - P;
    F = N + O;
    G = N - O;

    I = (((FAST_FLOAT)(X[8 * 1])) * (V[8 * 1]));
    J = (((FAST_FLOAT)(X[8 * 3])) * (V[8 * 3]));
    K = (((FAST_FLOAT)(X[8 * 5])) * (V[8 * 5]));
    L = (((FAST_FLOAT)(X[8 * 7])) * (V[8 * 7]));

    U = K + J;
    R = K - J;
    S = I + L;
    T = I - L;

    L = S + U;
    N = (S - U) * ((FAST_FLOAT)1.414213562);

    Q = (R + T) * ((FAST_FLOAT)1.847759065);
    M = ((FAST_FLOAT)1.082392200) * T - Q;
    O = ((FAST_FLOAT)-2.613125930) * R + Q;

    K = O - L;
    J = N - K;
    I = M + J;

    W[8 * 0] = E + L;
    W[8 * 7] = E - L;
    W[8 * 1] = F + K;
    W[8 * 6] = F - K;
    W[8 * 2] = G + J;
    W[8 * 5] = G - J;
    W[8 * 4] = H + I;
    W[8 * 3] = H - I;
  }
  barrier(1);

  W = D;
  W += 8 * Y;

  M = W[0] + W[4];
  N = W[0] - W[4];
  P = W[2] + W[6];
  O = (W[2] - W[6]) * ((FAST_FLOAT)1.414213562) - P;

  E = M + P;
  H = M - P;
  F = N + O;
  G = N - O;

  U = W[5] + W[3];
  R = W[5] - W[3];
  S = W[1] + W[7];
  T = W[1] - W[7];

  L = S + U;
  N = (S - U) * ((FAST_FLOAT)1.414213562);

  Q = (R + T) * ((FAST_FLOAT)1.847759065);
  M = ((FAST_FLOAT)1.082392200) * T - Q;
  O = ((FAST_FLOAT)-2.613125930) * R + Q;

  K = O - L;
  J = N - K;
  I = M + J;

  uchar8 AA;

  AA.s0 = clamp((int)((((int)(E + L)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s7 = clamp((int)((((int)(E - L)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s1 = clamp((int)((((int)(F + K)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s6 = clamp((int)((((int)(F - K)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s2 = clamp((int)((((int)(G + J)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s5 = clamp((int)((((int)(G - J)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s4 = clamp((int)((((int)(H + I)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  AA.s3 = clamp((int)((((int)(H - I)) + (((INT32)1) << ((3) - 1))) >> (3)) + 128, 0, 255);
  *C = AA;
}

void fn_B(__global JCOEF* A, __local int* B, uchar16* C, uchar16* D, __local int* E)

{
  INT32 F, G, H, I, J, K, L, M;
  INT32 N, O, P, Q, R, S, T, U;
  INT32 V, W, X, Y;
  __local int* Z;
  __local int* AA;
  __global JCOEF* AB;
  AB = A;
  int AC = get_global_id(1);
  AA = E;
  Z = B;

  AB += AC;
  Z += AC;
  AA += AC;

  F = (((int)(AB[8 * 0])) * (Z[8 * 0]));
  F <<= 13;
  F += 1 << (13 - 2 - 1);

  V = (((int)(AB[8 * 4])) * (Z[8 * 4]));
  G = ((V) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  H = ((V) * (((INT32)4433)));

  J = F + G;
  K = F - G;
  L = F + H;
  M = F - H;

  V = (((int)(AB[8 * 2])) * (Z[8 * 2]));
  W = (((int)(AB[8 * 6])) * (Z[8 * 6]));
  X = V - W;
  Y = ((X) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  X = ((X) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  F = X + ((W) * (((INT32)20995)));
  G = Y + ((V) * (((INT32)7373)));
  H = X - ((V) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  I = Y - ((W) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  N = J + F;
  U = J - F;
  O = L + G;
  T = L - G;
  P = M + H;
  S = M - H;
  Q = K + I;
  R = K - I;

  V = (((int)(AB[8 * 1])) * (Z[8 * 1]));
  W = (((int)(AB[8 * 3])) * (Z[8 * 3]));
  X = (((int)(AB[8 * 5])) * (Z[8 * 5]));
  Y = (((int)(AB[8 * 7])) * (Z[8 * 7]));

  K = V + X;

  G = ((V + W) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H = ((K) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  I = ((V + Y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  J = ((V - Y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  K = ((K) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  L = ((V - W) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  F = G + H + I - ((V) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  M = J + K + L - ((V) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  V = ((W + X) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  G += V + ((W) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  H += V - ((X) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  V = ((X - W) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  K += V - ((X) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  L += V + ((W) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  W += Y;
  V = ((W) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  G += V;
  I += V + ((Y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  W = ((W) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  J += W + ((Y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  L += W;
  W = ((X + Y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H += W;
  I += W;
  W = ((Y - X) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  J += W;
  K += W;

  AA[8 * 0] = (int)((N + F) >> (13 - 2));
  AA[8 * 15] = (int)((N - F) >> (13 - 2));
  AA[8 * 1] = (int)((O + G) >> (13 - 2));
  AA[8 * 14] = (int)((O - G) >> (13 - 2));
  AA[8 * 2] = (int)((P + H) >> (13 - 2));
  AA[8 * 13] = (int)((P - H) >> (13 - 2));
  AA[8 * 3] = (int)((Q + I) >> (13 - 2));
  AA[8 * 12] = (int)((Q - I) >> (13 - 2));
  AA[8 * 4] = (int)((R + J) >> (13 - 2));
  AA[8 * 11] = (int)((R - J) >> (13 - 2));
  AA[8 * 5] = (int)((S + K) >> (13 - 2));
  AA[8 * 10] = (int)((S - K) >> (13 - 2));
  AA[8 * 6] = (int)((T + L) >> (13 - 2));
  AA[8 * 9] = (int)((T - L) >> (13 - 2));
  AA[8 * 7] = (int)((U + M) >> (13 - 2));
  AA[8 * 8] = (int)((U - M) >> (13 - 2));

  barrier(1);

  AA = E;
  AA += 8 * 2 * AC;
  __local int* AD;
  AD = E;
  AD += 8 * (2 * AC + 1);

  F = (INT32)AA[0] + (((INT32)1) << (2 + 2));
  F <<= 13;

  V = (INT32)AA[4];
  G = ((V) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  H = ((V) * (((INT32)4433)));

  J = F + G;
  K = F - G;
  L = F + H;
  M = F - H;

  V = (INT32)AA[2];
  W = (INT32)AA[6];
  X = V - W;
  Y = ((X) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  X = ((X) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  F = X + ((W) * (((INT32)20995)));
  G = Y + ((V) * (((INT32)7373)));
  H = X - ((V) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  I = Y - ((W) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  N = J + F;
  U = J - F;
  O = L + G;
  T = L - G;
  P = M + H;
  S = M - H;
  Q = K + I;
  R = K - I;

  V = (INT32)AA[1];
  W = (INT32)AA[3];
  X = (INT32)AA[5];
  Y = (INT32)AA[7];

  K = V + X;

  G = ((V + W) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H = ((K) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  I = ((V + Y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  J = ((V - Y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  K = ((K) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  L = ((V - W) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  F = G + H + I - ((V) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  M = J + K + L - ((V) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  V = ((W + X) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  G += V + ((W) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  H += V - ((X) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  V = ((X - W) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  K += V - ((X) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  L += V + ((W) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  W += Y;
  V = ((W) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  G += V;
  I += V + ((Y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  W = ((W) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  J += W + ((Y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  L += W;
  W = ((X + Y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H += W;
  I += W;
  W = ((Y - X) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  J += W;
  K += W;

  uchar16 AE;
  AE.s0 = clamp((int)((N + F) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sF = clamp((int)((N - F) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s1 = clamp((int)((O + G) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sE = clamp((int)((O - G) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s2 = clamp((int)((P + H) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sD = clamp((int)((P - H) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s3 = clamp((int)((Q + I) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sC = clamp((int)((Q - I) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s4 = clamp((int)((R + J) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sB = clamp((int)((R - J) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s5 = clamp((int)((S + K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.sA = clamp((int)((S - K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s6 = clamp((int)((T + L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s9 = clamp((int)((T - L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s7 = clamp((int)((U + M) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s8 = clamp((int)((U - M) >> (13 + 2 + 3)) + 128, 0, 255);

  F = (INT32)AD[0] + (((INT32)1) << (2 + 2));
  F <<= 13;

  V = (INT32)AD[4];
  G = ((V) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  H = ((V) * (((INT32)4433)));

  J = F + G;
  K = F - G;
  L = F + H;
  M = F - H;

  V = (INT32)AD[2];
  W = (INT32)AD[6];
  X = V - W;
  Y = ((X) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  X = ((X) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  F = X + ((W) * (((INT32)20995)));
  G = Y + ((V) * (((INT32)7373)));
  H = X - ((V) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  I = Y - ((W) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  N = J + F;
  U = J - F;
  O = L + G;
  T = L - G;
  P = M + H;
  S = M - H;
  Q = K + I;
  R = K - I;

  V = (INT32)AD[1];
  W = (INT32)AD[3];
  X = (INT32)AD[5];
  Y = (INT32)AD[7];

  K = V + X;

  G = ((V + W) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H = ((K) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  I = ((V + Y) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  J = ((V - Y) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  K = ((K) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  L = ((V - W) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  F = G + H + I - ((V) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  M = J + K + L - ((V) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  V = ((W + X) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  G += V + ((W) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  H += V - ((X) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  V = ((X - W) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  K += V - ((X) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  L += V + ((W) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  W += Y;
  V = ((W) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  G += V;
  I += V + ((Y) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  W = ((W) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  J += W + ((Y) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  L += W;
  W = ((X + Y) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  H += W;
  I += W;
  W = ((Y - X) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  J += W;
  K += W;

  uchar16 AF;
  AF.s0 = clamp((int)((N + F) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sF = clamp((int)((N - F) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s1 = clamp((int)((O + G) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sE = clamp((int)((O - G) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s2 = clamp((int)((P + H) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sD = clamp((int)((P - H) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s3 = clamp((int)((Q + I) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sC = clamp((int)((Q - I) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s4 = clamp((int)((R + J) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sB = clamp((int)((R - J) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s5 = clamp((int)((S + K) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.sA = clamp((int)((S - K) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s6 = clamp((int)((T + L) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s9 = clamp((int)((T - L) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s7 = clamp((int)((U + M) >> (13 + 2 + 3)) + 128, 0, 255);
  AF.s8 = clamp((int)((U - M) >> (13 + 2 + 3)) + 128, 0, 255);

  *C = AE;
  *D = AF;
}

void fn_C(__global JCOEF* A, __local int* B, uchar16* C, __local int* D) {
  __local int* E;
  __local int* F;
  __global JCOEF* G;
  G = A;
  int H = get_global_id(1);
  F = D;
  E = B;

  G += H;
  E += H;
  F += H;

  INT32 I, J, K, L, M, N, O, P;
  INT32 Q, R, S, T, U, V, W, X;
  INT32 Y, Z, AA, AB;

  if (G[8 * 1] == 0 && G[8 * 2] == 0 && G[8 * 3] == 0 && G[8 * 4] == 0 && G[8 * 5] == 0 && G[8 * 6] == 0 && G[8 * 7] == 0) {
    int AC = (((int)(G[8 * 0])) * (E[8 * 0])) << 2;

    F[8 * 0] = AC;
    F[8 * 1] = AC;
    F[8 * 2] = AC;
    F[8 * 3] = AC;
    F[8 * 4] = AC;
    F[8 * 5] = AC;
    F[8 * 6] = AC;
    F[8 * 7] = AC;
  } else {
    Z = (((int)(G[8 * 2])) * (E[8 * 2]));
    AA = (((int)(G[8 * 6])) * (E[8 * 6]));

    Y = ((Z + AA) * (((INT32)4433)));
    K = Y + ((Z) * (((INT32)6270)));
    L = Y - ((AA) * (((INT32)15137)));

    Z = (((int)(G[8 * 0])) * (E[8 * 0]));
    AA = (((int)(G[8 * 4])) * (E[8 * 4]));
    Z <<= 13;
    AA <<= 13;

    Z += ((INT32)1) << (13 - 2 - 1);

    I = Z + AA;
    J = Z - AA;

    M = I + K;
    P = I - K;
    N = J + L;
    O = J - L;

    I = (((int)(G[8 * 7])) * (E[8 * 7]));
    J = (((int)(G[8 * 5])) * (E[8 * 5]));
    K = (((int)(G[8 * 3])) * (E[8 * 3]));
    L = (((int)(G[8 * 1])) * (E[8 * 1]));

    Z = I + K;
    AA = J + L;

    Y = ((Z + AA) * (((INT32)9633)));
    Z = ((Z) * (-((INT32)16069)));
    AA = ((AA) * (-((INT32)3196)));
    Z += Y;
    AA += Y;

    Y = ((I + L) * (-((INT32)7373)));
    I = ((I) * (((INT32)2446)));
    L = ((L) * (((INT32)12299)));
    I += Y + Z;
    L += Y + AA;

    Y = ((J + K) * (-((INT32)20995)));
    J = ((J) * (((INT32)16819)));
    K = ((K) * (((INT32)25172)));
    J += Y + AA;
    K += Y + Z;

    F[8 * 0] = (int)((M + L) >> (13 - 2));
    F[8 * 7] = (int)((M - L) >> (13 - 2));
    F[8 * 1] = (int)((N + K) >> (13 - 2));
    F[8 * 6] = (int)((N - K) >> (13 - 2));
    F[8 * 2] = (int)((O + J) >> (13 - 2));
    F[8 * 5] = (int)((O - J) >> (13 - 2));
    F[8 * 3] = (int)((P + I) >> (13 - 2));
    F[8 * 4] = (int)((P - I) >> (13 - 2));
  }
  barrier(1);
  F = D;
  F += 8 * H;

  I = (INT32)F[0] + (((INT32)1) << (2 + 2));
  I <<= 13;

  Y = (INT32)F[4];
  J = ((Y) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  K = ((Y) * (((INT32)4433)));

  M = I + J;
  N = I - J;
  O = I + K;
  P = I - K;

  Y = (INT32)F[2];
  Z = (INT32)F[6];
  AA = Y - Z;
  AB = ((AA) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  AA = ((AA) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  I = AA + ((Z) * (((INT32)20995)));
  J = AB + ((Y) * (((INT32)7373)));
  K = AA - ((Y) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  L = AB - ((Z) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  Q = M + I;
  X = M - I;
  R = O + J;
  W = O - J;
  S = P + K;
  V = P - K;
  T = N + L;
  U = N - L;

  Y = (INT32)F[1];
  Z = (INT32)F[3];
  AA = (INT32)F[5];
  AB = (INT32)F[7];

  N = Y + AA;

  J = ((Y + Z) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  K = ((N) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  L = ((Y + AB) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  M = ((Y - AB) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  N = ((N) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  O = ((Y - Z) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  I = J + K + L - ((Y) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  P = M + N + O - ((Y) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  Y = ((Z + AA) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  J += Y + ((Z) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  K += Y - ((AA) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  Y = ((AA - Z) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  N += Y - ((AA) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  O += Y + ((Z) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  Z += AB;
  Y = ((Z) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  J += Y;
  L += Y + ((AB) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  Z = ((Z) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  M += Z + ((AB) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  O += Z;
  Z = ((AA + AB) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  K += Z;
  L += Z;
  Z = ((AB - AA) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  M += Z;
  N += Z;

  uchar16 AD;
  AD.s0 = clamp((int)((Q + I) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sF = clamp((int)((Q - I) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s1 = clamp((int)((R + J) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sE = clamp((int)((R - J) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s2 = clamp((int)((S + K) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sD = clamp((int)((S - K) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s3 = clamp((int)((T + L) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sC = clamp((int)((T - L) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s4 = clamp((int)((U + M) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sB = clamp((int)((U - M) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s5 = clamp((int)((V + N) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.sA = clamp((int)((V - N) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s6 = clamp((int)((W + O) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s9 = clamp((int)((W - O) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s7 = clamp((int)((X + P) >> (13 + 2 + 3)) + 128, 0, 255);
  AD.s8 = clamp((int)((X - P) >> (13 + 2 + 3)) + 128, 0, 255);

  *C = AD;
}

void fn_D(__global JCOEF* A, __local int* B, uchar8* C, uchar8* D, __local int* E) {
  __local int* F;
  __local int* G;
  __global JCOEF* H;
  H = A;
  int I = get_global_id(1);
  G = E;
  F = B;

  H += I;
  F += I;
  G += I;

  INT32 J, K, L, M, N, O, P, Q;
  INT32 R, S, T, U, V, W, X, Y;
  INT32 Z, AA, AB, AC;

  J = (((int)(H[8 * 0])) * (F[8 * 0]));
  J <<= 13;

  J += ((INT32)1) << (13 - 2 - 1);

  Z = (((int)(H[8 * 4])) * (F[8 * 4]));
  K = ((Z) * (((INT32)((1.306562965) * (((INT32)1) << 13) + 0.5))));
  L = ((Z) * (((INT32)4433)));

  N = J + K;
  O = J - K;
  P = J + L;
  Q = J - L;

  Z = (((int)(H[8 * 2])) * (F[8 * 2]));
  AA = (((int)(H[8 * 6])) * (F[8 * 6]));
  AB = Z - AA;
  AC = ((AB) * (((INT32)((0.275899379) * (((INT32)1) << 13) + 0.5))));
  AB = ((AB) * (((INT32)((1.387039845) * (((INT32)1) << 13) + 0.5))));

  J = AB + ((AA) * (((INT32)20995)));
  K = AC + ((Z) * (((INT32)7373)));
  L = AB - ((Z) * (((INT32)((0.601344887) * (((INT32)1) << 13) + 0.5))));
  M = AC - ((AA) * (((INT32)((0.509795579) * (((INT32)1) << 13) + 0.5))));

  R = N + J;
  Y = N - J;
  S = P + K;
  X = P - K;
  T = Q + L;
  W = Q - L;
  U = O + M;
  V = O - M;

  Z = (((int)(H[8 * 1])) * (F[8 * 1]));
  AA = (((int)(H[8 * 3])) * (F[8 * 3]));
  AB = (((int)(H[8 * 5])) * (F[8 * 5]));
  AC = (((int)(H[8 * 7])) * (F[8 * 7]));

  O = Z + AB;

  K = ((Z + AA) * (((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  L = ((O) * (((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  M = ((Z + AC) * (((INT32)((1.093201867) * (((INT32)1) << 13) + 0.5))));
  N = ((Z - AC) * (((INT32)((0.897167586) * (((INT32)1) << 13) + 0.5))));
  O = ((O) * (((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  P = ((Z - AA) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  J = K + L + M - ((Z) * (((INT32)((2.286341144) * (((INT32)1) << 13) + 0.5))));
  Q = N + O + P - ((Z) * (((INT32)((1.835730603) * (((INT32)1) << 13) + 0.5))));
  Z = ((AA + AB) * (((INT32)((0.138617169) * (((INT32)1) << 13) + 0.5))));
  K += Z + ((AA) * (((INT32)((0.071888074) * (((INT32)1) << 13) + 0.5))));
  L += Z - ((AB) * (((INT32)((1.125726048) * (((INT32)1) << 13) + 0.5))));
  Z = ((AB - AA) * (((INT32)((1.407403738) * (((INT32)1) << 13) + 0.5))));
  O += Z - ((AB) * (((INT32)((0.766367282) * (((INT32)1) << 13) + 0.5))));
  P += Z + ((AA) * (((INT32)((1.971951411) * (((INT32)1) << 13) + 0.5))));
  AA += AC;
  Z = ((AA) * (-((INT32)((0.666655658) * (((INT32)1) << 13) + 0.5))));
  K += Z;
  M += Z + ((AC) * (((INT32)((1.065388962) * (((INT32)1) << 13) + 0.5))));
  AA = ((AA) * (-((INT32)((1.247225013) * (((INT32)1) << 13) + 0.5))));
  N += AA + ((AC) * (((INT32)((3.141271809) * (((INT32)1) << 13) + 0.5))));
  P += AA;
  AA = ((AB + AC) * (-((INT32)((1.353318001) * (((INT32)1) << 13) + 0.5))));
  L += AA;
  M += AA;
  AA = ((AC - AB) * (((INT32)((0.410524528) * (((INT32)1) << 13) + 0.5))));
  N += AA;
  O += AA;

  G[8 * 0] = (int)((R + J) >> (13 - 2));
  G[8 * 15] = (int)((R - J) >> (13 - 2));
  G[8 * 1] = (int)((S + K) >> (13 - 2));
  G[8 * 14] = (int)((S - K) >> (13 - 2));
  G[8 * 2] = (int)((T + L) >> (13 - 2));
  G[8 * 13] = (int)((T - L) >> (13 - 2));
  G[8 * 3] = (int)((U + M) >> (13 - 2));
  G[8 * 12] = (int)((U - M) >> (13 - 2));
  G[8 * 4] = (int)((V + N) >> (13 - 2));
  G[8 * 11] = (int)((V - N) >> (13 - 2));
  G[8 * 5] = (int)((W + O) >> (13 - 2));
  G[8 * 10] = (int)((W - O) >> (13 - 2));
  G[8 * 6] = (int)((X + P) >> (13 - 2));
  G[8 * 9] = (int)((X - P) >> (13 - 2));
  G[8 * 7] = (int)((Y + Q) >> (13 - 2));
  G[8 * 8] = (int)((Y - Q) >> (13 - 2));

  barrier(1);
  G = E;
  G += 8 * 2 * I;
  __local int* AD;
  AD = E;
  AD += 8 * (2 * I + 1);

  AA = (INT32)G[2];
  AB = (INT32)G[6];

  Z = ((AA + AB) * (((INT32)4433)));
  L = Z + ((AA) * (((INT32)6270)));
  M = Z - ((AB) * (((INT32)15137)));

  AA = (INT32)G[0] + (((INT32)1) << (2 + 2));
  AB = (INT32)G[4];

  J = (AA + AB) << 13;
  K = (AA - AB) << 13;

  N = J + L;
  Q = J - L;
  O = K + M;
  P = K - M;

  J = (INT32)G[7];
  K = (INT32)G[5];
  L = (INT32)G[3];
  M = (INT32)G[1];

  AA = J + L;
  AB = K + M;

  Z = ((AA + AB) * (((INT32)9633)));
  AA = ((AA) * (-((INT32)16069)));
  AB = ((AB) * (-((INT32)3196)));
  AA += Z;
  AB += Z;

  Z = ((J + M) * (-((INT32)7373)));
  J = ((J) * (((INT32)2446)));
  M = ((M) * (((INT32)12299)));
  J += Z + AA;
  M += Z + AB;

  Z = ((K + L) * (-((INT32)20995)));
  K = ((K) * (((INT32)16819)));
  L = ((L) * (((INT32)25172)));
  K += Z + AB;
  L += Z + AA;

  uchar8 AE;
  AE.s0 = clamp((int)((N + M) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s7 = clamp((int)((N - M) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s1 = clamp((int)((O + L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s6 = clamp((int)((O - L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s2 = clamp((int)((P + K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s5 = clamp((int)((P - K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s3 = clamp((int)((Q + J) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s4 = clamp((int)((Q - J) >> (13 + 2 + 3)) + 128, 0, 255);
  *C = AE;

  AA = (INT32)AD[2];
  AB = (INT32)AD[6];

  Z = ((AA + AB) * (((INT32)4433)));
  L = Z + ((AA) * (((INT32)6270)));
  M = Z - ((AB) * (((INT32)15137)));

  AA = (INT32)AD[0] + (((INT32)1) << (2 + 2));
  AB = (INT32)AD[4];

  J = (AA + AB) << 13;
  K = (AA - AB) << 13;

  N = J + L;
  Q = J - L;
  O = K + M;
  P = K - M;

  J = (INT32)AD[7];
  K = (INT32)AD[5];
  L = (INT32)AD[3];
  M = (INT32)AD[1];

  AA = J + L;
  AB = K + M;

  Z = ((AA + AB) * (((INT32)9633)));
  AA = ((AA) * (-((INT32)16069)));
  AB = ((AB) * (-((INT32)3196)));
  AA += Z;
  AB += Z;

  Z = ((J + M) * (-((INT32)7373)));
  J = ((J) * (((INT32)2446)));
  M = ((M) * (((INT32)12299)));
  J += Z + AA;
  M += Z + AB;

  Z = ((K + L) * (-((INT32)20995)));
  K = ((K) * (((INT32)16819)));
  L = ((L) * (((INT32)25172)));
  K += Z + AB;
  L += Z + AA;

  AE.s0 = clamp((int)((N + M) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s7 = clamp((int)((N - M) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s1 = clamp((int)((O + L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s6 = clamp((int)((O - L) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s2 = clamp((int)((P + K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s5 = clamp((int)((P - K) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s3 = clamp((int)((Q + J) >> (13 + 2 + 3)) + 128, 0, 255);
  AE.s4 = clamp((int)((Q - J) >> (13 + 2 + 3)) + 128, 0, 255);
  *D = AE;
}
void fn_E(__local JCOEF* A, int B) {
  __local JCOEF* C = A + B;
  __local JCOEF* D = C + B;
  __local JCOEF* E = D + B;
  __local JCOEF* F = E + B;
  __local JCOEF* G = F + B;
  __local JCOEF* H = G + B;
  __local JCOEF* I = H + B;

  float J = ((*A) + (*F)) * 1.0;
  float K = 1.306562964876377f * (*D) + 0.541196100146197f * (*H);

  float L = J + K;
  float M = J - K;
  float N = 0.275899379282943f * (*I) + 1.387039845322148f * (*C) + 1.175875602419359f * (*E) + 0.785694958387102f * (*G);
  float O = 1.387039845322148f * (*I) - 0.275899379282943f * (*C) + 0.785694958387102f * (*E) - 1.175875602419359f * (*G);

  float P = (*A) - (*F);
  float Q = 0.541196100146197f * (*D) - 1.306562964876377f * (*H);

  float R = P + Q;
  float S = P - Q;
  float T = 1.175875602419359f * (*C) - 0.785694958387102f * (*I) - 0.275899379282943f * (*E) - 1.387039845322148f * (*G);
  float U = 0.785694958387102f * (*C) + 1.175875602419359f * (*I) - 1.387039845322148f * (*E) + 0.275899379282943f * (*G);

  (*A) = 0.3535533905932737f * (L + N);
  (*I) = 0.3535533905932737f * (L - N);
  (*F) = 0.3535533905932737f * (M + O);
  (*E) = 0.3535533905932737f * (M - O);

  (*C) = 0.3535533905932737f * (R + T);
  (*G) = 0.3535533905932737f * (S - U);
  (*D) = 0.3535533905932737f * (S + U);
  (*H) = 0.3535533905932737f * (R - T);
}

__kernel void fn_F(__global struct QuantiTable* A, __global JCOEF* B, __global JSAMPLE* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J;
  int K;

  __global JCOEF* L;
  L = B + F * 64 + G * 64;

  __local FAST_FLOAT M[64 * 8];
  __local FAST_FLOAT* N;
  N = M + H * 64;

  __global DCT_FLOAT* O;
  O = A->idct_table_f[D];

  __local DCT_FLOAT P[64];
  event_t Q;
  Q = async_work_group_copy(P, O, 64, (event_t)0);

  float R = (float)(G) / (float)E;
  J = __clc_floor(R);
  K = (G)-J * E;

  __global JSAMPLE* S;
  S = C + F * 64 + J * E * 64 + I * E * 8 + K * 8;

  wait_group_events(1, &Q);

  __local JCOEF T[64 * 8];
  __local JCOEF* U;
  U = (T + H * 64 + I * 8);
  *(__local short8*)U = vload8(0, L + I * 8);
  U = T + H * 64;

  uchar8 V;
  fn_A(U, P, &V, N);
  vstore8(V, 0, S);
}

__kernel void fn_G(__global struct QuantiTable* A, __global JCOEF* B, __global JSAMPLE* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J;
  int K;

  __global JCOEF* L;
  L = B + F * 64 + G * 64;

  __local int M[8 * 16 * 8];
  __local int* N;
  N = M + H * 8 * 16;

  __global int* O;

  __local int P[64];
  event_t Q;
  O = A->idct_table_i[D];
  Q = async_work_group_copy(P, O, 64, (event_t)0);

  float R = (float)(G) / (float)E;
  J = __clc_floor(R);
  K = (G)-J * E;

  __global JSAMPLE* S;
  __global JSAMPLE* T;

  S = C + F * 64 * 4 + J * E * 64 * 4 + I * E * 8 * 4 + K * 8 * 2;
  T = S + E * 8 * 2;

  wait_group_events(1, &Q);
  uchar16 U, V;
  fn_B((__global JCOEF*)L, P, &U, &V, N);
  vstore16(U, 0, S);
  vstore16(V, 0, T);
}

__kernel void fn_H(__global struct QuantiTable* A, __global JCOEF* B, __global JSAMPLE* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J;
  int K;

  __global JCOEF* L;
  L = B + F * 64 + G * 64;

  __local int M[64 * 8];
  __local int* N;
  N = M + H * 64;

  __global int* O;

  __local int P[64];
  event_t Q;
  O = A->idct_table_i[D];
  Q = async_work_group_copy(P, O, 64, (event_t)0);

  float R = (float)(G) / (float)E;
  J = __clc_floor(R);
  K = (G)-J * E;

  __global JSAMPLE* S;

  S = C + F * 128 + J * E * 128 + I * E * 16 + K * 16;
  wait_group_events(1, &Q);
  uchar16 T;
  fn_C((__global JCOEF*)L, P, &T, N);
  vstore16(T, 0, S);
}

__kernel void fn_I(__global struct QuantiTable* A, __global JCOEF* B, __global JSAMPLE* C, int D, int E, int F) {
  int G = get_global_id(0);
  int H = get_local_id(0);
  int I = get_local_id(1);

  int J;
  int K;

  __global JCOEF* L;
  L = B + F * 64 + G * 64;

  __local int M[128 * 8];
  __local int* N;
  N = M + H * 128;

  __global int* O;

  __local int P[64];
  event_t Q;
  O = A->idct_table_i[D];
  Q = async_work_group_copy(P, O, 64, (event_t)0);

  float R = (float)(G) / (float)E;
  J = __clc_floor(R);
  K = (G)-J * E;

  __global JSAMPLE* S;
  __global JSAMPLE* T;

  S = C + F * 128 + J * E * 128 + I * E * 8 * 2 + K * 8;
  T = S + E * 8;
  wait_group_events(1, &Q);
  uchar8 U;
  uchar8 V;
  fn_D((__global JCOEF*)L, P, &U, &V, N);
  vstore8(U, 0, S);
  vstore8(V, 0, T);
}