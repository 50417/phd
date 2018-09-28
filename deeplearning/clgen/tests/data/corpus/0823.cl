__kernel void fn_A(__global float8* A, __global char16* B) {
  uint8 C = (uint8)(1, 2, 0, 1, 3, 1, 2, 3);
  float4 D = (float4)(0.25f, 0.5f, 0.75f, 1.0f);
  *A = shuffle(D, C);

  uchar16 E = (uchar16)(6, 10, 5, 2, 8, 0, 9, 14, 7, 5, 12, 3, 11, 15, 1, 13);
  char8 F = (char8)('l', 'o', 'f', 'c', 'a', 'u', 's', 'f');
  char8 G = (char8)('f', 'e', 'h', 't', 'n', 'n', '2', 'i');
  *B = shuffle2(F, G, E);
}