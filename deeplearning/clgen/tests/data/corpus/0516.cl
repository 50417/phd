typedef unsigned char JSAMPLE; struct ConverterInfo {
  int Cr_r_tab[255 + 1];
  int Cb_b_tab[255 + 1];
  int Cr_g_tab[255 + 1];
  int Cb_g_tab[255 + 1];
  JSAMPLE sample_range_limit[(5 * (255 + 1) + 128)];
};

__kernel void fn_A(__global struct ConverterInfo* A, __global JSAMPLE* B, __global JSAMPLE* C) {
  int D, E, F;
  __global JSAMPLE* G;
  __global JSAMPLE* H;
  __global JSAMPLE* I;
  __global JSAMPLE* J;
  __global JSAMPLE* K = A->sample_range_limit + (255 + 1);
  __global int* L = A->Cr_r_tab;
  __global int* M = A->Cb_b_tab;
  __global int* N = A->Cr_g_tab;
  __global int* O = A->Cb_g_tab;
  int P = get_global_id(0);
  int Q = get_global_id(1);
  int R = get_global_size(1);
  int S = get_global_size(0);
  int T = R * S;
  float3 U = (float3)(1.0f, 0.0f, 1.40200f);
  float3 V = (float3)(1.0f, -0.34414, -0.71414);
  float3 W = (float3)(1.0f, 1.77200f, 0.0f);
  float3 X;

  G = B + P * R + Q;
  H = G + T;
  I = H + T;

  X.x = convert_float((G[0]) & 0xff);
  X.y = convert_float(((H[0]) & 0xff) - 128);
  X.z = convert_float(((I[0]) & 0xff) - 128);
  J = C + (P * R + Q) * 3;
  J[0] = K[convert_int(dot(X, U))];
  J[1] = K[convert_int(dot(X, V))];
  J[2] = K[convert_int(dot(X, W))];
}