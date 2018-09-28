__kernel void fn_A(__global float4* A, unsigned int B, unsigned int C, float D) {
  unsigned int E = get_global_id(0);
  unsigned int F = get_global_id(1);

  float G = E / (float)B;
  float H = F / (float)C;
  G = G * 2.0f - 1.0f;
  H = H * 2.0f - 1.0f;

  float I = 4.0f;
  float J = sin(G * I + D) * cos(H * I + D) * 0.5f;

  A[F * B + E] = (float4)(G, J, H, 1.0f);
}