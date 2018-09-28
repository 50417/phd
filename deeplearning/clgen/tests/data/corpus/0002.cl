typedef short int16_t; typedef int int32_t; typedef unsigned int uint32_t; typedef unsigned char uint8_t; typedef signed char int8_t; typedef unsigned short uint16_t; typedef uint8_t Prob; typedef int8_t tree_index; typedef const tree_index Tree[]; typedef enum { are16x16 = 0, are8x8 = 1, are4x4 = 2 } partition_mode;

typedef enum { intra_segment = 0, UQ_segment = 0, HQ_segment = 1, AQ_segment = 2, LQ_segment = 3 } segment_ids;

typedef enum { LAST = 0, GOLDEN = 1, ALTREF = 2 } ref_frame;

typedef struct { short coeff[16]; } block_t;

typedef struct { block_t block[25]; } macroblock_coeffs_t;

typedef struct {
  short x;
  short y;
} vector_t;

typedef struct { vector_t vector[4]; } macroblock_vectors_t;

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

void fn_A(vp8_bool_encoder* const restrict A, __global uint8_t* const restrict B) {
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

void fn_C(vp8_bool_encoder* const restrict A, const int B, const int C) {
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

void fn_D(vp8_bool_encoder* const restrict A, const int B) {
  fn_C(A, 128, (B) ? 1 : 0);
}
void fn_E(vp8_bool_encoder* const restrict A) {
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

void fn_F(vp8_bool_encoder* const restrict A, __global const uint* const restrict B, token* const restrict C, const int D, uchar E) {
  int F;
  tree_index G;

  int H = ((D == 0) ? 1 : 0);
  int I = 0;

  for (; H < 16; ++H) {
    F = gb_H[H];

    if (I) {
      G = 2;
      --(C[H].size);
    } else
      G = 0;

    do {
      const int J = (C[H].bits >> (--(C[H].size))) & 1;
      fn_C(A, (uchar)B[(((D << 3) + F) * 3 + E) * 11 + (G >> 1)], J);
      G = gb_A[G + J];
    } while (C[H].size);

    if (C[H].bits == 0)
      return;

    if (C[H].extra_size > 0) {
      int K = 1 << (C[H].extra_size - 1);
      int L = 0;
      while (C[H].pcat[L]) {
        fn_C(A, C[H].pcat[L], (C[H].extra_bits & K) ? 1 : 0);
        ++L;
        K >>= 1;
      }
    }

    E = 2;
    if (C[H].bits == 6)
      E = 1;
    if (C[H].bits == 2) {
      I = 1;
      E = 0;
    } else {
      fn_C(A, 128, C[H].sign);
      I = 0;
    }
  }

  return;
}

void fn_G(__global const macroblock_coeffs_t* const restrict A, const int B, const int C, token D[16]) {
  int E = 0;
  int F;
  for (F = 15; F >= 0; --F) {
    int G = (int)A[B].block[C].coeff[F];
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

__kernel void fn_H(__global const macroblock_coeffs_t* const restrict A, __global const int* const restrict B, __global const int* const restrict C, __global uchar* const restrict D, __global int* const restrict E, __global const uchar* const restrict F, __global const uint* const restrict G, const int H, const int I, const int J, const int K) {
  int L = get_global_id(0);
  int M, N, O, P;
  int Q;
  vp8_bool_encoder R[1];

  token S[16];

  fn_A(R, D + K * L);

  for (M = L; M < H; M += J) {
    for (O = 0; O < I; ++O) {
      N = O + M * I;
      if (B[N] == 0)
        continue;
      if (C[N] == are16x16) {
        Q = 1;
        fn_G(A, N, 24, S);
        fn_F(R, G, S, Q, *(F + N * 25 + 24));
        Q = 0;
      } else {
        Q = 3;
      }

      for (P = 0; P < 16; ++P) {
        fn_G(A, N, P, S);
        fn_F(R, G, S, Q, *(F + N * 25 + P));
      }

      Q = 2;
      for (P = 16; P < 20; ++P) {
        fn_G(A, N, P, S);
        fn_F(R, G, S, Q, *(F + N * 25 + P));
      }

      for (P = 20; P < 24; ++P) {
        fn_G(A, N, P, S);
        fn_F(R, G, S, Q, *(F + N * 25 + P));
      }
    }
  }
  fn_E(R);
  E[L] = R->count;

  return;
}

void fn_I(__global const macroblock_coeffs_t* const restrict A, const int B, const int C, token D[16]) {
  int E = 0;
  int F;
  for (F = 15; F >= 0; --F) {
    int G = (int)A[B].block[C].coeff[F];
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

void fn_J(__global uint* const restrict A, __global uint* const restrict B, const int C, const int D, const int E, token* const restrict F, const int G, const int H) {
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

__kernel void fn_K(__global const macroblock_coeffs_t* const restrict A, __global const int* const restrict B, __global const int* const restrict C, __global uint* const restrict D, __global uint* const restrict E, __global uchar* const restrict F, const int G, const int H, const int I, const int J) {
  int K = get_global_id(0);
  int L, M, N, O;
  int P, Q;
  int R;
  int S, T;
  token U[16];

  {
    int V, W, X, Y;
    for (V = 0; V < 4; ++V)
      for (W = 0; W < 8; ++W)
        for (X = 0; X < 3; ++X)
          for (Y = 0; Y < 11; ++Y) {
            D[((((K << 5) + (V << 3)) + W) * 3 + X) * 11 + Y] = 0;
            E[((((K << 5) + (V << 3)) + W) * 3 + X) * 11 + Y] = 1;
          }
  }

  for (L = K; L < G; L += I) {
    for (N = 0; N < H; ++N) {
      M = N + L * H;
      if (B[M] == 0)
        continue;
      if (C[M] == are16x16) {
        S = 1;
        *(F + M * 25 + 24) = 0;
        if (L > 0) {
          P = M - H;
          while (P >= 0) {
            if (C[P] == are16x16)
              break;
            P -= H;
          }
          if (P >= 0)
            for (R = 0; R < 16; ++R) {
              if (A[P].block[24].coeff[R] != 0) {
                ++(*(F + M * 25 + 24));
                break;
              }
            }
        }
        if (N > 0) {
          P = M - 1;
          while (P >= (L * H)) {
            if (C[P] == are16x16)
              break;
            --P;
          }
          if (P >= (L * H))
            for (R = 0; R < 16; ++R) {
              if (A[P].block[24].coeff[R] != 0) {
                ++(*(F + M * 25 + 24));
                break;
              }
            }
        }
        fn_I(A, M, 24, U);
        fn_J(D, E, K, M, 24, U, S, *(F + M * 25 + 24));
        S = 0;
      } else
        S = 3;

      for (O = 0; O < 16; ++O) {
        *(F + M * 25 + O) = 0;

        P = -1;
        if ((O >> 2) > 0) {
          P = M;
          Q = O - 4;
        } else if (L > 0) {
          P = M - H;
          Q = O + 12;
        }
        if (P >= 0) {
          T = (C[P] == are16x16) ? 1 : 0;
          for (R = T; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }

        P = -1;
        if ((O & 3) > 0) {
          P = M;
          Q = O - 1;
        } else if (N > 0) {
          P = M - 1;
          Q = O + 3;
        }
        if (P >= 0) {
          T = (C[P] == are16x16) ? 1 : 0;
          for (R = T; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }
        fn_I(A, M, O, U);
        fn_J(D, E, K, M, O, U, S, *(F + M * 25 + O));
      }

      S = 2;
      for (O = 16; O < 20; ++O) {
        *(F + M * 25 + O) = 0;

        P = -1;
        if (((O - 16) >> 1) > 0) {
          P = M;
          Q = O - 2;
        } else if (L > 0) {
          P = M - H;
          Q = O + 2;
        }
        if (P >= 0) {
          for (R = 0; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }

        P = -1;
        if (((O - 16) & 1) > 0) {
          P = M;
          Q = O - 1;
        } else if (N > 0) {
          P = M - 1;
          Q = O + 1;
        }
        if (P >= 0) {
          for (R = 0; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }
        fn_I(A, M, O, U);
        fn_J(D, E, K, M, O, U, S, *(F + M * 25 + O));
      }

      for (O = 20; O < 24; ++O) {
        *(F + M * 25 + O) = 0;

        P = -1;
        if (((O - 20) >> 1) > 0) {
          P = M;
          Q = O - 2;
        } else if (L > 0) {
          P = M - H;
          Q = O + 2;
        }
        if (P >= 0) {
          for (R = 0; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }

        P = -1;
        if (((O - 20) & 1) > 0) {
          P = M;
          Q = O - 1;
        } else if (N > 0) {
          P = M - 1;
          Q = O + 1;
        }
        if (P >= 0) {
          for (R = 0; R < 16; ++R) {
            if (A[P].block[Q].coeff[R] != 0) {
              ++(*(F + M * 25 + O));
              break;
            }
          }
        }
        fn_I(A, M, O, U);
        fn_J(D, E, K, M, O, U, S, *(F + M * 25 + O));
      }
    }
  }

  return;
}

__kernel void fn_L(__global uint* const restrict A, __global const uint* const restrict B, const int C) {
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