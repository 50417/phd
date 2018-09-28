__kernel void fn_A(__global float* A, __global float* B, int C, int D, int E, int F) {
  int G = 0;
  int H = 0;
  int I = 0;
  int J = 0;

  G = get_global_id(0) > E ? E : get_global_id(0);
  H = get_global_id(1) > F ? F : get_global_id(1);

  I = C + mul24(H, E) + G;
  J = D + mul24(H, E) + G;

  float K = A[J] - A[I];

  if ((H <= F) && (G <= E)) {
    B[I] = K;
  }
}