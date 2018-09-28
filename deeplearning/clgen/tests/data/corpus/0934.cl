__kernel void fn_A(__global const float* A, __global float* B, const int C, __local float* D) {
  int E = ((C / 4) / get_num_groups(0)) * 4;
  int F = get_group_id(0) * E;

  int G = (get_group_id(0) == get_num_groups(0) - 1) ? C : F + E;

  int H = get_local_id(0);
  int I = F + H;

  float J = 0.0f;

  while (I < G) {
    J += A[I];
    I += get_local_size(0);
  }

  D[H] = J;
  barrier(1);

  for (unsigned int K = get_local_size(0) / 2; K > 0; K >>= 1) {
    if (H < K) {
      D[H] += D[H + K];
    }
    barrier(1);
  }

  if (H == 0) {
    B[get_group_id(0)] = D[0];
  }
}

inline float fn_B(float A, __local float* B, int C) {
  int D = get_local_id(0);
  B[D] = 0.0f;

  D += get_local_size(0);
  B[D] = A;
  barrier(1);

  float E;
  for (int F = 1; F < get_local_size(0); F *= 2) {
    E = B[D - F];
    barrier(1);
    B[D] += E;
    barrier(1);
  }
  return B[D - C];
}

__kernel void fn_C(__global float* A, const int B, __local float* C) {
  float D = 0.0f;
  if (get_local_id(0) < B) {
    D = A[get_local_id(0)];
  }

  D = fn_B(D, C, 1);

  if (get_local_id(0) < B) {
    A[get_local_id(0)] = D;
  }
}

__kernel void fn_D(__global const float* A, __global const float* B, __global float* C, const int D, __local float* E) {
  __local float F;

  __global float4* G = (__global float4*)A;
  __global float4* H = (__global float4*)C;
  int I = D / 4;

  int J = I / get_num_groups(0);
  int K = get_group_id(0) * J;

  int L = (get_group_id(0) == get_num_groups(0) - 1) ? I : K + J;

  int M = K + get_local_id(0);
  int N = K;

  float O = B[get_group_id(0)];

  while (N < L) {
    float4 P;
    if (M < L) {
      P = G[M];
    } else {
      P.x = 0.0f;
      P.y = 0.0f;
      P.z = 0.0f;
      P.w = 0.0f;
    }

    P.y += P.x;
    P.z += P.y;
    P.w += P.z;

    float Q = fn_B(P.w, E, 1);

    P.x += Q + O;
    P.y += Q + O;
    P.z += Q + O;
    P.w += Q + O;

    if (M < L) {
      H[M] = P;
    }

    if (get_local_id(0) == get_local_size(0) - 1)
      F = P.w;
    barrier(1);

    O = F;

    N += get_local_size(0);
    M += get_local_size(0);
  }
  int R = D / get_num_groups(0);
  int S = get_local_id(0) + get_group_id(0) * R;
  if (S < D - 1)
    C[S + 1] = C[S];
  if (S == 0)
    C[0] = 0;
}