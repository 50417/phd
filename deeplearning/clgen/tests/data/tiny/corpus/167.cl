int A(__local int* a, __local int* b, __local int* c) {
  return a[get_local_id(0)] + b[get_local_id(0) + 1] + c[get_local_id(0) + 1];
}

int B(int a, __local int* d) {
  A(d, d, d);
  return 0;
}

int C(__local int* e) {
  return e[get_local_id(0)] + B(e[get_local_id(0) + 2], e);
}

int D(__local int* f) {
  C(f);
  return f[get_local_id(0)];
}

__kernel void E(__local int* f) {
  D(f);
  f[get_local_id(0) + 1] = get_local_id(0);
}