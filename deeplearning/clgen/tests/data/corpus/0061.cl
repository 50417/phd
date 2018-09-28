__kernel void fn_A(__global unsigned long* A, __global unsigned long* B, const unsigned long C, const unsigned long D) {
  unsigned int E = get_global_id(0);
  int F = E * D;
  int G = F + D;
  int H = 0;
  if (G > C)
    G = C;
  for (int I = F; I < G; I++)
    H += A[I];
  B[E] = H;
}