kernel void fn_A(global float* A, global float* B, global float* C, global float* D) {
  int E = get_global_id(0);
  const float F = B[E], G = C[E], H = D[E];
  switch (E) {
    case 0:
      A[E] = mad(F, G, H);
      break;
    case 1:
      A[E] = __clc_fma(F, G, H);
      break;
    default:
      A[E] = 1.f;
      break;
  };
}