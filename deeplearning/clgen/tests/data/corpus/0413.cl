__kernel void fn_A(__global char* A, __global char* B) {
  int C = get_global_id(0);
  char2 D;
  D = vload2(C, A);
  D += (char2){(char)1, (char)2};
  vstore2(D, C, B);
}
__kernel void fn_B(__global uchar* A, __global uchar* B) {
  int C = get_global_id(0);
  uchar2 D;
  D = vload2(C, A);
  D += (uchar2){(uchar)1, (uchar)2};
  vstore2(D, C, B);
}
__kernel void fn_C(__global short* A, __global short* B) {
  int C = get_global_id(0);
  short2 D;
  D = vload2(C, A);
  D += (short2){(short)1, (short)2};
  vstore2(D, C, B);
}
__kernel void fn_D(__global ushort* A, __global ushort* B) {
  int C = get_global_id(0);
  ushort2 D;
  D = vload2(C, A);
  D += (ushort2){(ushort)1, (ushort)2};
  vstore2(D, C, B);
}
__kernel void fn_E(__global int* A, __global int* B) {
  int C = get_global_id(0);
  int2 D;
  D = vload2(C, A);
  D += (int2){(int)1, (int)2};
  vstore2(D, C, B);
}
__kernel void fn_F(__global uint* A, __global uint* B) {
  int C = get_global_id(0);
  uint2 D;
  D = vload2(C, A);
  D += (uint2){(uint)1, (uint)2};
  vstore2(D, C, B);
}
__kernel void fn_G(__global float* A, __global float* B) {
  int C = get_global_id(0);
  float2 D;
  D = vload2(C, A);
  D += (float2){(float)1, (float)2};
  vstore2(D, C, B);
}
__kernel void fn_H(__global long* A, __global long* B) {
  int C = get_global_id(0);
  long2 D;
  D = vload2(C, A);
  D += (long2){(long)1, (long)2};
  vstore2(D, C, B);
}
__kernel void fn_I(__global ulong* A, __global ulong* B) {
  int C = get_global_id(0);
  ulong2 D;
  D = vload2(C, A);
  D += (ulong2){(ulong)1, (ulong)2};
  vstore2(D, C, B);
}
__kernel void fn_J(__global char* A, __global char* B) {
  int C = get_global_id(0);
  char3 D;
  D = vload3(C, A);
  D += (char3){(char)1, (char)2, (char)3};
  vstore3(D, C, B);
}
__kernel void fn_K(__global uchar* A, __global uchar* B) {
  int C = get_global_id(0);
  uchar3 D;
  D = vload3(C, A);
  D += (uchar3){(uchar)1, (uchar)2, (uchar)3};
  vstore3(D, C, B);
}
__kernel void fn_L(__global short* A, __global short* B) {
  int C = get_global_id(0);
  short3 D;
  D = vload3(C, A);
  D += (short3){(short)1, (short)2, (short)3};
  vstore3(D, C, B);
}
__kernel void fn_M(__global ushort* A, __global ushort* B) {
  int C = get_global_id(0);
  ushort3 D;
  D = vload3(C, A);
  D += (ushort3){(ushort)1, (ushort)2, (ushort)3};
  vstore3(D, C, B);
}
__kernel void fn_N(__global int* A, __global int* B) {
  int C = get_global_id(0);
  int3 D;
  D = vload3(C, A);
  D += (int3){(int)1, (int)2, (int)3};
  vstore3(D, C, B);
}
__kernel void fn_O(__global uint* A, __global uint* B) {
  int C = get_global_id(0);
  uint3 D;
  D = vload3(C, A);
  D += (uint3){(uint)1, (uint)2, (uint)3};
  vstore3(D, C, B);
}
__kernel void fn_P(__global float* A, __global float* B) {
  int C = get_global_id(0);
  float3 D;
  D = vload3(C, A);
  D += (float3){(float)1, (float)2, (float)3};
  vstore3(D, C, B);
}
__kernel void fn_Q(__global long* A, __global long* B) {
  int C = get_global_id(0);
  long3 D;
  D = vload3(C, A);
  D += (long3){(long)1, (long)2, (long)3};
  vstore3(D, C, B);
}
__kernel void fn_R(__global ulong* A, __global ulong* B) {
  int C = get_global_id(0);
  ulong3 D;
  D = vload3(C, A);
  D += (ulong3){(ulong)1, (ulong)2, (ulong)3};
  vstore3(D, C, B);
}
__kernel void fn_S(__global char* A, __global char* B) {
  int C = get_global_id(0);
  char4 D;
  D = vload4(C, A);
  D += (char4){(char)1, (char)2, (char)3, (char)4};
  vstore4(D, C, B);
}
__kernel void fn_T(__global uchar* A, __global uchar* B) {
  int C = get_global_id(0);
  uchar4 D;
  D = vload4(C, A);
  D += (uchar4){(uchar)1, (uchar)2, (uchar)3, (uchar)4};
  vstore4(D, C, B);
}
__kernel void fn_U(__global short* A, __global short* B) {
  int C = get_global_id(0);
  short4 D;
  D = vload4(C, A);
  D += (short4){(short)1, (short)2, (short)3, (short)4};
  vstore4(D, C, B);
}
__kernel void fn_V(__global ushort* A, __global ushort* B) {
  int C = get_global_id(0);
  ushort4 D;
  D = vload4(C, A);
  D += (ushort4){(ushort)1, (ushort)2, (ushort)3, (ushort)4};
  vstore4(D, C, B);
}
__kernel void fn_W(__global int* A, __global int* B) {
  int C = get_global_id(0);
  int4 D;
  D = vload4(C, A);
  D += (int4){(int)1, (int)2, (int)3, (int)4};
  vstore4(D, C, B);
}
__kernel void fn_X(__global uint* A, __global uint* B) {
  int C = get_global_id(0);
  uint4 D;
  D = vload4(C, A);
  D += (uint4){(uint)1, (uint)2, (uint)3, (uint)4};
  vstore4(D, C, B);
}
__kernel void fn_Y(__global float* A, __global float* B) {
  int C = get_global_id(0);
  float4 D;
  D = vload4(C, A);
  D += (float4){(float)1, (float)2, (float)3, (float)4};
  vstore4(D, C, B);
}
__kernel void fn_Z(__global long* A, __global long* B) {
  int C = get_global_id(0);
  long4 D;
  D = vload4(C, A);
  D += (long4){(long)1, (long)2, (long)3, (long)4};
  vstore4(D, C, B);
}
__kernel void fn_AA(__global ulong* A, __global ulong* B) {
  int C = get_global_id(0);
  ulong4 D;
  D = vload4(C, A);
  D += (ulong4){(ulong)1, (ulong)2, (ulong)3, (ulong)4};
  vstore4(D, C, B);
}
__kernel void fn_AB(__global char* A, __global char* B) {
  int C = get_global_id(0);
  char8 D;
  D = vload8(C, A);
  D += (char8){(char)1, (char)2, (char)3, (char)4, (char)5, (char)6, (char)7, (char)8};
  vstore8(D, C, B);
}
__kernel void fn_AC(__global uchar* A, __global uchar* B) {
  int C = get_global_id(0);
  uchar8 D;
  D = vload8(C, A);
  D += (uchar8){(uchar)1, (uchar)2, (uchar)3, (uchar)4, (uchar)5, (uchar)6, (uchar)7, (uchar)8};
  vstore8(D, C, B);
}
__kernel void fn_AD(__global short* A, __global short* B) {
  int C = get_global_id(0);
  short8 D;
  D = vload8(C, A);
  D += (short8){(short)1, (short)2, (short)3, (short)4, (short)5, (short)6, (short)7, (short)8};
  vstore8(D, C, B);
}
__kernel void fn_AE(__global ushort* A, __global ushort* B) {
  int C = get_global_id(0);
  ushort8 D;
  D = vload8(C, A);
  D += (ushort8){(ushort)1, (ushort)2, (ushort)3, (ushort)4, (ushort)5, (ushort)6, (ushort)7, (ushort)8};
  vstore8(D, C, B);
}
__kernel void fn_AF(__global int* A, __global int* B) {
  int C = get_global_id(0);
  int8 D;
  D = vload8(C, A);
  D += (int8){(int)1, (int)2, (int)3, (int)4, (int)5, (int)6, (int)7, (int)8};
  vstore8(D, C, B);
}
__kernel void fn_AG(__global uint* A, __global uint* B) {
  int C = get_global_id(0);
  uint8 D;
  D = vload8(C, A);
  D += (uint8){(uint)1, (uint)2, (uint)3, (uint)4, (uint)5, (uint)6, (uint)7, (uint)8};
  vstore8(D, C, B);
}
__kernel void fn_AH(__global float* A, __global float* B) {
  int C = get_global_id(0);
  float8 D;
  D = vload8(C, A);
  D += (float8){(float)1, (float)2, (float)3, (float)4, (float)5, (float)6, (float)7, (float)8};
  vstore8(D, C, B);
}
__kernel void fn_AI(__global long* A, __global long* B) {
  int C = get_global_id(0);
  long8 D;
  D = vload8(C, A);
  D += (long8){(long)1, (long)2, (long)3, (long)4, (long)5, (long)6, (long)7, (long)8};
  vstore8(D, C, B);
}
__kernel void fn_AJ(__global ulong* A, __global ulong* B) {
  int C = get_global_id(0);
  ulong8 D;
  D = vload8(C, A);
  D += (ulong8){(ulong)1, (ulong)2, (ulong)3, (ulong)4, (ulong)5, (ulong)6, (ulong)7, (ulong)8};
  vstore8(D, C, B);
}
__kernel void fn_AK(__global char* A, __global char* B) {
  int C = get_global_id(0);
  char16 D;
  D = vload16(C, A);
  D += (char16){(char)1, (char)2, (char)3, (char)4, (char)5, (char)6, (char)7, (char)8, (char)9, (char)10, (char)11, (char)12, (char)13, (char)14, (char)15, (char)16};
  vstore16(D, C, B);
}
__kernel void fn_AL(__global uchar* A, __global uchar* B) {
  int C = get_global_id(0);
  uchar16 D;
  D = vload16(C, A);
  D += (uchar16){(uchar)1, (uchar)2, (uchar)3, (uchar)4, (uchar)5, (uchar)6, (uchar)7, (uchar)8, (uchar)9, (uchar)10, (uchar)11, (uchar)12, (uchar)13, (uchar)14, (uchar)15, (uchar)16};
  vstore16(D, C, B);
}
__kernel void fn_AM(__global short* A, __global short* B) {
  int C = get_global_id(0);
  short16 D;
  D = vload16(C, A);
  D += (short16){(short)1, (short)2, (short)3, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16};
  vstore16(D, C, B);
}
__kernel void fn_AN(__global ushort* A, __global ushort* B) {
  int C = get_global_id(0);
  ushort16 D;
  D = vload16(C, A);
  D += (ushort16){(ushort)1, (ushort)2, (ushort)3, (ushort)4, (ushort)5, (ushort)6, (ushort)7, (ushort)8, (ushort)9, (ushort)10, (ushort)11, (ushort)12, (ushort)13, (ushort)14, (ushort)15, (ushort)16};
  vstore16(D, C, B);
}
__kernel void fn_AO(__global int* A, __global int* B) {
  int C = get_global_id(0);
  int16 D;
  D = vload16(C, A);
  D += (int16){(int)1, (int)2, (int)3, (int)4, (int)5, (int)6, (int)7, (int)8, (int)9, (int)10, (int)11, (int)12, (int)13, (int)14, (int)15, (int)16};
  vstore16(D, C, B);
}
__kernel void fn_AP(__global uint* A, __global uint* B) {
  int C = get_global_id(0);
  uint16 D;
  D = vload16(C, A);
  D += (uint16){(uint)1, (uint)2, (uint)3, (uint)4, (uint)5, (uint)6, (uint)7, (uint)8, (uint)9, (uint)10, (uint)11, (uint)12, (uint)13, (uint)14, (uint)15, (uint)16};
  vstore16(D, C, B);
}
__kernel void fn_AQ(__global float* A, __global float* B) {
  int C = get_global_id(0);
  float16 D;
  D = vload16(C, A);
  D += (float16){(float)1, (float)2, (float)3, (float)4, (float)5, (float)6, (float)7, (float)8, (float)9, (float)10, (float)11, (float)12, (float)13, (float)14, (float)15, (float)16};
  vstore16(D, C, B);
}
__kernel void fn_AR(__global long* A, __global long* B) {
  int C = get_global_id(0);
  long16 D;
  D = vload16(C, A);
  D += (long16){(long)1, (long)2, (long)3, (long)4, (long)5, (long)6, (long)7, (long)8, (long)9, (long)10, (long)11, (long)12, (long)13, (long)14, (long)15, (long)16};
  vstore16(D, C, B);
}
__kernel void fn_AS(__global ulong* A, __global ulong* B) {
  int C = get_global_id(0);
  ulong16 D;
  D = vload16(C, A);
  D += (ulong16){(ulong)1, (ulong)2, (ulong)3, (ulong)4, (ulong)5, (ulong)6, (ulong)7, (ulong)8, (ulong)9, (ulong)10, (ulong)11, (ulong)12, (ulong)13, (ulong)14, (ulong)15, (ulong)16};
  vstore16(D, C, B);
}