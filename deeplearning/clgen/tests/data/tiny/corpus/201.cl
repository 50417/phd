__constant uint a[] = {0x00000001U, 0x00000002U, 0x00000004U, 0x00000008U, 0x00000010U, 0x00000020U, 0x00000040U, 0x00000080U, 0x00000100U, 0x00000200U, 0x00000400U, 0x00000800U, 0x00001000U, 0x00002000U, 0x00004000U, 0x00008000U, 0x00010000U, 0x00020000U, 0x00040000U, 0x00080000U, 0x00100000U};

__constant uint b[2] = {0x00FF00FF, 0xFF00FF00};
__constant uint c[] = {0x428a2f98U, 0x71374491U, 0xb5c0fbcfU, 0xe9b5dba5U, 0x3956c25bU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U, 0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U, 0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xe49b69c1U, 0xefbe4786U, 0x0fc19dc6U, 0x240ca1ccU, 0x2de92c6fU, 0x4a7484aaU, 0x5cb0a9dcU, 0x76f988daU, 0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U, 0xc6e00bf3U, 0xd5a79147U, 0x06ca6351U,
                       0x14292967U, 0x27b70a85U, 0x2e1b2138U, 0x4d2c6dfcU, 0x53380d13U, 0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U, 0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U, 0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U, 0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U, 0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U, 0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U, 0x90befffaU,
                       0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U, 0x98c7e2a2U, 0xfc08884dU, 0xcd2a11aeU, 0x510e527fU, 0x9b05688cU, 0xC3910C8EU, 0xfb6feee7U, 0x2a01a605U, 0x0c2e12e0U, 0x4498517BU, 0x6a09e667U, 0xa4ce148bU, 0x95F61999U, 0xc19bf174U, 0xBB67AE85U, 0x3C6EF372U, 0xA54FF53AU, 0x1F83D9ABU, 0x5BE0CD19U, 0x5C5C5C5CU, 0x36363636U, 0x80000000U, 0x000003FFU, 0x00000280U, 0x000004a0U, 0x00000300U};
void A(uint4* restrict d, uint4* restrict e, const uint4 f, const uint4 g, const uint4 h, const uint4 i) {
  uint4 j = *d;
  uint4 k = *e;
  uint4 l[4];

  l[0].x = f.x;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[0].x + c[0];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  l[0].y = f.y;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[0].y + c[1];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  l[0].z = f.z;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[0].z + c[2];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  l[0].w = f.w;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[0].w + c[3];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[1].x = g.x;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[1].x + c[4];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  l[1].y = g.y;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[1].y + c[5];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  l[1].z = g.z;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[1].z + c[6];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  l[1].w = g.w;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[1].w + c[7];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[2].x = h.x;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[2].x + c[8];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  l[2].y = h.y;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[2].y + c[9];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  l[2].z = h.z;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[2].z + c[10];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  l[2].w = h.w;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[2].w + c[11];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[3].x = i.x;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[3].x + c[12];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  l[3].y = i.y;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[3].y + c[13];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  l[3].z = i.z;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[3].z + c[14];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  l[3].w = i.w;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[3].w + c[76];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[0].x + c[15];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[0].y + c[16];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[0].z + c[17];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[0].w + c[18];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[1].x + c[19];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[1].y + c[20];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[1].z + c[21];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[1].w + c[22];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[2].x + c[23];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[2].y + c[24];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[2].z + c[25];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[2].w + c[26];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[3].x + c[27];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[3].y + c[28];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[3].z + c[29];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[3].w + c[30];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[0].x + c[31];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[0].y + c[32];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[0].z + c[33];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[0].w + c[34];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[1].x + c[35];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[1].y + c[36];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[1].z + c[37];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[1].w + c[38];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[2].x + c[39];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[2].y + c[40];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[2].z + c[41];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[2].w + c[42];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[3].x + c[43];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[3].y + c[44];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[3].z + c[45];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[3].w + c[46];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[0].x + c[47];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[0].y + c[48];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[0].z + c[49];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[0].w + c[50];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[1].x + c[51];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[1].y + c[52];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[1].z + c[53];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[1].w + c[54];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += l[2].x + c[55];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += l[2].y + c[56];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += l[2].z + c[57];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += l[2].w + c[58];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += l[3].x + c[59];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += l[3].y + c[60];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += l[3].z + c[61];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += l[3].w + c[62];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  *d += j;
  *e += k;
}

