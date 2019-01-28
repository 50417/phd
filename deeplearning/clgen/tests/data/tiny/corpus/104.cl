kernel void A(global float* a, global float* b, local float* c) {
}
kernel void B(global float* a, global float* b, local float* c) {
  A(a, b, c);
}

__kernel void C(__global int* d, __global int* e, __global int* f, __global int* g, __global int* h, __global int* i, __global int* j, __global int* k) {
  const int l = get_global_id(0);
  d[l] = l;

  e[l] = get_work_dim();

  f[l] = get_global_size(0);

  g[l] = get_local_size(0);
  h[l] = get_local_id(0);
  i[l] = get_num_groups(0);
  j[l] = get_group_id(0);
  k[l] = get_global_offset(0);
}