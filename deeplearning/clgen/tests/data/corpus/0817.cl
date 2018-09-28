typedef struct Color { int r, g, b; } color;

float fn_A(float A, float B) {
  if (B >= A) {
    return 1;
  }
  return 0;
}

float fn_B(float A, float B, float C) {
  return fn_A(A, C) - fn_A(B, C);
}

int fn_C(float A, float B) {
  float C = A * 32 + 1;
  float D = B * 32 + 1;
  int E = (int)C;
  int F = (int)D;
  float G = C - E;
  float H = D - F;

  if (E == 30 || E == 32) {
    float I = fn_B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), G);
    return (int)I * 255;
  }

  return 0;
}

color fn_D(float A, float B) {
  float C = fn_B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), A);
  color D;
  D.r = C * 255;
  D.g = C * 255;
  D.b = 0;

  return D;
}

color fn_E(float A, float B) {
  float C = fn_B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), A) - fn_B(0.5 - (0.5 / 2), 0.5 + (0.5 / 2), B);

  color D;
  D.r = 0;
  D.g = 0;
  D.b = 0;

  if (C > 0.0) {
    D.r = C * 255;
    D.g = C * 255;
    D.b = C * 255;
  }

  return D;
}

color fn_F(float A, float B) {
  float C = A * 31 + 1;
  float D = B * 31 + 1;
  int E = (int)C;
  int F = (int)D;
  float G = C - E;
  float H = D - F;

  if (fn_C(A, B) == 255) {
    color I;
    I.r = 255;
    I.g = 255;
    I.b = 255;
    return I;
  }

  if (E == 16) {
    return fn_D(G, H);
  }
  if (E == 8 || E == 12 || E == 20 || E == 24) {
    return fn_E(G, H);
  }

  color J;
  J.r = 0;
  J.g = 0;
  J.b = 0;

  return J;
}

__kernel void fn_G(__global unsigned char* A, int B, int C) {
  int D = get_global_id(0);

  unsigned char E, F, G;
  color H = fn_F((D % B) / (float)B, (D / B) / (float)C);

  E = H.r;
  F = H.g;
  G = H.b;

  D = D * 4;

  A[D] = G;
  A[D + 1] = F;
  A[D + 2] = E;
  A[D + 3] = 255;
}