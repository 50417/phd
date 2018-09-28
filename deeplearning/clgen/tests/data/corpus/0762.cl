__kernel void fn_A(__global const float4* A, __global float4* B, int C, int D) {
  const int E = get_global_id(0) * (C + 2 * D) + (D + get_global_id(1));

  const int F = get_global_id(0) * C + get_global_id(1);
  int G;
  float4 H;
  float4 I;

  H = (float4)(-0x1.fffffep127f);

  if (get_global_id(1) < C) {
    for (G = -D; G <= D; G++) {
      I = A[E + G];
      H = H < I ? I : H;
    }
    B[F] = H;
  }
}

__kernel void fn_B(__global const float4* A, __global float4* B, int C, int D) {
  const int E = get_global_id(0) * C + get_global_id(1);
  int F = E;
  int G;
  float4 H;
  float4 I;

  H = (float4)(-0x1.fffffep127f);

  if (get_global_id(1) < C) {
    for (G = -D; G <= D; G++) {
      I = A[F];
      H = H < I ? I : H;
      F += C;
    }
    B[E] = H;
  }
}