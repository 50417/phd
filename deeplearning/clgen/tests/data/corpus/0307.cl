typedef short int16_t; typedef int int32_t; typedef unsigned int uint32_t; typedef unsigned char uint8_t; typedef signed char int8_t; typedef unsigned short uint16_t; typedef uint8_t Prob; typedef int8_t tree_index; typedef const tree_index Tree[]; typedef enum { are16x16 = 0, are8x8 = 1, are4x4 = 2 } partition_mode;

typedef enum { intra_segment = 0, UQ_segment = 0, HQ_segment = 1, AQ_segment = 2, LQ_segment = 3 } segment_ids;

typedef enum { LAST = 0, GOLDEN = 1, ALTREF = 2 } ref_frame;

typedef struct {
  int16_t coeffs[25][16];
  int32_t vector_x[4];
  int32_t vector_y[4];
  float SSIM;
  int non_zero_coeffs;
  int parts;
  int reference_frame;
  segment_ids segment_id;
} macroblock;

typedef struct {
  int y_ac_i;
  int y_dc_idelta;
  int y2_dc_idelta;
  int y2_ac_idelta;
  int uv_dc_idelta;
  int uv_ac_idelta;
  int loop_filter_level;
  int mbedge_limit;
  int sub_bedge_limit;
  int interior_limit;
  int hev_threshold;
} segment_data;

typedef struct {
  __global uint8_t* output;
  uint32_t range;
  uint32_t bottom;
  int32_t bit_count;
  uint32_t count;
} vp8_bool_encoder;

void fn_A(vp8_bool_encoder* A, __global uint8_t* B) {
  A->output = B;
  A->range = 255;
  A->bottom = 0;
  A->bit_count = 24;
  A->count = 0;
}

void fn_B(__global uint8_t* A) {
  while (*--A == 255)
    *A = 0;
  ++*A;
}

void fn_C(vp8_bool_encoder* A, int B, int C) {
  uint32_t D = 1 + (((A->range - 1) * B) >> 8);
  if (C) {
    A->bottom += D;
    A->range -= D;
  } else
    A->range = D;
  while (A->range < 128) {
    A->range <<= 1;
    if (A->bottom & ((uint32_t)1 << 31)) {
      fn_B(A->output);
    }
    A->bottom <<= 1;
    if (!--A->bit_count) {
      *A->output++ = (uint8_t)(A->bottom >> 24);
      A->count++;
      A->bottom &= (1 << 24) - 1;
      A->bit_count = 8;
    }
  }
}

void fn_D(vp8_bool_encoder* A, int B) {
  fn_C(A, 128, (B) ? 1 : 0);
}

void fn_E(vp8_bool_encoder* A, int B, int C) {
  int D = 1 << (C - 1);
  while (D) {
    fn_D(A, !((B & D) == 0));
    D >>= 1;
  }
}

void fn_F(vp8_bool_encoder* A) {
  int B = A->bit_count;
  uint32_t C = A->bottom;
  if (C & (1 << (32 - B)))
    fn_B(A->output);
  C <<= B & 7;
  B >>= 3;
  while (--B >= 0)
    C <<= 8;
  B = 4;
  while (--B >= 0) {
    *A->output++ = (uint8_t)(C >> 24);
    A->count++;
    C <<= 8;
  }
}

typedef enum { DCT_0, DCT_1, DCT_2, DCT_3, DCT_4, dct_cat1, dct_cat2, dct_cat3, dct_cat4, dct_cat5, dct_cat6, dct_eob, num_dct_tokens } dct_token;
typedef struct {
  int sign;
  int bits;
  int size;
  int extra_bits;
  int extra_size;
  __constant Prob* pcat;
} token;

__constant tree_index gb_A[2 * (num_dct_tokens - 1)] = {-dct_eob, 2, -DCT_0, 4, -DCT_1, 6, 8, 12, -DCT_2, 10, -DCT_3, -DCT_4, 14, 16, -dct_cat1, -dct_cat2, 18, 20, -dct_cat3, -dct_cat4, -dct_cat5, -dct_cat6};
__constant Prob gb_B[] = {159, 0};
__constant Prob gb_C[] = {165, 145, 0};
__constant Prob gb_D[] = {173, 148, 140, 0};
__constant Prob gb_E[] = {176, 155, 140, 135, 0};
__constant Prob gb_F[] = {180, 157, 141, 134, 130, 0};
__constant Prob gb_G[] = {254, 254, 243, 230, 196, 177, 153, 140, 133, 130, 129, 0};
__constant int gb_H[16] = {0, 1, 2, 3, 6, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7};

