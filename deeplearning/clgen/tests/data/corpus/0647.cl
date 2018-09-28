kernel void fn_A(local int* A, local int* B, int C) {
  local int* D;
  int E = get_local_id(0);
  if (C)
    D = B + 3;
  else
    D = A + 12;
  A[E] = atomic_add(D, 1);
}