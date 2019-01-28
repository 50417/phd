__kernel void A(__global float* a) {
  int b = get_global_id(0);
  float c = a[b] * a[b];
  a[b] = c;
}

__kernel void B(__global int* a, __global int* d) {
  int b = get_global_id(0);

  atomic_add(&d[a[b]], 1);
}

__kernel void C(__global int* a, __global int* d, __local int* e, const int f) {
  int b = get_global_id(0);
  int g = get_local_id(0);

  if (g < f) {
    e[g] = 0;
  }
  barrier(1);

  atomic_add(&e[a[b]], 1);

  barrier(1);

  if (g < f) {
    d[g] = e[g];
  }
}

__kernel void D(__global float* a) {
  int b = get_global_id(0);

  for (unsigned int h = get_global_size(0) / 2; h > 0; h >>= 1) {
    if (b < h) {
      a[b] = max(a[b], a[b + h]);
    }
    barrier(2);
  }
}

__kernel void E(__global int* a) {
  int b = get_global_id(0);
  a[b] = (b > 0) ? a[b - 1] : 0;
  barrier(2);

  for (int h = 1; h < get_global_size(0); h *= 2) {
    int i = a[b];
    if (b + h < get_global_size(0)) {
      a[b + h] += i;
    }
    barrier(2);
  }
  if (b == 0) {
    a[0] = 0;
  }
}

__kernel void F(__global int* a, __global int* j) {
  int b = get_global_id(0);
  int k = a[b] < 50 ? 1 : 0;
  j[b] = k;
}

__kernel void G(__global int* j, __global int* l) {
  int b = get_global_id(0);
  l[b] = (b > 0) ? j[b - 1] : 0;
  barrier(2);

  for (int h = 1; h < get_global_size(0); h *= 2) {
    int i = l[b];
    if (b + h < get_global_size(0)) {
      l[b + h] += i;
    }
    barrier(2);
  }
  if (b == 0) {
    l[0] = 0;
  }
}

__kernel void H(__global int* a, __global int* j, __global int* l) {
  int b = get_global_id(0);
  int m = a[b];
  barrier(2);
  if (j[b] == 1) {
    a[l[b]] = m;
  }
}