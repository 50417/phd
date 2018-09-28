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
  float C = fn_B(0.28 / 2, 1 - 0.28 / 2, A);
  float D = fn_B(0.12 / 2, 1 - 0.12 / 2, B);

  if (C == 1 && D == 0) {
    return 1;
  } else if (C == 0) {
    return 2;
  }
  return 3;
}

float fn_D(float A, float B) {
  float C = A * 5;
  float D = B * 25;
  int E = (int)C;
  int F = (int)D;
  float G = C - E;
  float H = D - F;

  int I = fn_C(G, H);
  if (I != 3)
    return I;

  I = 4;
  if (F % 2 == 0)
    I = 5;

  return I;
}

__kernel void fn_E(__global unsigned char* A, int B, int C) {
  int D = get_global_id(0);

  unsigned char E, F, G;
  float H = fn_D((D % B) / (float)B, (D / B) / (float)C);

  if (H == 1) {
    E = 87;
    F = 97;
    G = 102;
  } else if (H == 2) {
    E = 153;
    F = E;
    G = E;
  } else if (H == 4) {
    E = 51;
    F = 77;
    G = 128;
  } else {
    E = 104;
    F = 128;
    G = 179;
  }

  D = D * 4;

  A[D] = G;
  A[D + 1] = F;
  A[D + 2] = E;
  A[D + 3] = 255;
}