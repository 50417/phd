void fn_A(__global uchar* A, int4 B, int4 C, float D) {
  A[B.x + B.y * C.x + B.z * C.x * C.y] = convert_uchar_sat_rte(D * 255.f);
}

void fn_B(__global uchar* A, int4 B, int4 C, uchar D) {
  A[B.x + B.y * C.x + B.z * C.x * C.y] = D;
}

void fn_C(__global half* A, int4 B, int4 C, float D) {
  vstore_half(D, B.x + B.y * C.x + B.z * C.x * C.y, A);
}

void fn_D(__global float* A, int4 B, int4 C, float D) {
  A[B.x + B.y * C.x + B.z * C.x * C.y] = D;
}

void fn_E(__global ushort2* A, int4 B, int4 C, float2 D) {
  A[B.x + B.y * C.x + B.z * C.x * C.y] = convert_ushort2_sat_rte(D * 65535.f);
}

void fn_F(__global half* A, int4 B, int4 C, float4 D) {
  vstore_half4(D, B.x + B.y * C.x + B.z * C.x * C.y, A);
}

void fn_G(__global float4* A, int4 B, int4 C, float4 D) {
  A[B.x + B.y * C.x + B.z * C.x * C.y] = D;
}