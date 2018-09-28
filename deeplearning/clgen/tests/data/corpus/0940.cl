__kernel void fn_A(__global float* A, __global float* B, int C, int D, int E, __local float* F) {
  unsigned int G = get_global_id(0);
  unsigned int H = get_global_id(1);

  if ((G + C < D) && (H < E)) {
    unsigned int I = H * D + G + C;
    F[get_local_id(1) * (16 + 1) + get_local_id(0)] = B[I];
  }

  barrier(1);

  G = get_group_id(1) * 16 + get_local_id(0);
  H = get_group_id(0) * 16 + get_local_id(1);
  if ((G < E) && (H + C < D)) {
    unsigned int J = H * E + G;
    A[J] = F[get_local_id(0) * (16 + 1) + get_local_id(1)];
  }
}

__kernel void fn_B(__global float* A, __global float* B, int C, int D, int E) {
  unsigned int F = get_global_id(0);
  unsigned int G = get_global_id(1);

  if (F + C < D && G < E) {
    unsigned int H = F + C + D * G;
    unsigned int I = G + E * F;
    A[I] = B[H];
  }
}

__kernel void fn_C(__global float* A, __global float* B, int C, int D, int E) {
  unsigned int F = get_global_id(0);
  unsigned int G = get_global_id(1);

  if (F + C < D && G < E) {
    unsigned int H = F + C + D * G;
    A[H] = B[H];
  }
}

__kernel void fn_D(__global float* A, __global float* B, int C, int D, int E, __local float* F) {
  unsigned int G = get_global_id(0);
  unsigned int H = get_global_id(1);

  unsigned int I = H * D + G + C;
  if ((G + C < D) && (H < E)) {
    F[get_local_id(1) * (16 + 1) + get_local_id(0)] = B[I];
  }

  barrier(1);

  if ((G < E) && (H + C < D)) {
    A[I] = F[get_local_id(1) * (16 + 1) + get_local_id(0)];
  }
}

__kernel void fn_E(__global float* A, __global float* B, int C, int D, int E) {
  unsigned int F = get_global_id(0);
  unsigned int G = get_global_id(1);

  if (F + C < D && G < E) {
    unsigned int H = G + E * (F + C);
    A[H] = B[H];
  }
}