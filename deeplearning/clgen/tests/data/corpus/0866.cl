__kernel void fn_A(__global float4* A, __global float4* B, int C) {
  __local float D[4 * 4];

  int E = get_global_id(1);
  int F = get_global_id(0);
  int G = get_local_id(0);
  int H = get_local_id(1);

  int I = get_global_size(0) + C / 4;
  int J = C % 4;

  if (get_local_id(0) == 0) {
    (J == 0) ? (D[H] = B[E * I + C / 4].s0 / B[C * I + C / 4].s0) : 1;
    (J == 1) ? (D[H] = B[E * I + C / 4].s1 / B[C * I + C / 4].s1) : 1;
    (J == 2) ? (D[H] = B[E * I + C / 4].s2 / B[C * I + C / 4].s2) : 1;
    (J == 3) ? (D[H] = B[E * I + C / 4].s3 / B[C * I + C / 4].s3) : 1;
  }

  barrier(1);

  if (E >= C + 1 && ((F + 1) * 4) > C) {
    float4 K;

    {
      K.s0 = B[E * I + F].s0 - D[H] * B[C * I + F].s0;
      K.s1 = B[E * I + F].s1 - D[H] * B[C * I + F].s1;
      K.s2 = B[E * I + F].s2 - D[H] * B[C * I + F].s2;
      K.s3 = B[E * I + F].s3 - D[H] * B[C * I + F].s3;
    }

    if (F == C / 4) {
      (J == 0) ? (A[E * I + F].s0 = D[H]) : (B[E * I + F].s0 = K.s0);
      (J == 1) ? (A[E * I + F].s1 = D[H]) : (B[E * I + F].s1 = K.s1);
      (J == 2) ? (A[E * I + F].s2 = D[H]) : (B[E * I + F].s2 = K.s2);
      (J == 3) ? (A[E * I + F].s3 = D[H]) : (B[E * I + F].s3 = K.s3);
    } else {
      B[E * I + F].s0 = K.s0;
      B[E * I + F].s1 = K.s1;
      B[E * I + F].s2 = K.s2;
      B[E * I + F].s3 = K.s3;
    }
  }
}
__kernel void fn_B(__global float* A, __global float* B) {
  int C = get_global_id(1);
  int D = get_global_id(0);
  int E = get_group_id(0);
  int F = get_group_id(1);
  int G = get_global_size(0);
  if (C > D) {
    int G = get_global_size(0);
    B[C * G + D] = A[C * G + D];
  }
}