void B(uint4* restrict d, uint4* restrict e, const uint4 f, const uint4 g, const uint4 h, const uint4 i) {
  uint4 l[4];

  l[0].x = f.x;
  (*d).w = c[63] + l[0].x;
  (*e).w = c[64] + l[0].x;

  l[0].y = f.y;
  (*d).z = c[65] + (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U)) + bitselect(c[67], c[66], (*d).w) + l[0].y;
  (*e).z = c[68] + (*d).z + (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U)) + bitselect(c[70], c[69], (*e).w);

  l[0].z = f.z;
  (*d).y = c[71] + (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U)) + bitselect(c[66], (*d).w, (*d).z) + l[0].z;
  (*e).y = c[72] + (*d).y + (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U)) + bitselect(c[73], (*e).w, ((*e).z ^ c[73]));

  l[0].w = f.w;
  (*d).x = c[74] + (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U)) + bitselect((*d).w, (*d).z, (*d).y) + l[0].w;
  (*e).x = c[75] + (*d).x + (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U)) + bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));

  l[1].x = g.x;
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[1].x + c[4];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;
  l[1].y = g.y;
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[1].y + c[5];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;
  l[1].z = g.z;
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[1].z + c[6];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;
  l[1].w = g.w;
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[1].w + c[7];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[2].x = h.x;
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[2].x + c[8];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;
  l[2].y = h.y;
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[2].y + c[9];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;
  l[2].z = h.z;
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[2].z + c[10];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;
  l[2].w = h.w;
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[2].w + c[11];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[3].x = i.x;
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[3].x + c[12];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;
  l[3].y = i.y;
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[3].y + c[13];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;
  l[3].z = i.z;
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[3].z + c[14];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;
  l[3].w = i.w;
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[3].w + c[76];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[0].x + c[15];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[0].y + c[16];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[0].z + c[17];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[0].w + c[18];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[1].x + c[19];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[1].y + c[20];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[1].z + c[21];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[1].w + c[22];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[2].x + c[23];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[2].y + c[24];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[2].z + c[25];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[2].w + c[26];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[3].x + c[27];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[3].y + c[28];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[3].z + c[29];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[3].w + c[30];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[0].x + c[31];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[0].y + c[32];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[0].z + c[33];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[0].w + c[34];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[1].x + c[35];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[1].y + c[36];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[1].z + c[37];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[1].w + c[38];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[2].x + c[39];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[2].y + c[40];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[2].z + c[41];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[2].w + c[42];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[3].x + c[43];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[3].y + c[44];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[3].z + c[45];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[3].w + c[46];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[0].x += (rotate(l[3].z, 15U) ^ rotate(l[3].z, 13U) ^ (l[3].z >> 10U)) + l[2].y + (rotate(l[0].y, 25U) ^ rotate(l[0].y, 14U) ^ (l[0].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[0].x + c[47];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[0].y += (rotate(l[3].w, 15U) ^ rotate(l[3].w, 13U) ^ (l[3].w >> 10U)) + l[2].z + (rotate(l[0].z, 25U) ^ rotate(l[0].z, 14U) ^ (l[0].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[0].y + c[48];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[0].z += (rotate(l[0].x, 15U) ^ rotate(l[0].x, 13U) ^ (l[0].x >> 10U)) + l[2].w + (rotate(l[0].w, 25U) ^ rotate(l[0].w, 14U) ^ (l[0].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[0].z + c[49];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[0].w += (rotate(l[0].y, 15U) ^ rotate(l[0].y, 13U) ^ (l[0].y >> 10U)) + l[3].x + (rotate(l[1].x, 25U) ^ rotate(l[1].x, 14U) ^ (l[1].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[0].w + c[50];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[1].x += (rotate(l[0].z, 15U) ^ rotate(l[0].z, 13U) ^ (l[0].z >> 10U)) + l[3].y + (rotate(l[1].y, 25U) ^ rotate(l[1].y, 14U) ^ (l[1].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[1].x + c[51];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[1].y += (rotate(l[0].w, 15U) ^ rotate(l[0].w, 13U) ^ (l[0].w >> 10U)) + l[3].z + (rotate(l[1].z, 25U) ^ rotate(l[1].z, 14U) ^ (l[1].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[1].y + c[52];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[1].z += (rotate(l[1].x, 15U) ^ rotate(l[1].x, 13U) ^ (l[1].x >> 10U)) + l[3].w + (rotate(l[1].w, 25U) ^ rotate(l[1].w, 14U) ^ (l[1].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[1].z + c[53];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[1].w += (rotate(l[1].y, 15U) ^ rotate(l[1].y, 13U) ^ (l[1].y >> 10U)) + l[0].x + (rotate(l[2].x, 25U) ^ rotate(l[2].x, 14U) ^ (l[2].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[1].w + c[54];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;

  l[2].x += (rotate(l[1].z, 15U) ^ rotate(l[1].z, 13U) ^ (l[1].z >> 10U)) + l[0].y + (rotate(l[2].y, 25U) ^ rotate(l[2].y, 14U) ^ (l[2].y >> 3U));
  (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U));
  (*e).w += bitselect((*e).z, (*e).y, (*e).x);
  (*e).w += l[2].x + c[55];
  (*d).w += (*e).w;
  (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U));
  (*e).w += bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
  ;

  l[2].y += (rotate(l[1].w, 15U) ^ rotate(l[1].w, 13U) ^ (l[1].w >> 10U)) + l[0].z + (rotate(l[2].z, 25U) ^ rotate(l[2].z, 14U) ^ (l[2].z >> 3U));
  (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U));
  (*e).z += bitselect((*e).y, (*e).x, (*d).w);
  (*e).z += l[2].y + c[56];
  (*d).z += (*e).z;
  (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U));
  (*e).z += bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
  ;

  l[2].z += (rotate(l[2].x, 15U) ^ rotate(l[2].x, 13U) ^ (l[2].x >> 10U)) + l[0].w + (rotate(l[2].w, 25U) ^ rotate(l[2].w, 14U) ^ (l[2].w >> 3U));
  (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U));
  (*e).y += bitselect((*e).x, (*d).w, (*d).z);
  (*e).y += l[2].z + c[57];
  (*d).y += (*e).y;
  (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U));
  (*e).y += bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
  ;

  l[2].w += (rotate(l[2].y, 15U) ^ rotate(l[2].y, 13U) ^ (l[2].y >> 10U)) + l[1].x + (rotate(l[3].x, 25U) ^ rotate(l[3].x, 14U) ^ (l[3].x >> 3U));
  (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U));
  (*e).x += bitselect((*d).w, (*d).z, (*d).y);
  (*e).x += l[2].w + c[58];
  (*d).x += (*e).x;
  (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U));
  (*e).x += bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
  ;

  l[3].x += (rotate(l[2].z, 15U) ^ rotate(l[2].z, 13U) ^ (l[2].z >> 10U)) + l[1].y + (rotate(l[3].y, 25U) ^ rotate(l[3].y, 14U) ^ (l[3].y >> 3U));
  (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U));
  (*d).w += bitselect((*d).z, (*d).y, (*d).x);
  (*d).w += l[3].x + c[59];
  (*e).w += (*d).w;
  (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U));
  (*d).w += bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
  ;

  l[3].y += (rotate(l[2].w, 15U) ^ rotate(l[2].w, 13U) ^ (l[2].w >> 10U)) + l[1].z + (rotate(l[3].z, 25U) ^ rotate(l[3].z, 14U) ^ (l[3].z >> 3U));
  (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U));
  (*d).z += bitselect((*d).y, (*d).x, (*e).w);
  (*d).z += l[3].y + c[60];
  (*e).z += (*d).z;
  (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U));
  (*d).z += bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
  ;

  l[3].z += (rotate(l[3].x, 15U) ^ rotate(l[3].x, 13U) ^ (l[3].x >> 10U)) + l[1].w + (rotate(l[3].w, 25U) ^ rotate(l[3].w, 14U) ^ (l[3].w >> 3U));
  (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U));
  (*d).y += bitselect((*d).x, (*e).w, (*e).z);
  (*d).y += l[3].z + c[61];
  (*e).y += (*d).y;
  (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U));
  (*d).y += bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
  ;

  l[3].w += (rotate(l[3].y, 15U) ^ rotate(l[3].y, 13U) ^ (l[3].y >> 10U)) + l[2].x + (rotate(l[0].x, 25U) ^ rotate(l[0].x, 14U) ^ (l[0].x >> 3U));
  (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U));
  (*d).x += bitselect((*e).w, (*e).z, (*e).y);
  (*d).x += l[3].w + c[62];
  (*e).x += (*d).x;
  (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U));
  (*d).x += bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
  ;
  *d += (uint4)(c[73], c[77], c[78], c[79]);
  *e += (uint4)(c[66], c[67], c[80], c[81]);
}

