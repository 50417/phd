typedef struct {
  unsigned int avg_y;

  unsigned int avg_r;
  unsigned int avg_gr;
  unsigned int avg_gb;
  unsigned int avg_b;
  unsigned int valid_wb_count;

  unsigned int f_value1;
  unsigned int f_value2;
} XCamGridStat;

__kernel void fn_A(__read_only image2d_t A, __global XCamGridStat* B) {
  int C = get_global_id(0);
  int D = get_global_id(1);
  int E = get_global_size(0);
  sampler_t F = 0x0000 | 0x0000 | 0x0000;

  int G = 16 * C;
  int H = 16 * D;
  float I = 0.0f, J = 0.0f, K = 0.0f, L = 0.0f;
  float M = 0.0f, N = 0.0f, O = 0.0f, P = 0.0f;
  int Q = 0, R = 0;
  float S = (16.0f / 2.0f) * (16.0f / 2.0f);
  float4 T[4];

  for (R = 0; R < 16; R += 2) {
    for (Q = 0; Q < 16; Q += 2) {
      T[0] = read_imagef(A, F, (int2)(G + Q, H + R));
      T[1] = read_imagef(A, F, (int2)(G + Q, H + R + 1));
      T[2] = read_imagef(A, F, (int2)(G + Q + 1, H + R));
      T[3] = read_imagef(A, F, (int2)(G + Q + 1, H + R + 1));
      I += T[0].x;
      K += T[1].x;
      J += T[2].x;
      L += T[3].x;
    }
  }

  M = I / S;
  N = J / S;
  O = K / S;
  P = L / S;

  B[D * E + C].avg_gr = convert_uint(M * 256.0f);
  B[D * E + C].avg_r = convert_uint(N * 256.0f);
  B[D * E + C].avg_b = convert_uint(O * 256.0f);
  B[D * E + C].avg_gb = convert_uint(P * 256.0f);
  B[D * E + C].valid_wb_count = convert_uint(S);
  B[D * E + C].avg_y = convert_uint(((M + P) / 2.0f) * 256.0f);
  B[D * E + C].f_value1 = 0;
  B[D * E + C].f_value2 = 0;
}