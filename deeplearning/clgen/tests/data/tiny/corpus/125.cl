uint4 A(int a) {
  const uint b = get_local_id(0);
  const uint c = get_global_id(0) / get_local_size(0);
  const uint d = get_local_size(0);

  uint2 e;
  e.x = a + b;
  e.y = e.x + d;

  uint2 f;
  f.x = b;
  f.y = b + d;

  fid B(__local float* g, __global const float* h, const uint4 i, const uint j) {
    const uint k = i.x;
    const uint l = i.y;

    const uint m = i.z;
    const uint n = i.w;

    const uint o = ((m) >> (4));
    const uint p = ((n) >> (4));

    g[m + o] = h[k];
    g[n + p] = h[l];
  }

  void C(__local float* g, __global const float* h, const uint4 i, const uint j) {
    const uint k = i.x;
    const uint l = i.y;

    const uint m = i.z;
    const uint n = i.w;

    const uint o = ((m) >> (4));
    const uint p = ((n) >> (4));

    g[m + o] = h[k];
    g[n + p] = (n < j) ? h[l] : 0;

    barrier(1);
  }

  void D(__global float* q, __local const float* g, const uint4 i, const uint j) {
    barrier(1);

    const uint k = i.x;
    const uint l = i.y;

    const uint m = i.z;
    const uint n = i.w;

    const uint o = ((m) >> (4));
    const uint p = ((n) >> (4));

    q[k] = g[m + o];
    q[l] = g[n + p];
  }

  void E(__global float* q, __local const float* g, const uint4 i, const uint j) {
    barrier(1);

    const uint k = i.x;
    const uint l = i.y;

    const uint m = i.z;
    const uint n = i.w;

    const uint o = ((m) >> (4));
    const uint p = ((n) >> (4));

    q[k] = g[m + o];
    if (n < j)
      q[l] = g[n + p];
  }

  void F(__local float* g, int r) {
    const uint b = get_local_id(0);
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    if (b == 0) {
      int a = (d << 1) - 1;
      a += ((a) >> (4));
      g[a] = 0;
    }
  }

  void G(__local float* g, __global float* s, int r) {
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);
    const uint b = get_local_id(0);

    if (b == 0) {
      int a = (d << 1) - 1;
      a += ((a) >> (4));
      s[r] = g[a];
      g[a] = 0;
    }
  }

  uint H(__local float* g) {
    const uint b = get_local_id(0);
    const uint d = get_local_size(0);
    const uint t = 2;
    uint u = 1;

    for (uint v = d; v > 0; v >>= 1) {
      barrier(1);

      if (b < v) {
        int w = mul24(mul24(t, u), b);

        uint m = w + u - 1;
        uint n = m + u;

        m += ((m) >> (4));
        n += ((n) >> (4));

        g[n] += g[m];
      }

      u *= t;
    }

    return u;
  }

  void I(__local float* g, uint u) {
    const uint b = get_local_id(0);
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);
    const uint t = 2;

    for (uint v = 1; v <= d; v *= t) {
      u >>= 1;

      barrier(1);

      if (b < v) {
        int w = mul24(mul24(t, u), b);

        uint m = w + u - 1;
        uint n = m + u;

        m += ((m) >> (4));
        n += ((n) >> (4));

        float x = g[m];
        g[m] = g[n];
        g[n] += x;
      }
    }
  }

  void J(__local float* g, int r) {
    const uint c = get_global_id(0) / get_local_size(0);

    int u = H(g);
    F(g, (r == 0) ? c : r);
    I(g, u);
  }

  void K(__global float* s, __local float* g, int r) {
    const uint c = get_global_id(0) / get_local_size(0);

    int u = H(g);
    G(g, s, (r == 0) ? c : r);
    I(g, u);
  }

  __kernel void L(__global float* q, __global const float* h, __local float* g, const uint r, const uint y, const uint j) {
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    uint f = (y == 0) ? mul24(c, (d << 1)) : y;
    uint4 i = A(f);

    B(g, h, i, j);
    J(g, r);
    D(q, g, i, j);
  }

  __kernel void M(__global float* q, __global const float* h, __global float* s, __local float* g, const uint r, const uint y, const uint j) {
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    uint f = (y == 0) ? mul24(c, (d << 1)) : y;
    uint4 i = A(f);

    B(g, h, i, j);
    K(s, g, r);
    D(q, g, i, j);
  }

  __kernel void N(__global float* q, __global const float* h, __global float* s, __local float* g, const uint r, const uint y, const uint j) {
    const uint b = get_local_id(0);
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    uint f = (y == 0) ? mul24(c, (d << 1)) : y;
    uint4 i = A(f);

    C(g, h, i, j);
    K(s, g, r);
    E(q, g, i, j);
  }

  __kernel void O(__global float* q, __global const float* h, __local float* g, const uint r, const uint y, const uint j) {
    const uint b = get_local_id(0);
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    uint f = (y == 0) ? mul24(c, (d << 1)) : y;
    uint4 i = A(f);

    C(g, h, i, j);
    J(g, r);
    E(q, g, i, j);
  }

  __kernel void P(__global float* q, __global float* h, __local float* g, const uint z, const uint y, const uint j) {
    const uint b = get_local_id(0);
    const uint c = get_global_id(0) / get_local_size(0);
    const uint d = get_local_size(0);

    if (b == 0)
      g[0] = h[c + z];

    barrier(1);

    uint aa = mul24(c, (d << 1)) + y + b;

    q[aa] += g[0];
    if ((b + d) < j)
      q[aa + d] += g[0];
  }