__constant uint m[64] = {
    0x428a2f99, 0xf1374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf794, 0xf59b89c2, 0x73924787, 0x23c6886e, 0xa42ca65c, 0x15ed3627, 0x4d6edcbf, 0xe28217fc, 0xef02488f, 0xb707775c, 0x0468c23f, 0xe7e72b4c, 0x49e1f1a2, 0x4b99c816, 0x926d1570, 0xaa0fc072, 0xadb36e2c,
    0xad87a3ea, 0xbcb1d3a3, 0x7b993186, 0x562b9420, 0xbff3ca0c, 0xda4b0c23, 0x6cd8711a, 0x8f337caa, 0xc91b1417, 0xc359dce1, 0xa83253a7, 0x3b13c12d, 0x9d3d725d, 0xd9031a84, 0xb1a03340, 0x16f58012, 0xe64fb6a2, 0xe84d923a, 0xe93a5730, 0x09837686, 0x078ff753, 0x29833341, 0xd5de0b7e, 0x6948ccf4, 0xe0a1adbe, 0x7c728e11, 0x511c78e4, 0x315b45bd, 0xfca71413, 0xea28f96a, 0x79703128, 0x4e1ef848,
};

void C(uint4* restrict d, uint4* restrict e) {
  uint4 j = *d;
  uint4 k = *e;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[0];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[1];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[2];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[3];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[4];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[5];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[6];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[7];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[8];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[9];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[10];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[11];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[12];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[13];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[14];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[15];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[16];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[17];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[18];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[19];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[20];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[21];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[22];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[23];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[24];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[25];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[26];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[27];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[28];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[29];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[30];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[31];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[32];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[33];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[34];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[35];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[36];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[37];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[38];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[39];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[40];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[41];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[42];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[43];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[44];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[45];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[46];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[47];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[48];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[49];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[50];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[51];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[52];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[53];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[54];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[55];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U));
  k.w += bitselect(k.z, k.y, k.x);
  k.w += m[56];
  j.w += k.w;
  k.w += (rotate(j.x, 30U) ^ rotate(j.x, 19U) ^ rotate(j.x, 10U));
  k.w += bitselect(j.z, j.y, (j.x ^ j.z));
  ;
  k.z += (rotate(j.w, 26U) ^ rotate(j.w, 21U) ^ rotate(j.w, 7U));
  k.z += bitselect(k.y, k.x, j.w);
  k.z += m[57];
  j.z += k.z;
  k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U));
  k.z += bitselect(j.y, j.x, (k.w ^ j.y));
  ;
  k.y += (rotate(j.z, 26U) ^ rotate(j.z, 21U) ^ rotate(j.z, 7U));
  k.y += bitselect(k.x, j.w, j.z);
  k.y += m[58];
  j.y += k.y;
  k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U));
  k.y += bitselect(j.x, k.w, (k.z ^ j.x));
  ;
  k.x += (rotate(j.y, 26U) ^ rotate(j.y, 21U) ^ rotate(j.y, 7U));
  k.x += bitselect(j.w, j.z, j.y);
  k.x += m[59];
  j.x += k.x;
  k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U));
  k.x += bitselect(k.w, k.z, (k.y ^ k.w));
  ;
  j.w += (rotate(j.x, 26U) ^ rotate(j.x, 21U) ^ rotate(j.x, 7U));
  j.w += bitselect(j.z, j.y, j.x);
  j.w += m[60];
  k.w += j.w;
  j.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U));
  j.w += bitselect(k.z, k.y, (k.x ^ k.z));
  ;
  j.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U));
  j.z += bitselect(j.y, j.x, k.w);
  j.z += m[61];
  k.z += j.z;
  j.z += (rotate(j.w, 30U) ^ rotate(j.w, 19U) ^ rotate(j.w, 10U));
  j.z += bitselect(k.y, k.x, (j.w ^ k.y));
  ;
  j.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U));
  j.y += bitselect(j.x, k.w, k.z);
  j.y += m[62];
  k.y += j.y;
  j.y += (rotate(j.z, 30U) ^ rotate(j.z, 19U) ^ rotate(j.z, 10U));
  j.y += bitselect(k.x, j.w, (j.z ^ k.x));
  ;
  j.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U));
  j.x += bitselect(k.w, k.z, k.y);
  j.x += m[63];
  k.x += j.x;
  j.x += (rotate(j.y, 30U) ^ rotate(j.y, 19U) ^ rotate(j.y, 10U));
  j.x += bitselect(j.w, j.z, (j.y ^ j.w));
  ;
  *d += j;
  *e += k;
}

