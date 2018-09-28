__kernel void fn_A(__global int* A, __global int* B) {
  int C[16];
  int D[16];
  for (int E = 0; E < 16; ++E)
    D[E] = E;
  for (int E = 0; E < 16; ++E)
    C[E] = E + 1;
  if (get_global_id(0) == 15)
    B[get_global_id(0)] = C[get_global_id(0)];
  else
    B[get_global_id(0)] = D[15 - get_global_id(0)];
}