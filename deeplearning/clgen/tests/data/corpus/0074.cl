__kernel void fn_A(void) {
  int A = (int)get_global_id(0);
  int B = (int)get_global_id(1);
  int C = (int)get_global_id(2);
  int D = (int)get_global_size(0);
  int E = (int)get_global_size(1);
  uint F = 'x';
  float G = 5.0f;
  int3 H;
  ulong I = 1004294967296;
  H.x = A;
  H.y = B;
  H.z = C;

  if (A == 0 && B == 0 && C == 0) {
    printf("--- Welcome to the printf test of %s ---\n", "Intel Beignet");
    printf("### output a char is %c\n", F);
    printf("@@@ A long value is %ld\n", I);
  }

  for (int J = 0; J < D / 2; J++)
    for (int K = 0; K < E / 2; K++)
      if (A == 0 && B == 0 && C == 0)
        printf("loops: i = %d, j = %d\n", J, K);

  if (A == 0) {
    if (B == 0) {
      if (C % 2 == 0)
        printf("!!! output a float is %f\n", G);
      else
        printf("!!! output a float to int is %d\n", G);
    }
  }

  if (A % 15 == 0)
    if (B % 3 == 0)
      if (C % 7 == 0)
        printf("######## global_id(x, y, z) = %v3d, global_size(d0, d1, d3) = (%d, %d, %d)\n", H, get_global_size(0), get_global_size(1), get_global_size(2));

  if (A == 0 && B == 0 && C == 0) {
    printf("--- End to the printf test ---\n");
  }
}