void D(uint4 n[8]) {
  uint4 o[4];
  o[0] = (uint4)(n[1].x, n[2].y, n[3].z, n[0].w);
  o[1] = (uint4)(n[2].x, n[3].y, n[0].z, n[1].w);
  o[2] = (uint4)(n[3].x, n[0].y, n[1].z, n[2].w);
  o[3] = (uint4)(n[0].x, n[1].y, n[2].z, n[3].w);

  for (uint p = 0; p < 4; ++p)
    n[p] = (rotate(o[p] & b[0], 24U) | rotate(o[p] & b[1], 8U));

  o[0] = (uint4)(n[5].x, n[6].y, n[7].z, n[4].w);
  o[1] = (uint4)(n[6].x, n[7].y, n[4].z, n[5].w);
  o[2] = (uint4)(n[7].x, n[4].y, n[5].z, n[6].w);
  o[3] = (uint4)(n[4].x, n[5].y, n[6].z, n[7].w);

  for (uint p = 0; p < 4; ++p)
    n[p + 4] = (rotate(o[p] & b[0], 24U) | rotate(o[p] & b[1], 8U));
}

void E(uint4 n[8]) {
  uint4 o[4];
  o[0] = (uint4)(n[3].x, n[2].y, n[1].z, n[0].w);
  o[1] = (uint4)(n[0].x, n[3].y, n[2].z, n[1].w);
  o[2] = (uint4)(n[1].x, n[0].y, n[3].z, n[2].w);
  o[3] = (uint4)(n[2].x, n[1].y, n[0].z, n[3].w);

  for (uint p = 0; p < 4; ++p)
    n[p] = (rotate(o[p] & b[0], 24U) | rotate(o[p] & b[1], 8U));

  o[0] = (uint4)(n[7].x, n[6].y, n[5].z, n[4].w);
  o[1] = (uint4)(n[4].x, n[7].y, n[6].z, n[5].w);
  o[2] = (uint4)(n[5].x, n[4].y, n[7].z, n[6].w);
  o[3] = (uint4)(n[6].x, n[5].y, n[4].z, n[7].w);

  for (uint p = 0; p < 4; ++p)
    n[p + 4] = (rotate(o[p] & b[0], 24U) | rotate(o[p] & b[1], 8U));
}

