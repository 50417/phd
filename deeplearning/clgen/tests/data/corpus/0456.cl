float fn_A(int A, int B, int C, int D) {
  float E = A;
  float F = B;
  float G = C;
  float H = D;

  float I = H - ((H - G) * exp(-sqrt(H) * 2 * exp(-(H - G) * E / F)));

  return I;
}