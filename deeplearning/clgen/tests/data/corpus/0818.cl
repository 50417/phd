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

color fn_C(float A, float B) {
  float C = 15 * A + 1;
  float D = 15 * B + 1;
  int E = (int)C;
  int F = (int)D;
  float G = C - E;
  float H = D - F;

  float I = fn_B(0.4, 0.6, H) + fn_B(0.49, 0.51, H);
  color J;
  if (I == 2.0) {
    J.r = 26;
    J.g = 26;
    J.b = 26;
  } else if (I == 1.0) {
    J.r = 77;
    J.g = 77;
    J.b = 77;
  } else {
    J.r = 102;
    J.g = 102;
    J.b = 102;
  }
  return J;
}

__kernel void fn_D(__global unsigned char* A, int B, int C) {
  int D = get_global_id(0);

  unsigned char E, F, G;
  color H = fn_C((D % B) / (float)B, (D / B) / (float)C);

  E = H.r;
  F = H.g;
  G = H.b;

  D = D * 4;

  A[D] = G;
  A[D + 1] = F;
  A[D + 2] = E;
  A[D + 3] = 255;
}