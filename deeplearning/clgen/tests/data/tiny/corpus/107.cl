__kernel void A(__global char* a, __global char* b, __global char* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void B(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void C(__global short* a, __global short* b, __global short* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void D(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void E(__global int* a, __global int* b, __global int* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void F(__global uint* a, __global uint* b, __global uint* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] - b[d];
}
__kernel void G(__global char* a, __global char* b, __global char* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void H(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void I(__global short* a, __global short* b, __global short* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void J(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void K(__global int* a, __global int* b, __global int* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void L(__global uint* a, __global uint* b, __global uint* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] + b[d];
}
__kernel void M(__global char* a, __global char* b, __global char* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void N(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void O(__global short* a, __global short* b, __global short* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void P(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void Q(__global int* a, __global int* b, __global int* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void R(__global uint* a, __global uint* b, __global uint* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] * b[d];
}
__kernel void S(__global char* a, __global char* b, __global char* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void T(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void U(__global short* a, __global short* b, __global short* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void V(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void W(__global int* a, __global int* b, __global int* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void X(__global uint* a, __global uint* b, __global uint* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] / b[d];
}
__kernel void Y(__global char* a, __global char* b, __global char* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}
__kernel void Z(__global uchar* a, __global uchar* b, __global uchar* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}
__kernel void AA(__global short* a, __global short* b, __global short* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}
__kernel void AB(__global ushort* a, __global ushort* b, __global ushort* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}
__kernel void AC(__global int* a, __global int* b, __global int* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}
__kernel void AD(__global uint* a, __global uint* b, __global uint* c) {
  int d = (int)get_global_id(0);
  c[d] = a[d] % b[d];
}