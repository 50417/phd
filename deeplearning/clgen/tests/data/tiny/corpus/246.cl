typedef unsigned char(uchar); __kernel void A(__global uchar* a, __local uchar* b, __global uchar* c) {
  uchar* d = a[get_global_id(0)];
  b[get_local_id(0)] = d;
  barrier(1);

  int e;
  uchar** f;

  if (get_local_id(0) == 0) {
    for (e = 0; e < get_local_size(0); e++) {
      f += b[e];
    }
    c[get_group_id(0)] += f;
  }
}

__kernel void B(__global uchar* a, __local uchar* b, __global uchar* c) {
  uchar* d = a[get_global_id(0)];
  b[get_local_id(0)] = d;
  barrier(1);

  int e;
  uchar** f;

  if (get_local_id(0) == 0) {
    for (e = 0; e < get_local_size(0); e++) {
      f += b[e];
    }
    c[get_group_id(0)] += f;
  }
}

__kernel void C(__global uchar* a, __local uchar* b, __global uchar* c) {
  uchar* d = a[get_global_id(0)];
  b[get_local_id(0)] = d;
  barrier(1);

  int e;
  uchar** f;

  if (get_local_id(0) == 0) {
    for (e = 0; e < get_local_size(0); e++) {
      f += b[e];
    }
    c[get_group_id(0)] += f;
  }
}