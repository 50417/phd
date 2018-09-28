int fn_A(int A, int B, int C, int D, int E) {
  int F, G, H, I;
  I = A % D;
  A = A / D;
  H = A % C;
  A = A / C;
  G = A % B;
  A = A / B;
  F = A;
  I = I / E;
  H = H / E;
  C /= E;
  D /= E;
  return (((F * B + G) * C) + H) * D + I;
}
int fn_B(int A, int B, int C, int D, int E, int F, int G) {
  int H, I, J, K;
  K = A % D;
  A = A / D;
  J = A % C;
  A = A / C;
  I = A % B;
  A = A / B;
  H = A;
  K = K * E + F;
  J = J * E + G;
  C *= E;
  D *= E;
  return (((H * B + I) * C) + J) * D + K;
}

kernel void fn_C(global float* A, int B, global float* C, int D, int E, int F, int G, int H, int I) {
  global float* J = A + B;
  global float* K = C + D;

  long L = get_local_id(0) + get_local_size(0) * get_group_id(0);
  L += get_local_id(1) + get_local_size(1) * (get_local_size(0) * get_num_groups(0)) * get_group_id(1);
  if (L >= E)
    return;
  int M = fn_A(L, G, H, I, F);
  K[L] = J[M];
}

kernel void fn_D(global float* A, int B, global float* C, int D, int E, int F, int G, int H, int I) {
  global float* J = A + B;
  global float* K = C + D;

  long L = get_local_id(0) + get_local_size(0) * get_group_id(0);
  L += get_local_id(1) + get_local_size(1) * (get_local_size(0) * get_num_groups(0)) * get_group_id(1);
  if (L >= E)
    return;
  for (int M = 0; M < F; M++) {
    for (int N = 0; N < F; N++) {
      int O = fn_B(L, G, H, I, F, M, N);
      J[L] += K[O];
    }
  }
}