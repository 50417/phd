void A(__local double* a) {
  for (unsigned int b = get_local_size(0) / 2; b > 0; b /= 2) {
    barrier(1);
    if (get_local_id(0) < b)
      a[get_local_id(0)] += a[get_local_id(0) + b];
  }
}

void B(__local double* a, int c) {
  for (unsigned int b = c / 2; b > 0; b /= 2) {
    barrier(1);
    if (get_local_id(0) < b)
      a[get_local_id(0)] += a[get_local_id(0) + b];
  }
}

__kernel void C(__global double* d, __global double* e, const int c) {
  __local double a[256];
  a[get_local_id(0)] = (get_local_id(0) < c) ? d[get_local_id(0)] : 0;
  A(a);
  if (get_local_id(0) == 0)
    e[0] = a[0];
}

__kernel void D(__global double* f, const double g, __global double* h, const double i, __global double* j) {
  int k = get_global_id(0);

  double l = h[k];

  double m = j[k];
  double n;

  n = l * m;

  f[k] = n;
}

__kernel void E(__global double* f, __global double* h) {
  int k = get_global_id(0);

  double l = h[k];

  double n;

  n = sqrt(l);

  f[k] = n;
}

__kernel void F(__global double* f, const double g, __global double* h, const double i, __global double* j) {
  int k = get_global_id(0);

  double l = h[k];

  double m = j[k];

  double n;

  n = g * l + i * m;

  f[k] = n;
}

__kernel void G(__global double* j, __global double* o, __global double* p, const int q) {
  __local double r;

  int k = get_global_id(0);

  int s = get_global_size(0);

  double t = p[0] * o[k];

  for (int b = 1; b < q; b++) {
    r = p[b];
    t += r * o[b * s + k];
  }

  j[k] = t;
}
__kernel void H(__global double* o, __global double* u, __global double* v) {
  __local double a[256];
  int k = get_global_id(0);
  int w = get_local_id(0);
  int x = get_group_id(0);
  double h = o[k];
  double j = u[k];
  a[w] = h * j;

  A(a);
  barrier(1);

  if (w == 0)
    v[x] = a[0];
}

__kernel void I(__global int* q, __global double* y, __global int* z, __global double* p, __global double* j) {
  __local int aa[256 + 1];

  event_t ab = async_work_group_copy(aa, &z[get_group_id(0) * get_local_size(0)], get_local_size(0) + 1, 0);

  int k = get_global_id(0);
  int w = get_local_id(0);

  double ac = 0;
  wait_group_events(1, &ab);

  for (int b = aa[w]; b < aa[w + 1]; b++) {
    ac += y[b] * p[q[b]];
  }
  j[k] = ac;
}