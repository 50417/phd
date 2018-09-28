float4 fn_A(const unsigned int A) {
  float4 B;
  B.x = A & 0xff;
  B.y = (A >> 8) & 0xff;
  B.z = (A >> 16) & 0xff;
  B.w = (A >> 24) & 0xff;
  return B;
}

unsigned int fn_B(const float4 A) {
  unsigned int B = 0U;
  B |= 0x000000FF & (unsigned int)A.x;
  B |= 0x0000FF00 & (((unsigned int)A.y) << 8);
  B |= 0x00FF0000 & (((unsigned int)A.z) << 16);
  B |= 0xFF000000 & (((unsigned int)A.w) << 24);
  return B;
}

__kernel void fn_C(__global const unsigned int* A, __global unsigned int* B, int C, int D, __local unsigned int* E) {
  unsigned int F = get_global_id(0);
  unsigned int G = get_global_id(1);

  if ((F < C) && (G < D)) {
    E[get_local_id(1) * (get_local_size(0) + 1) + get_local_id(0)] = A[(G * C) + F];
  }

  barrier(1);

  F = get_group_id(1) * get_local_size(1) + get_local_id(0);
  G = get_group_id(0) * get_local_size(0) + get_local_id(1);
  if ((F < D) && (G < C)) {
    B[(G * D) + F] = E[get_local_id(0) * (get_local_size(1) + 1) + get_local_id(1)];
  }
}
__kernel void fn_D(__global const unsigned int* A, __global unsigned int* B, int C, int D, float E) {
  unsigned int F = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (F >= C)
    return;

  A += F;
  B += F;

  float4 G = fn_A(*A);
  for (int H = 0; H < D; H++) {
    float4 I = fn_A(*A);
    float4 J = I + (G - I) * (float4)E;
    *B = fn_B(J);
    G = J;
    A += C;
    B += C;
  }

  A -= C;
  B -= C;

  G = fn_A(*A);
  for (int H = D - 1; H > -1; H--) {
    float4 I = fn_A(*A);
    float4 J = I + (G - I) * (float4)E;
    *B = fn_B((fn_A(*B) + J) * 0.5f);
    G = J;
    A -= C;
    B -= C;
  }
}
__kernel void fn_E(__global const unsigned int* A, __global unsigned int* B, int C, int D, float E, float F, float G, float H, float I, float J, float K, float L) {
  unsigned int M = get_group_id(0) * get_local_size(0) + get_local_id(0);
  if (M >= C)
    return;

  A += M;
  B += M;

  float4 N = (float4)0.0f;
  float4 O = (float4)0.0f;
  float4 P = (float4)0.0f;

  for (int Q = 0; Q < D; Q++) {
    float4 R = fn_A(*A);
    float4 S = (R * E) + (N * F) - (O * I) - (P * J);
    *B = fn_B(S);
    N = R;
    P = O;
    O = S;
    A += C;
    B += C;
  }

  A -= C;
  B -= C;

  float4 T = (float4)0.0f;
  float4 U = (float4)0.0f;
  float4 V = (float4)0.0f;
  float4 W = (float4)0.0f;
  for (int Q = D - 1; Q > -1; Q--) {
    float4 R = fn_A(*A);
    float4 S = (T * G) + (U * H) - (V * I) - (W * J);
    U = T;
    T = R;
    W = V;
    V = S;
    *B = fn_B(fn_A(*B) + S);
    A -= C;
    B -= C;
  }
}