void fn_G(vp8_bool_encoder* A, __global uint* B, int C, int D, token* E, int F, uchar G) {
  int H;
  tree_index I;

  int J = ((F == 0) ? 1 : 0);
  int K = 0;

  for (; J < 16; ++J) {
    H = gb_H[J];

    if (K) {
      I = 2;
      --(E[J].size);
    } else
      I = 0;

    do {
      const int L = (E[J].bits >> (--(E[J].size))) & 1;
      fn_C(A, (uchar)B[(((F << 3) + H) * 3 + G) * 11 + (I >> 1)], L);
      I = gb_A[I + L];
    } while (E[J].size);

    if (E[J].bits == 0)
      return;

    if (E[J].extra_size > 0) {
      int M = 1 << (E[J].extra_size - 1);
      int N = 0;
      while (E[J].pcat[N]) {
        fn_C(A, E[J].pcat[N], (E[J].extra_bits & M) ? 1 : 0);
        ++N;
        M >>= 1;
      }
    }

    G = 2;
    if (E[J].bits == 6)
      G = 1;
    if (E[J].bits == 2) {
      K = 1;
      G = 0;
    } else {
      fn_C(A, 128, E[J].sign);
      K = 0;
    }
  }

  return;
}

void fn_H(__global macroblock* A, int B, int C, token D[16]) {
  int E = 0;
  int F;
  for (F = 15; F >= 0; --F) {
    int G = (int)A[B].coeffs[C][F];
    D[F].sign = (G < 0) ? 1 : 0;
    G = (G < 0) ? -G : G;
    D[F].extra_bits = 0;
    D[F].extra_size = 0;
    D[F].pcat = gb_B;
    if (G == 0) {
      if (E == 0) {
        D[F].bits = 0;
        D[F].size = 1;
      } else {
        D[F].bits = 2;
        D[F].size = 2;
      }
    } else if (G == 1) {
      D[F].bits = 6;
      D[F].size = 3;
    } else if (G == 2) {
      D[F].bits = 28;
      D[F].size = 5;
    } else if (G == 3) {
      D[F].bits = 58;
      D[F].size = 6;
    } else if (G == 4) {
      D[F].bits = 59;
      D[F].size = 6;
    } else if (G <= 6) {
      D[F].bits = 60;
      D[F].size = 6;
      D[F].extra_bits = G - 5;
      D[F].extra_size = 1;

    } else if (G <= 10) {
      D[F].bits = 61;
      D[F].size = 6;
      D[F].extra_bits = G - 7;
      D[F].extra_size = 2;
      D[F].pcat = gb_C;
    } else if (G <= 18) {
      D[F].bits = 124;
      D[F].size = 7;
      D[F].extra_bits = G - 11;
      D[F].extra_size = 3;
      D[F].pcat = gb_D;
    } else if (G <= 34) {
      D[F].bits = 125;
      D[F].size = 7;
      D[F].extra_bits = G - 19;
      D[F].extra_size = 4;
      D[F].pcat = gb_E;
    } else if (G <= 66) {
      D[F].bits = 126;
      D[F].size = 7;
      D[F].extra_bits = G - 35;
      D[F].extra_size = 5;
      D[F].pcat = gb_F;
    } else {
      D[F].bits = 127;
      D[F].size = 7;
      D[F].extra_bits = G - 67;
      D[F].extra_size = 11;
      D[F].pcat = gb_G;
    }
    E = D[F].bits;
  }
  return;
}

