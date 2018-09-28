__kernel void fn_A(__global uchar4* A, __global unsigned int* B, __local uchar4* C, int D, int E, int F, float G) {
  int H = get_global_id(0);
  int I = get_global_id(1) - 1;
  int J = I * (int)get_global_size(0) + H;

  int K = (int)get_local_id(1) * D + get_local_id(0) + 1;

  if ((I > -1) && (I < F) && (H < E)) {
    C[K] = A[J];
  } else {
    C[K] = (uchar4)0;
  }

  if (get_local_id(1) < 2) {
    K += (int)get_local_size(1) * D;

    if (((I + get_local_size(1)) < F) && (H < E)) {
      C[K] = A[J + get_local_size(1) * get_global_size(0)];
    } else {
      C[K] = (uchar4)0;
    }
  }

  if (get_local_id(0) == (get_local_size(0) - 1)) {
    K = (int)get_local_id(1) * D;

    if ((I > -1) && (I < F) && (get_group_id(0) > 0)) {
      C[K] = A[I * (int)get_global_size(0) + get_group_id(0) * get_local_size(0) - 1];
    } else {
      C[K] = (uchar4)0;
    }

    if (get_local_id(1) < 2) {
      K += (int)get_local_size(1) * D;

      if (((I + get_local_size(1)) < F) && (get_group_id(0) > 0)) {
        C[K] = A[(I + (int)get_local_size(1)) * (int)get_global_size(0) + get_group_id(0) * get_local_size(0) - 1];
      } else {
        C[K] = (uchar4)0;
      }
    }
  } else if (get_local_id(0) == 0) {
    K = ((int)get_local_id(1) + 1) * D - 1;

    if ((I > -1) && (I < F) && (((int)get_group_id(0) + 1) * (int)get_local_size(0) < E)) {
      C[K] = A[I * (int)get_global_size(0) + (get_group_id(0) + 1) * get_local_size(0)];
    } else {
      C[K] = (uchar4)0;
    }

    if (get_local_id(1) < 2) {
      K += ((int)get_local_size(1) * D);

      if (((I + get_local_size(1)) < F) && ((get_group_id(0) + 1) * get_local_size(0) < E)) {
        C[K] = A[(I + (int)get_local_size(1)) * (int)get_global_size(0) + (get_group_id(0) + 1) * get_local_size(0)];
      } else {
        C[K] = (uchar4)0;
      }
    }
  }

  barrier(1);

  float L = 0.0f;
  float M[3] = {0.0f, 0.0f, 0.0f};
  float N[3] = {0.0f, 0.0f, 0.0f};

  K = (int)get_local_id(1) * D + get_local_id(0);

  M[0] += (float)C[K].x;
  M[1] += (float)C[K].y;
  M[2] += (float)C[K].z;
  N[0] -= (float)C[K].x;
  N[1] -= (float)C[K].y;
  N[2] -= (float)C[K++].z;

  N[0] -= (float)(C[K].x << 1);
  N[1] -= (float)(C[K].y << 1);
  N[2] -= (float)(C[K++].z << 1);

  M[0] -= (float)C[K].x;
  M[1] -= (float)C[K].y;
  M[2] -= (float)C[K].z;
  N[0] -= (float)C[K].x;
  N[1] -= (float)C[K].y;
  N[2] -= (float)C[K].z;

  K += (D - 2);

  M[0] += (float)(C[K].x << 1);
  M[1] += (float)(C[K].y << 1);
  M[2] += (float)(C[K++].z << 1);

  K++;

  M[0] -= (float)(C[K].x << 1);
  M[1] -= (float)(C[K].y << 1);
  M[2] -= (float)(C[K].z << 1);

  K += (D - 2);

  M[0] += (float)C[K].x;
  M[1] += (float)C[K].y;
  M[2] += (float)C[K].z;
  N[0] += (float)C[K].x;
  N[1] += (float)C[K].y;
  N[2] += (float)C[K++].z;

  N[0] += (float)(C[K].x << 1);
  N[1] += (float)(C[K].y << 1);
  N[2] += (float)(C[K++].z << 1);

  M[0] -= (float)C[K].x;
  M[1] -= (float)C[K].y;
  M[2] -= (float)C[K].z;
  N[0] += (float)C[K].x;
  N[1] += (float)C[K].y;
  N[2] += (float)C[K].z;

  L = 0.30f * sqrt((M[0] * M[0]) + (N[0] * N[0]));
  L += 0.55f * sqrt((M[1] * M[1]) + (N[1] * N[1]));
  L += 0.15f * sqrt((M[2] * M[2]) + (N[2] * N[2]));

  if (L < G) {
    L = 0.0f;
  } else if (L > 255.0f) {
    L = 255.0f;
  }

  unsigned int O = 0x000000FF & (unsigned int)L;
  O |= 0x0000FF00 & (((unsigned int)L) << 8);
  O |= 0x00FF0000 & (((unsigned int)L) << 16);

  if ((I + 1 < F) && (H < E)) {
    B[J + get_global_size(0)] = O;
  }
}