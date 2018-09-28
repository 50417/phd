float2 fn_A(float2 A, float2 B) {
  return (float2)(A.x * B.x - A.y * B.y, A.x * B.y + A.y * B.x);
}

float2 fn_B(float2 A, int B, float C) {
  float D, E;
  D = sincos((float)B * C, &E);
  return fn_A(A, (float2)(E, D));
}

__kernel void fn_C(__global const float2* A, __global float2* B, unsigned int C) {
  const uint D = get_global_id(0);

  const uint E = get_global_size(0);
  const uint F = 2 * E;
  const uint G = D & (C - 1);
  const uint H = ((D - G) << 1) + G;

  float2 I = A[D];
  float2 J = A[D + E];

  float K = -3.14159265359f * (float)G / (float)C;

  J = fn_B(J, 1, K);

  {
    float2 L = I - J;
    I = I + J;
    J = L;
  };

  B[H] = I;
  B[H + C] = J;
}