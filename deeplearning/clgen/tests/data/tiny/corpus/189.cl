void A(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 g = *a;
  uint4 h = *b;
  uint4 i[4];

  i[0].x = c.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x428a2f98U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[0].y = c.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x71374491U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[0].z = c.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0xb5c0fbcfU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[0].w = c.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0xe9b5dba5U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x = d.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x3956c25bU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[1].y = d.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x59f111f1U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[1].z = d.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x923f82a4U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[1].w = d.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0xab1c5ed5U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x = e.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0xd807aa98U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[2].y = e.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0x12835b01U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[2].z = e.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0x243185beU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[2].w = e.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0x550c7dc3U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x = f.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0x72be5d74U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[3].y = f.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0x80deb1feU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[3].z = f.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0x9bdc06a7U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[3].w = f.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0xc19bf174U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0xe49b69c1U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0xefbe4786U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x0fc19dc6U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x240ca1ccU;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x2de92c6fU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x4a7484aaU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x5cb0a9dcU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x76f988daU;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0x983e5152U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0xa831c66dU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0xb00327c8U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0xbf597fc7U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0xc6e00bf3U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xd5a79147U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0x06ca6351U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0x14292967U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x27b70a85U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x2e1b2138U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x4d2c6dfcU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x53380d13U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x650a7354U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x766a0abbU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x81c2c92eU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x92722c85U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0xa2bfe8a1U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0xa81a664bU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0xc24b8b70U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0xc76c51a3U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0xd192e819U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xd6990624U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0xf40e3585U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0x106aa070U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x19a4c116U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x1e376c08U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x2748774cU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x34b0bcb5U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x391c0cb3U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x4ed8aa4aU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x5b9cca4fU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x682e6ff3U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0x748f82eeU;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0x78a5636fU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0x84c87814U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0x8cc70208U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0x90befffaU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xa4506cebU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0xbef9a3f7U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0xc67178f2U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  *a += g;
  *b += h;
}

