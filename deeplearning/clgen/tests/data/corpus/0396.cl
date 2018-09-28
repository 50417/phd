kernel void fn_A(global int* A, unsigned int B, global int* C, unsigned int D, unsigned int E, unsigned int F, unsigned int G) {
  int H = get_global_id(0);
  if (H > E - 1)
    return;

  if (H == 0) {
    C[D] = (C[D] & F) | (A[B] & (~F));
  } else if (H == E - 1) {
    C[H + D] = (A[H + B] & G) | (C[H + D] & (~G));
  } else {
    C[H + D] = A[H + B];
  }
}