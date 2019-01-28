kernel void A(global float4* a, global float4* b, global float4* c) {
  int d = get_global_id(0);

  c[d] = a[d] * b[d];
}
kernel void B(global float4* e, global float4* c, int f) {
  int d = get_global_id(0);

  c[d] = pown(e[d], f);
}