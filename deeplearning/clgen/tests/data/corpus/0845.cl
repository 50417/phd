__kernel void fn_A(__global uchar4* A, __global uchar4* B) {
  uint C = get_global_id(0);
  uint D = get_global_id(1);

  uint E = get_global_size(0);
  uint F = get_global_size(1);

  int G = C + D * E;

  float4 H[9];

  if (C >= 1 && C < (E - 1) && D >= 1 && D < F - 1) {
    H[0] = convert_float4(A[G - 1 - E]);
    H[1] = convert_float4(A[G - E]);
    H[2] = convert_float4(A[G + 1 - E]);
    H[3] = convert_float4(A[G - 1]);
    H[4] = convert_float4(A[G]);
    H[5] = convert_float4(A[G + 1]);
    H[6] = convert_float4(A[G - 1 + E]);
    H[7] = convert_float4(A[G + E]);
    H[8] = convert_float4(A[G + 1 + E]);

    float4 I = (float4)(255);

    for (int J = 0; J < 9; J++) {
      I = min(I, H[J]);
    }

    B[G] = convert_uchar4(I);
  }
}