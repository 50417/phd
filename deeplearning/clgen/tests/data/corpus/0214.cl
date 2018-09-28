kernel void fn_A(global ulong* A, global ulong* B) {
  __global ulong* C = &A[get_global_id(0)];
  __global ulong* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_B(global uint* A, global uint* B) {
  __global uint* C = &A[get_global_id(0)];
  __global uint* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_C(global ushort* A, global ushort* B) {
  __global ushort* C = &A[get_global_id(0)];
  __global ushort* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_D(global uchar* A, global uchar* B) {
  __global uchar* C = &A[get_global_id(0)];
  __global uchar* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_E(global long* A, global long* B) {
  __global long* C = &A[get_global_id(0)];
  __global long* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_F(global int* A, global int* B) {
  __global int* C = &A[get_global_id(0)];
  __global int* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_G(global short* A, global short* B) {
  __global short* C = &A[get_global_id(0)];
  __global short* D = &B[get_global_id(0)];
  *D = clz(*C);
}
kernel void fn_H(global char* A, global char* B) {
  __global char* C = &A[get_global_id(0)];
  __global char* D = &B[get_global_id(0)];
  *D = clz(*C);
}