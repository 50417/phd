typedef double special_func_scalar_type; special_func_scalar_type fn_A(special_func_scalar_type A, __constant const special_func_scalar_type* B, int C) {
  special_func_scalar_type D;
  int E;
  __constant const special_func_scalar_type* F;

  F = B;
  D = *F++;
  E = C;

  do
    D = D * A + *F++;
  while (--E);

  return (D);
}

special_func_scalar_type fn_B(special_func_scalar_type A, __constant const special_func_scalar_type* B, int C) {
  special_func_scalar_type D;
  __constant const special_func_scalar_type* E;
  int F;

  E = B;
  D = A + *E++;
  F = C - 1;

  do
    D = D * A + *E++;
  while (--F);

  return (D);
}

special_func_scalar_type fn_C(__constant const special_func_scalar_type* A, __constant const special_func_scalar_type* B, special_func_scalar_type C, int D) {
  special_func_scalar_type E, F;
  if (C <= 1) {
    E = A[D - 1];
    F = B[D - 1];
    for (int G = (int)D - 2; G >= 0; --G) {
      E *= C;
      F *= C;
      E += A[G];
      F += B[G];
    }
  } else {
    C = 1 / C;
    E = A[0];
    F = B[0];
    for (unsigned G = 1; G < D; ++G) {
      E *= C;
      F *= C;
      E += A[G];
      F += B[G];
    }
  }
  return E / F;
}