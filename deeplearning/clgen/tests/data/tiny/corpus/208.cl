inline uint A(uint a, __local uint* b, uint c) {
  uint d = 2 * get_local_id(0) - (get_local_id(0) & (c - 1));
  b[d] = 0;
  d += c;
  b[d] = a;

  for (uint e = 1; e < c; e <<= 1) {
    barrier(1);
    uint f = b[d] + b[d - e];
    barrier(1);
    b[d] = f;
  }

  return b[d];
}

inline uint B(uint a, __local uint* b, uint c) {
  return A(a, b, c) - a;
}
inline uint4 C(uint4 g, __local uint* b, uint c) {
  g.y += g.x;
  g.z += g.y;
  g.w += g.z;

  uint h = A(g.w, b, c / 4) - g.w;

  return (g + (uint4)h);
}

inline uint4 D(uint4 g, __local uint* b, uint c) {
  return C(g, b, c) - g;
}

__kernel void E(__global uint4* i, __global uint4* j, __local uint* b, uint c) {
  uint4 k = j[get_global_id(0)];

  uint4 l = D(k, b, c);

  i[get_global_id(0)] = l;
}

__kernel void F(__global uint* m, __global uint* i, __global uint* j, __local uint* b, uint n, uint o) {
  uint p = 0;
  if (get_global_id(0) < n)
    p = i[(4 * 256 - 1) + (4 * 256) * get_global_id(0)] + j[(4 * 256 - 1) + (4 * 256) * get_global_id(0)];

  uint q = B(p, b, o);

  if (get_global_id(0) < n)
    m[get_global_id(0)] = q;
}

__kernel void G(__global uint4* r, __global uint* m) {
  __local uint s[1];

  uint4 g = r[get_global_id(0)];

  if (get_local_id(0) == 0)
    s[0] = m[get_group_id(0)];

  barrier(1);
  g += (uint4)s[0];
  r[get_global_id(0)] = g;
}