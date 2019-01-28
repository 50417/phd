inline int A(int a, int b) {
  if (b == -1) {
    b = get_global_id(0);
  } else {
    b += get_global_size(0);
  }

  if (b >= a)
    b = -1;

  return b;
}

__kernel void B(__global float* c, __global const float* d, __global const float* e, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] + e[g];
    g = A(f, g);
  }
}

__kernel void C(__global float* c, __global const float* d, __global const float* e, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] - e[g];
    g = A(f, g);
  }
}

__kernel void D(__global float* c, __global const float* d, __global const float* e, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] / e[g];
    g = A(f, g);
  }
}

__kernel void E(__global float* c, __global const float* d, __global const float* e, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] * e[g];
    g = A(f, g);
  }
}

__kernel void F(__global float* c, float h, global const float* d, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h * d[g];
    g = A(f, g);
  }
}

__kernel void G(__global float* c, global const float* d, float h, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h * d[g];
    g = A(f, g);
  }
}

__kernel void H(__global float* c, global const float* d, float h, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h + d[g];
    g = A(f, g);
  }
}

__kernel void I(__global float* c, float h, global const float* d, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h + d[g];
    g = A(f, g);
  }
}

__kernel void J(__global float* c, float h, global const float* d, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h - d[g];
    g = A(f, g);
  }
}

__kernel void K(__global float* c, global const float* d, float h, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] - h;
    g = A(f, g);
  }
}

__kernel void L(__global float* c, float h, global const float* d, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = h / d[g];
    g = A(f, g);
  }
}

__kernel void M(__global float* c, global const float* d, float h, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = d[g] / h;
    g = A(f, g);
  }
}

__kernel void N(__global float* c, __global const float* d, int f) {
  int g = A(f, -1);
  while (g >= 0) {
    c[g] = exp(d[g]);
    g = A(f, g);
  }
}