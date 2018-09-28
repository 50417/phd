__kernel void fn_A(__global float* A, __global float* B, __local float* C) {
  int D = get_group_id(0);
  int E = get_group_id(1);

  int F = get_local_id(0) & ((32) - 1);
  int G = get_local_id(0) >> (5);

  int H = mad24(G, (32) + 1, F);
  int I = mad24(F, (32) + 1, G);

  int J = mad24(D, (32), F);
  int K = mad24(E, (32), G);

  int L = mad24(K, (256), J);

  int M = mad24(E, (32), F);
  int N = mad24(D, (32), G);

  int O = mad24(N, (4096) + (32), M);

  int P = (256) * (2);
  int Q = ((4096) + (32)) * (2);

  int R = (2) * ((32) + 1);
  int S = (2);

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];
  H += R;
  L += P;

  C[H] = B[L];

  barrier(1);

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
  I += S;
  O += Q;

  A[O] = C[I];
}