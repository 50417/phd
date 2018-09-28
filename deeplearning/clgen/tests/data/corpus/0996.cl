__kernel void fn_A(__global float* A, __constant unsigned int* B, unsigned int C, unsigned int D) {
  unsigned int E = get_global_id(0);
  unsigned int F = get_local_id(1);
  unsigned int G = get_global_size(0);

  for (unsigned int H = E; H < D; H += G) {
    unsigned int I = 0;
    unsigned int J = C + H;

    for (int K = 0; K < 31; K++, J >>= 1)
      if (J & 1)
        I ^= B[K + F * 31];

    A[mul24(F, D) + H] = (float)(I + 1) * (1.0f / (float)0x80000001U);
  }
}

float fn_B(unsigned int A) {
  const float B = 2.50662823884f;
  const float C = -18.61500062529f;
  const float D = 41.39119773534f;
  const float E = -25.44106049637f;
  const float F = -8.4735109309f;
  const float G = 23.08336743743f;
  const float H = -21.06224101826f;
  const float I = 3.13082909833f;
  const float J = 0.337475482272615f;
  const float K = 0.976169019091719f;
  const float L = 0.160797971491821f;
  const float M = 2.76438810333863E-02f;
  const float N = 3.8405729373609E-03f;
  const float O = 3.951896511919E-04f;
  const float P = 3.21767881768E-05f;
  const float Q = 2.888167364E-07f;
  const float R = 3.960315187E-07f;

  float S;

  bool T = false;

  if (A >= 0x80000000UL) {
    A = 0xffffffffUL - A;
    T = true;
  }

  const float U = 1.0f / (float)0xffffffffUL;
  const float V = U / 2.0f;
  float W = A * U + V;

  float X = W - 0.5f;

  if (X > -0.42f) {
    S = X * X;
    S = X * (((E * S + D) * S + C) * S + B) / ((((I * S + H) * S + G) * S + F) * S + 1.0f);
  }

  else {
    S = log(-log(W));
    S = -(J + S * (K + S * (L + S * (M + S * (N + S * (O + S * (P + S * (Q + S * R))))))));
  }

  return T ? -S : S;
}

__kernel void fn_C(__global float* A, const unsigned int B, const unsigned int C, const unsigned int D) {
  const unsigned int E = ((unsigned int)-1) / (B * D + 1);
  const unsigned int F = get_global_id(0);
  const unsigned int G = get_global_size(0);

  for (unsigned int H = F; H < B; H += G) {
    unsigned int I = (C * B + H + 1) * E;
    A[H] = fn_B(I);
  }
}