void B(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 i[4];

  i[0].x = c.x;
  (*a).w = 0x98c7e2a2U + i[0].x;
  (*b).w = 0xfc08884dU + i[0].x;

  i[0].y = c.y;
  (*a).z = 0xcd2a11aeU + (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect(0x9b05688cU, 0x510e527fU, (*a).w) + i[0].y;
  (*b).z = 0xC3910C8EU + (*a).z + (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect(0x2a01a605U, 0xfb6feee7U, (*b).w);

  i[0].z = c.z;
  (*a).y = 0x0c2e12e0U + (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect(0x510e527fU, (*a).w, (*a).z) + i[0].z;
  (*b).y = 0x4498517BU + (*a).y + (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect(0x6a09e667U, (*b).w, ((*b).z ^ 0x6a09e667U));

  i[0].w = c.w;
  (*a).x = 0xa4ce148bU + (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[0].w;
  (*b).x = 0x95F61999U + (*a).x + (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));

  i[1].x = d.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[1].x + 0x3956c25bU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  i[1].y = d.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[1].y + 0x59f111f1U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  i[1].z = d.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[1].z + 0x923f82a4U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  i[1].w = d.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[1].w + 0xab1c5ed5U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[2].x = e.x;
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[2].x + 0xd807aa98U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;
  i[2].y = e.y;
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[2].y + 0x12835b01U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;
  i[2].z = e.z;
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[2].z + 0x243185beU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;
  i[2].w = e.w;
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[2].w + 0x550c7dc3U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[3].x = f.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[3].x + 0x72be5d74U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  i[3].y = f.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[3].y + 0x80deb1feU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  i[3].z = f.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[3].z + 0x9bdc06a7U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  i[3].w = f.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[3].w + 0xc19bf174U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[0].x + 0xe49b69c1U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[0].y + 0xefbe4786U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[0].z + 0x0fc19dc6U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[0].w + 0x240ca1ccU;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[1].x + 0x2de92c6fU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[1].y + 0x4a7484aaU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[1].z + 0x5cb0a9dcU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[1].w + 0x76f988daU;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[2].x + 0x983e5152U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[2].y + 0xa831c66dU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[2].z + 0xb00327c8U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[2].w + 0xbf597fc7U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[3].x + 0xc6e00bf3U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[3].y + 0xd5a79147U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[3].z + 0x06ca6351U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[3].w + 0x14292967U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[0].x + 0x27b70a85U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[0].y + 0x2e1b2138U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[0].z + 0x4d2c6dfcU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[0].w + 0x53380d13U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[1].x + 0x650a7354U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[1].y + 0x766a0abbU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[1].z + 0x81c2c92eU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[1].w + 0x92722c85U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[2].x + 0xa2bfe8a1U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[2].y + 0xa81a664bU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[2].z + 0xc24b8b70U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[2].w + 0xc76c51a3U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[3].x + 0xd192e819U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[3].y + 0xd6990624U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[3].z + 0xf40e3585U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[3].w + 0x106aa070U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[0].x + 0x19a4c116U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[0].y + 0x1e376c08U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[0].z + 0x2748774cU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[0].w + 0x34b0bcb5U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[1].x + 0x391c0cb3U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[1].y + 0x4ed8aa4aU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[1].z + 0x5b9cca4fU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[1].w + 0x682e6ff3U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + i[2].x + 0x748f82eeU;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + i[2].y + 0x78a5636fU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + i[2].z + 0x84c87814U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + i[2].w + 0x8cc70208U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + i[3].x + 0x90befffaU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + i[3].y + 0xa4506cebU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + i[3].z + 0xbef9a3f7U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + i[3].w + 0xc67178f2U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;
  *a += (uint4)(0x6A09E667U, 0xBB67AE85U, 0x3C6EF372U, 0xA54FF53AU);
  *b += (uint4)(0x510E527FU, 0x9B05688CU, 0x1F83D9ABU, 0x5BE0CD19U);
}

__constant uint j[64] = {
    0x428a2f99, 0xf1374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf794, 0xf59b89c2, 0x73924787, 0x23c6886e, 0xa42ca65c, 0x15ed3627, 0x4d6edcbf, 0xe28217fc, 0xef02488f, 0xb707775c, 0x0468c23f, 0xe7e72b4c, 0x49e1f1a2, 0x4b99c816, 0x926d1570, 0xaa0fc072, 0xadb36e2c,
    0xad87a3ea, 0xbcb1d3a3, 0x7b993186, 0x562b9420, 0xbff3ca0c, 0xda4b0c23, 0x6cd8711a, 0x8f337caa, 0xc91b1417, 0xc359dce1, 0xa83253a7, 0x3b13c12d, 0x9d3d725d, 0xd9031a84, 0xb1a03340, 0x16f58012, 0xe64fb6a2, 0xe84d923a, 0xe93a5730, 0x09837686, 0x078ff753, 0x29833341, 0xd5de0b7e, 0x6948ccf4, 0xe0a1adbe, 0x7c728e11, 0x511c78e4, 0x315b45bd, 0xfca71413, 0xea28f96a, 0x79703128, 0x4e1ef848,
};

void C(uint4* restrict a, uint4* restrict b) {
  uint4 g = *a;
  uint4 h = *b;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[0];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[1];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[2];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[3];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[4];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[5];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[6];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[7];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[8];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[9];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[10];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[11];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[12];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[13];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[14];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[15];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[16];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[17];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[18];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[19];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[20];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[21];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[22];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[23];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[24];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[25];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[26];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[27];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[28];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[29];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[30];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[31];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[32];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[33];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[34];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[35];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[36];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[37];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[38];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[39];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[40];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[41];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[42];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[43];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[44];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[45];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[46];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[47];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[48];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[49];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[50];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[51];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[52];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[53];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[54];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[55];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + j[56];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + j[57];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + j[58];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + j[59];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + j[60];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + j[61];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + j[62];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + j[63];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  *a += g;
  *b += h;
}

void D(uint4 k[8]) {
  uint4 l[4];
  l[0] = (uint4)(k[1].x, k[2].y, k[3].z, k[0].w);
  l[1] = (uint4)(k[2].x, k[3].y, k[0].z, k[1].w);
  l[2] = (uint4)(k[3].x, k[0].y, k[1].z, k[2].w);
  l[3] = (uint4)(k[0].x, k[1].y, k[2].z, k[3].w);

  for (uint m = 0; m < 4; ++m)
    k[m] = (rotate(l[m] & 0x00FF00FF, 24U) | rotate(l[m] & 0xFF00FF00, 8U));

  l[0] = (uint4)(k[5].x, k[6].y, k[7].z, k[4].w);
  l[1] = (uint4)(k[6].x, k[7].y, k[4].z, k[5].w);
  l[2] = (uint4)(k[7].x, k[4].y, k[5].z, k[6].w);
  l[3] = (uint4)(k[4].x, k[5].y, k[6].z, k[7].w);

  for (uint m = 0; m < 4; ++m)
    k[m + 4] = (rotate(l[m] & 0x00FF00FF, 24U) | rotate(l[m] & 0xFF00FF00, 8U));
}

void E(uint4 k[8]) {
  uint4 l[4];
  l[0] = (uint4)(k[3].x, k[2].y, k[1].z, k[0].w);
  l[1] = (uint4)(k[0].x, k[3].y, k[2].z, k[1].w);
  l[2] = (uint4)(k[1].x, k[0].y, k[3].z, k[2].w);
  l[3] = (uint4)(k[2].x, k[1].y, k[0].z, k[3].w);

  for (uint m = 0; m < 4; ++m)
    k[m] = (rotate(l[m] & 0x00FF00FF, 24U) | rotate(l[m] & 0xFF00FF00, 8U));

  l[0] = (uint4)(k[7].x, k[6].y, k[5].z, k[4].w);
  l[1] = (uint4)(k[4].x, k[7].y, k[6].z, k[5].w);
  l[2] = (uint4)(k[5].x, k[4].y, k[7].z, k[6].w);
  l[3] = (uint4)(k[6].x, k[5].y, k[4].z, k[7].w);

  for (uint m = 0; m < 4; ++m)
    k[m + 4] = (rotate(l[m] & 0x00FF00FF, 24U) | rotate(l[m] & 0xFF00FF00, 8U));
}

void F(uint4 k[8]) {
  uint4 n[4];

  for (uint m = 0; m < 4; ++m)
    n[m] = (k[m] ^= k[m + 4]);

  for (uint m = 0; m < 4; ++m) {
    n[0] ^= rotate(n[3] + n[2], 7U);
    n[1] ^= rotate(n[0] + n[3], 9U);
    n[2] ^= rotate(n[1] + n[0], 13U);
    n[3] ^= rotate(n[2] + n[1], 18U);
    n[2] ^= rotate(n[3].wxyz + n[0].zwxy, 7U);
    n[1] ^= rotate(n[2].wxyz + n[3].zwxy, 9U);
    n[0] ^= rotate(n[1].wxyz + n[2].zwxy, 13U);
    n[3] ^= rotate(n[0].wxyz + n[1].zwxy, 18U);
  }

  for (uint m = 0; m < 4; ++m)
    n[m] = (k[m + 4] ^= (k[m] += n[m]));

  for (uint m = 0; m < 4; ++m) {
    n[0] ^= rotate(n[3] + n[2], 7U);
    n[1] ^= rotate(n[0] + n[3], 9U);
    n[2] ^= rotate(n[1] + n[0], 13U);
    n[3] ^= rotate(n[2] + n[1], 18U);
    n[2] ^= rotate(n[3].wxyz + n[0].zwxy, 7U);
    n[1] ^= rotate(n[2].wxyz + n[3].zwxy, 9U);
    n[0] ^= rotate(n[1].wxyz + n[2].zwxy, 13U);
    n[3] ^= rotate(n[0].wxyz + n[1].zwxy, 18U);
  }

  for (uint m = 0; m < 4; ++m)
    k[m + 4] += n[m];
}

void G(uint4 o[8], __global uint4* restrict p) {
  D(o);
  const uint q = 8;
  const uint r = (1024 / 16 + (1024 % 16 > 0));
  const uint s = 128;
  uint t = get_global_id(0) % s;

  for (uint u = 0; u < 1024 / 16; ++u) {
    for (uint v = 0; v < q; ++v)
      p[v + t * (q) + u * (s) * (q)] = o[v];
    for (uint m = 0; m < 16; ++m)
      F(o);
  }

  {
    uint u = (1024 / 16);
    for (uint v = 0; v < q; ++v)
      p[v + t * (q) + u * (s) * (q)] = o[v];
    for (uint m = 0; m < 1024 % 16; ++m)
      F(o);
  }

  for (uint m = 0; m < 1024; ++m) {
    uint4 w[8];
    uint x = o[7].x & 0x3FF;
    uint u = (x / 16);
    for (uint v = 0; v < q; ++v)
      w[v] = p[v + t * (q) + u * (s) * (q)];

    uint y = x % 16;
    for (uint v = 0; v < y; ++v)
      F(w);

    for (uint v = 0; v < q; ++v)
      o[v] ^= w[v];
    F(o);
  }
  E(o);
}

__kernel void H(__global const uint4* restrict z, __global uint* restrict aa, __global uint4* restrict ab, const uint4 ac, const uint4 ad, const uint ae) {
  uint af = get_global_id(0);
  uint4 o[8];
  uint4 ag, ah, ai, aj, ak, al;
 uint4 am = (uint4)(zx,zy,zz,af;
 uint4 an = ac, ao = ad;

 A(&an,&ao, am, (uint4)(0x80000000U,0,0,0), (uint4)(0,0,0,0), (uint4)(0,0,0,0x280));
 B(&ai,&aj, an^0x5C5C5C5CU, ao^0x5C5C5C5CU, 0x5C5C5C5CU, 0x5C5C5C5CU);
 B(&ag,&ah, an^0x36363636U, ao^0x36363636U, 0x36363636U, 0x36363636U);

 ak = ag;
 al = ah;
 A(&ag, &ah, z[0],z[1],z[2],z[3]);

 for (uint m=0; m<4; m++)
 {
    an = ag;
    ao = ah;
    o[m * 2] = ai;
    o[m * 2 + 1] = aj;

    A(&an, &ao, am, (uint4)(m + 1, 0x80000000U, 0, 0), (uint4)(0, 0, 0, 0), (uint4)(0, 0, 0, 0x4a0U));
    A(o + m * 2, o + m * 2 + 1, an, ao, (uint4)(0x80000000U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, 0x300U));
 }
 G(o,ab);
 A(&ak,&al, o[0], o[1], o[2], o[3]);
 A(&ak,&al, o[4], o[5], o[6], o[7]);
 C(&ak,&al);
 A(&ai,&aj, ak, al, (uint4)(0x80000000U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, 0x300U));

 bool ap = ((rotate(aj.w&0x00FF00FF,24U)|rotate(aj.w&0xFF00FF00,8U)) <= ae);
 if (ap)
  aa[(0x800)] = aa[(0x7FF) & af] = af;
}