void F(uint4 n[8]) {
  uint4 q[4];

  for (uint p = 0; p < 4; ++p)
    q[p] = (n[p] ^= n[p + 4]);

  for (uint p = 0; p < 4; ++p) {
    q[0] ^= rotate(q[3] + q[2], 7U);
    q[1] ^= rotate(q[0] + q[3], 9U);
    q[2] ^= rotate(q[1] + q[0], 13U);
    q[3] ^= rotate(q[2] + q[1], 18U);
    q[2] ^= rotate(q[3].wxyz + q[0].zwxy, 7U);
    q[1] ^= rotate(q[2].wxyz + q[3].zwxy, 9U);
    q[0] ^= rotate(q[1].wxyz + q[2].zwxy, 13U);
    q[3] ^= rotate(q[0].wxyz + q[1].zwxy, 18U);
  }

  for (uint p = 0; p < 4; ++p)
    q[p] = (n[p + 4] ^= (n[p] += q[p]));

  for (uint p = 0; p < 4; ++p) {
    q[0] ^= rotate(q[3] + q[2], 7U);
    q[1] ^= rotate(q[0] + q[3], 9U);
    q[2] ^= rotate(q[1] + q[0], 13U);
    q[3] ^= rotate(q[2] + q[1], 18U);
    q[2] ^= rotate(q[3].wxyz + q[0].zwxy, 7U);
    q[1] ^= rotate(q[2].wxyz + q[3].zwxy, 9U);
    q[0] ^= rotate(q[1].wxyz + q[2].zwxy, 13U);
    q[3] ^= rotate(q[0].wxyz + q[1].zwxy, 18U);
  }

  for (uint p = 0; p < 4; ++p)
    n[p + 4] += q[p];
}

