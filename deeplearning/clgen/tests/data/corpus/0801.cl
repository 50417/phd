__kernel void fn_A(void) {
  int A = get_global_id(0);

  printf("%d: ", A);
  for (int B = 0; B < A; ++B)
    printf("%d ", B);
  printf("\n");
}