__kernel void fn_I(__global macroblock* A, __global uchar* B, __global int* C, __global uchar* D, __global uint* E, __global uint* F, int G, int H, int I, int J, int K, int L) {
  int M = get_global_id(0);
  int N, O, P, Q;
  int R;
  vp8_bool_encoder S[1];

  token T[16];

  fn_A(S, B + K * M);

  for (N = M; N < G; N += I) {
    for (P = 0; P < H; ++P) {
      O = P + N * H;
      if (A[O].non_zero_coeffs == 0)
        continue;
      if (A[O].parts == are16x16) {
        R = 1;
        fn_H(A, O, 24, T);
        fn_G(S, E, O, 24, T, R, *(D + O * 25 + 24));
        R = 0;
      } else {
        R = 3;
      }

      for (Q = 0; Q < 16; ++Q) {
        fn_H(A, O, Q, T);
        fn_G(S, E, O, Q, T, R, *(D + O * 25 + Q));
      }

      R = 2;
      for (Q = 16; Q < 20; ++Q) {
        fn_H(A, O, Q, T);
        fn_G(S, E, O, Q, T, R, *(D + O * 25 + Q));
      }

      for (Q = 20; Q < 24; ++Q) {
        fn_H(A, O, Q, T);
        fn_G(S, E, O, Q, T, R, *(D + O * 25 + Q));
      }
    }
  }
  fn_F(S);
  C[M] = S->count;

  return;
}

void fn_J(__global macroblock* A, int B, int C, token D[16]) {
  int E = 0;
  int F;
  for (F = 15; F >= 0; --F) {
    int G = (int)A[B].coeffs[C][F];
    G = (G < 0) ? -G : G;
    if (G == 0) {
      if (E == 0) {
        D[F].bits = 0;
        D[F].size = 1;
      } else {
        D[F].bits = 2;
        D[F].size = 2;
      }
    } else if (G == 1) {
      D[F].bits = 6;
      D[F].size = 3;
    } else if (G == 2) {
      D[F].bits = 28;
      D[F].size = 5;
    } else if (G == 3) {
      D[F].bits = 58;
      D[F].size = 6;
    } else if (G == 4) {
      D[F].bits = 59;
      D[F].size = 6;
    } else if (G <= 6) {
      D[F].bits = 60;
      D[F].size = 6;
    } else if (G <= 10) {
      D[F].bits = 61;
      D[F].size = 6;
    } else if (G <= 18) {
      D[F].bits = 124;
      D[F].size = 7;
    } else if (G <= 34) {
      D[F].bits = 125;
      D[F].size = 7;
    } else if (G <= 66) {
      D[F].bits = 126;
      D[F].size = 7;
    } else {
      D[F].bits = 127;
      D[F].size = 7;
    }
    E = D[F].bits;
  }
  return;
}

void fn_K(__global uint* const A, __global uint* const B, const int C, const int D, const int E, token* F, const int G, const int H) {
  int I;
  int J = H;
  tree_index K;

  int L = ((G == 0) ? 1 : 0);
  int M = 0;

  for (; L < 16; ++L) {
    I = gb_H[L];

    if (M) {
      K = 2;
      --(F[L].size);
    } else
      K = 0;

    do {
      const uchar N = (F[L].bits >> (--(F[L].size))) & 1;
      A[((((C << 5) + (G << 3)) + I) * 3 + J) * 11 + (K >> 1)] += (1 - N);
      ++(B[((((C << 5) + (G << 3)) + I) * 3 + J) * 11 + (K >> 1)]);
      K = gb_A[K + N];
    } while (F[L].size);

    J = 2;
    if (F[L].bits == 6)
      J = 1;
    if (F[L].bits == 2) {
      M = 1;
      J = 0;
    } else {
      M = 0;
    }
  }
  return;
}

