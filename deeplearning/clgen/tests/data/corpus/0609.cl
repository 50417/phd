typedef float2 magmaFloatComplex; __kernel void fn_A(int A, int B, __global magmaFloatComplex* C, int D, int E, __global magmaFloatComplex* F, int G, int H) {
  int I = get_group_id(0) * 64 + get_local_id(0);
  if (I < A) {
    C += (D + I);
    F += (G + I);
    __global magmaFloatComplex* J = C + E * B;
    while (C < J) {
      *F = *C;
      C += E;
      F += H;
    }
  }
}