void G(uint4 r[8], __global uint4* restrict s) {
  D(r);
  const uint t = 8;
  const uint u = 128;
  uint v = get_global_id(0) % u;
  uint w = rotate(v, 3U);
  uint x = rotate(u, 3U);

  for (uint y = 0; y < a[10] / 16; ++y, w += x) {
    uint z = w;
    for (uint aa = 0; aa < t; ++aa, ++z)
      s[z] = r[aa];
    for (uint p = 0; p < 16; ++p)
      F(r);
  }

  x = rotate(v, 3U);

  {
    uint y = (a[10] / 16);
    w = x + rotate(y * u, 3U);
    for (uint aa = 0; aa < t; ++aa, ++w)
      s[w] = r[aa];
    for (uint p = 0; p < a[10] % 16; ++p)
      F(r);
  }

  for (uint p = 0; p < a[10]; ++p) {
    uint4 ab[8];
    uint ac = r[7].x & (a[10] - 1);
    uint y = (ac / 16);
    uint z = x + rotate(u * y, 3U);

    for (uint aa = 0; aa < t; ++aa, ++z)
      ab[aa] = s[z];

    uint ad = ac % 16;
    for (uint aa = 0; aa < ad; ++aa)
      F(ab);

    for (uint aa = 0; aa < t; ++aa)
      r[aa] ^= ab[aa];
    F(r);
  }
  E(r);
}

__kernel void H(__global const uint4* restrict ae, volatile __global uint* restrict af, __global uint4* restrict ag, const uint4 ah, const uint4 ai, const uint aj) {
  uint ak = get_global_id(0);
  uint4 r[8];
  uint4 al, am, an, ao, ap, aq;
  uint4 ar = (uint4)(ae.x,ae.y,ae.z,ak;
  uint4 as = ah, at = ai;

  A(&as,&at, ar, (uint4)(c[84],0,0,0), (uint4)(0,0,0,0), (uint4)(0,0,0, c[86]));
  B(&an,&ao, as^ c[82], at^ c[82], c[82], c[82]);
  B(&al,&am, as^ c[83], at^ c[83], c[83], c[83]);

  ap = al;
  aq = am;
  A(&al, &am, ae[0],ae[1],ae[2],ae[3]);

 for (uint p=0; p<4; p++)
  {
    as = al;
    at = am;
    r[rotate(p, 1U)] = an;
    r[rotate(p, 1U) + 1] = ao;

    A(&as, &at, ar, (uint4)(p + 1, c[84], 0, 0), (uint4)(0, 0, 0, 0), (uint4)(0, 0, 0, c[87]));
    A(r + rotate(p, 1U), r + rotate(p, 1U) + 1, as, at, (uint4)(c[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, c[88]));
  }
  G(r,ag);
  A(&ap,&aq, r[0], r[1], r[2], r[3]);
  A(&ap,&aq, r[4], r[5], r[6], r[7]);
  C(&ap,&aq);
  A(&an,&ao, ap, aq, (uint4)(c[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, c[88]));

  bool au = ((rotate(ao.w & b[0],24U)|rotate(ao.w & b[1],8U)) <= aj);
  if (au)
    af[af[(0xFF)]++] = ak;
}