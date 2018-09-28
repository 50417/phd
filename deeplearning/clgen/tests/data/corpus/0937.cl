struct param {
  uint iWidth;
  uint iHeight;
  uint it;
  float mean;
  float q0;
  float3 empt;
};

__kernel void fn_A(__constant struct param* A, __global const float* B, __global float* C) {
  int D = A->iWidth;
  int E = A->iHeight;
  int F = A->it;
  float G = A->mean;
  float H = A->q0;
  float I = (D - 4) * (E - 4);

  int J = get_global_id(0);
  int K = get_global_id(1);
  int L = get_global_id(2);
  int M = get_global_size(0);
  int N = get_global_size(1);
  int O = get_global_size(2);

  int P = L * M * N + K * M + J;

  int Q = (P / (D - 4)) + 2;
  int R = (P % (D - 4)) + 2;

  if (P < I) {
    float S = 0.0001;
    float T = (-0.2) * (F - 1);
    float U = H * exp(T);

    float V = ((B[(Q)*D + (R + 1)]) - (B[(Q)*D + (R - 1)])) / 2;
    float W = ((B[(Q + 1) * D + (R)]) - (B[(Q - 1) * D + (R)])) / 2;
    float X = sqrt(V * V + W * W);
    float Y = ((B[(Q)*D + (R + 1)]) + (B[(Q)*D + (R - 1)]) + (B[(Q + 1) * D + (R)]) + (B[(Q - 1) * D + (R)])) / 4 - (B[(Q)*D + (R)]);

    float Z = 0.5 * ((X / ((B[(Q)*D + (R)]) + S)) * (X / ((B[(Q)*D + (R)]) + S)));
    float AA = 0.625 * ((Y / ((B[(Q)*D + (R)]) + S)) * (Y / ((B[(Q)*D + (R)]) + S)));
    float AB = ((1 + (0.25 * Y / ((B[(Q)*D + (R)]) + S))) * (1 + (0.25 * Y / ((B[(Q)*D + (R)]) + S))));
    float AC = sqrt(__clc_fabs(Z - AA) / __clc_fabs(AB + S));
    float AD = (AC * AC - U * U) / (U * U * (1 + U * U) + S);

    (C[(Q)*D + (R)]) = 1 / (1 + AD);
  }
}

__kernel void fn_B(__constant struct param* A, __global const float* B, __global const float* C, __global float* D) {
  int E = A->iWidth;
  int F = A->iHeight;
  int G = A->it;
  float H = A->mean;
  float I = A->q0;

  float J = (E - 4) * (F - 4);

  int K = get_global_id(0);
  int L = get_global_id(1);
  int M = get_global_id(2);
  int N = get_global_size(0);
  int O = get_global_size(1);
  int P = get_global_size(2);
  int Q = M * N * O + L * N + K;

  int R = (Q / (E - 4)) + 2;
  int S = (Q % (E - 4)) + 2;

  if (Q < J) {
    float T = ((B[(R)*E + (S + 1)]) * ((C[(R)*E + (S + 2)]) - (C[(R)*E + (S)])) - (B[(R)*E + (S - 1)]) * ((C[(R)*E + (S)]) - (C[(R)*E + (S - 2)]))) / 4;
    float U = ((B[(R + 1) * E + (S)]) * ((C[(R + 2) * E + (S)]) - (C[(R)*E + (S)])) - (B[(R - 1) * E + (S)]) * ((C[(R)*E + (S)]) - (C[(R - 2) * E + (S)]))) / 4;

    (D[(R)*E + (S)]) = (C[(R)*E + (S)]) + 0.035 * (T + U);
    if (R == 2 && S == 2) {
      (D[(2) * E + (2)]) = (B[(R + 1) * E + (S)]);
      (D[(2) * E + (3)]) = (C[(R + 2) * E + (S)]);
      (D[(2) * E + (4)]) = (C[(R)*E + (S)]);
    }
  }
}