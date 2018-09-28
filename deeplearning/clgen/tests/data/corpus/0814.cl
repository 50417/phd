float fn_A(float A, float B) {
  if (B >= A) {
    return 1;
  }
  return 0;
}

float fn_B(float A, float B, float C) {
  return fn_A(A, C) - fn_A(B, C);
}

float3 fn_C(float A, float B) {
  float C = (1 - fn_B(0.05, 0.95, A)) + (1 - fn_B(0.05, 0.95, B));
  if (C > 0) {
    return (float3)(0.1, 0.1, 0.1);
  }

  if (B > 0.5) {
    return (float3)(0, 0.3, 0.5);
  }
  return (float3)(0.2, 0.2, 0.25);
}

__kernel void fn_D(__global unsigned char* A, int B, int C) {
  int D = get_global_id(0);

  float3 E = fn_C((D % B) / (float)B, (D / B) / (float)C);

  D = D * 4;

  A[D] = 255 * E.z;
  A[D + 1] = 255 * E.y;
  A[D + 2] = 255 * E.x;
  A[D + 3] = 255;
}