__kernel void fn_L(__global macroblock* A, __global uint* B, __global uint* C, __global uchar* D, int E, int F, int G, int H, int I) {
  int J = get_global_id(0);
  int K, L, M, N;
  int O, P;
  int Q;
  int R, S;
  token T[16];

  {
    int U, V, W, X;
    for (U = 0; U < 4; ++U)
      for (V = 0; V < 8; ++V)
        for (W = 0; W < 3; ++W)
          for (X = 0; X < 11; ++X) {
            B[((((J << 5) + (U << 3)) + V) * 3 + W) * 11 + X] = 0;
            C[((((J << 5) + (U << 3)) + V) * 3 + W) * 11 + X] = 1;
          }
  }

  for (K = J; K < E; K += G) {
    for (M = 0; M < F; ++M) {
      L = M + K * F;
      if (A[L].non_zero_coeffs == 0)
        continue;
      if (A[L].parts == are16x16) {
        R = 1;
        *(D + L * 25 + 24) = 0;
        if (K > 0) {
          O = L - F;
          while (O >= 0) {
            if (A[O].parts == are16x16)
              break;
            O -= F;
          }
          if (O >= 0)
            for (Q = 0; Q < 16; ++Q) {
              if (A[O].coeffs[24][Q] != 0) {
                ++(*(D + L * 25 + 24));
                break;
              }
            }
        }
        if (M > 0) {
          O = L - 1;
          while (O >= (K * F)) {
            if (A[O].parts == are16x16)
              break;
            --O;
          }
          if (O >= (K * F))
            for (Q = 0; Q < 16; ++Q) {
              if (A[O].coeffs[24][Q] != 0) {
                ++(*(D + L * 25 + 24));
                break;
              }
            }
        }
        fn_J(A, L, 24, T);
        fn_K(B, C, J, L, 24, T, R, *(D + L * 25 + 24));
        R = 0;
      } else
        R = 3;

      for (N = 0; N < 16; ++N) {
        *(D + L * 25 + N) = 0;

        O = -1;
        if ((N >> 2) > 0) {
          O = L;
          P = N - 4;
        } else if (K > 0) {
          O = L - F;
          P = N + 12;
        }
        if (O >= 0) {
          S = (A[O].parts == are16x16) ? 1 : 0;
          for (Q = S; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }

        O = -1;
        if ((N & 3) > 0) {
          O = L;
          P = N - 1;
        } else if (M > 0) {
          O = L - 1;
          P = N + 3;
        }
        if (O >= 0) {
          S = (A[O].parts == are16x16) ? 1 : 0;
          for (Q = S; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }
        fn_J(A, L, N, T);
        fn_K(B, C, J, L, N, T, R, *(D + L * 25 + N));
      }

      R = 2;
      for (N = 16; N < 20; ++N) {
        *(D + L * 25 + N) = 0;

        O = -1;
        if (((N - 16) >> 1) > 0) {
          O = L;
          P = N - 2;
        } else if (K > 0) {
          O = L - F;
          P = N + 2;
        }
        if (O >= 0) {
          for (Q = 0; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }

        O = -1;
        if (((N - 16) & 1) > 0) {
          O = L;
          P = N - 1;
        } else if (M > 0) {
          O = L - 1;
          P = N + 1;
        }
        if (O >= 0) {
          for (Q = 0; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }
        fn_J(A, L, N, T);
        fn_K(B, C, J, L, N, T, R, *(D + L * 25 + N));
      }

      for (N = 20; N < 24; ++N) {
        *(D + L * 25 + N) = 0;

        O = -1;
        if (((N - 20) >> 1) > 0) {
          O = L;
          P = N - 2;
        } else if (K > 0) {
          O = L - F;
          P = N + 2;
        }
        if (O >= 0) {
          for (Q = 0; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }

        O = -1;
        if (((N - 20) & 1) > 0) {
          O = L;
          P = N - 1;
        } else if (M > 0) {
          O = L - 1;
          P = N + 1;
        }
        if (O >= 0) {
          for (Q = 0; Q < 16; ++Q) {
            if (A[O].coeffs[P][Q] != 0) {
              ++(*(D + L * 25 + N));
              break;
            }
          }
        }
        fn_J(A, L, N, T);
        fn_K(B, C, J, L, N, T, R, *(D + L * 25 + N));
      }
    }
  }

  return;
}

__kernel void fn_M(__global uint* A, __global uint* B, int C) {
  int D = get_global_id(0);
  int E, F, G, H, I;
  uint J, K;
  for (E = 0; E < 4; ++E)
    for (F = D; F < 8; F += C)
      for (G = 0; G < 3; ++G)
        for (H = 0; H < 11; ++H) {
          J = 0;
          K = 0;
          for (I = 0; I < C; ++I) {
            J += A[((((I << 5) + (E << 3)) + F) * 3 + G) * 11 + H];
            K += B[((((I << 5) + (E << 3)) + F) * 3 + G) * 11 + H];
          }
          J = (J << 8) / K;
          A[(((E << 3) + F) * 3 + G) * 11 + H] = (J > 255) ? 255 : ((J == 0) ? 1 : J);
        }
  return;
}