__kernel void fn_A(char16 A, __global char* B, int C, __local int* D, __global int* E) {
  char16 F, G;

  D[0] = 0;
  D[1] = 0;
  D[2] = 0;
  D[3] = 0;

  barrier(1);

  int H = get_global_id(0) * C;

  for (int I = H; I < H + C; I++) {
    F = vload16(0, B + I);

    G = F == A;

    if (all(G.s0123))
      atomic_add(D, 1);

    if (all(G.s4567))
      atomic_add(D + 1, 1);

    if (all(G.s89AB))
      atomic_add(D + 2, 1);

    if (all(G.sCDEF))
      atomic_add(D + 3, 1);
  }

  barrier(2);

  if (get_local_id(0) == 0) {
    atomic_add(E, D[0]);
    atomic_add(E + 1, D[1]);
    atomic_add(E + 2, D[2]);
    atomic_add(E + 3, D[3]);
  }
}