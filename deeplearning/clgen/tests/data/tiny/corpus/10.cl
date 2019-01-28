__constant uint a[] = {0x00000001U, 0x00000002U, 0x00000004U, 0x00000008U, 0x00000010U, 0x00000020U, 0x00000040U, 0x00000080U, 0x00000100U, 0x00000200U, 0x00000400U, 0x00000800U, 0x00001000U, 0x00002000U, 0x00004000U, 0x00008000U, 0x00010000U, 0x00020000U, 0x00040000U, 0x00080000U, 0x00100000U};

__constant uint b[] = {0x428a2f98U, 0x71374491U, 0xb5c0fbcfU, 0xe9b5dba5U, 0x3956c25bU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U, 0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U, 0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xc19bf174U, 0xe49b69c1U, 0xefbe4786U, 0x0fc19dc6U, 0x240ca1ccU, 0x2de92c6fU, 0x4a7484aaU, 0x5cb0a9dcU, 0x76f988daU, 0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U, 0xc6e00bf3U, 0xd5a79147U,
                       0x06ca6351U, 0x14292967U, 0x27b70a85U, 0x2e1b2138U, 0x4d2c6dfcU, 0x53380d13U, 0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U, 0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U, 0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U, 0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U, 0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U, 0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U,
                       0x90befffaU, 0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U, 0x98c7e2a2U, 0xfc08884dU, 0xcd2a11aeU, 0x510e527fU, 0x9b05688cU, 0xC3910C8EU, 0xfb6feee7U, 0x2a01a605U, 0x0c2e12e0U, 0x4498517BU, 0x6a09e667U, 0xa4ce148bU, 0x95F61999U, 0xBB67AE85U, 0x3C6EF372U, 0xA54FF53AU, 0x1F83D9ABU, 0x5BE0CD19U, 0x5C5C5C5CU, 0x36363636U, 0x80000000U, 0x000007FFU, 0x00000280U, 0x000004a0U, 0x00000300U};

__constant uint c[2] = {0x00FF00FF, 0xFF00FF00};
void A(uint4* restrict d, uint4* restrict e, const uint4 f, const uint4 g, const uint4 h, const uint4 i) {
 uint4 j[iint4 k = *d;
 uint4 l = *e;
 l.w += (rotate(l.x,26U) ^ rotate(l.x,21U) ^ rotate(l.x,7U)) + bitselect(l.z,l.y,l.x) + j[0].x+ b[0]; k.w += l.w; l.w += (rotate(k.x,30U) ^ rotate(k.x,19U) ^ rotate(k.x,10U)) + bitselect(k.z,k.y,(k.x^k.z));;
 l.z += (rotate(k.w,26U) ^ rotate(k.w,21U) ^ rotate(k.w,7U)) + bitselect(l.y,l.x,k.w) + j[0].y+ b[1]; k.z += l.z; l.z += (rotate(l.w,30U) ^ rotate(l.w,19U) ^ rotate(l.w,10U)) + bitselect(k.y,k.x,(l.w^k.y));;
 l.y += (rotate(k.z,26U) ^ rotate(k.z,21U) ^ rotate(k.z,7U)) + bitselect(l.x,k.w,k.z) + j[0].z+ b[2]; k.y += l.y; l.y += (rotate(l.z,30U) ^ rotate(l.z,19U) ^ rotate(l.z,10U)) + bitselect(k.x,l.w,(l.z^k.x));;
 l.x += (rotate(k.y,26U) ^ rotate(k.y,21U) ^ rotate(k.y,7U)) + bitselect(k.w,k.z,k.y) + j[0].w+ b[3]; k.x += l.x; l.x += (rotate(l.y,30U) ^ rotate(l.y,19U) ^ rotate(l.y,10U)) + bitselect(l.w,l.z,(l.y^l.w));;

 k.w += (rotate(k.x,26U) ^ rotate(k.x,21U) ^ rotate(k.x,7U)) + bitselect(k.z,k.y,k.x) + j[1].x+ b[4]; l.w += k.w; k.w += (rotate(l.x,30U) ^ rotate(l.x,19U) ^ rotate(l.x,10U)) + bitselect(l.z,l.y,(l.x^l.z));;
 k.z += (rotate(l.w,26U) ^ rotate(l.w,21U) ^ rotate(l.w,7U)) + bitselect(k.y,k.x,l.w) + j[1].y+ b[5]; l.z += k.z; k.z += (rotate(k.w,30U) ^ rotate(k.w,19U) ^ rotate(k.w,10U)) + bitselect(l.y,l.x,(k.w^l.y));;
 k.y += (rotate(l.z,26U) ^ rotate(l.z,21U) ^ rotate(l.z,7U)) + bitselect(k.x,l.w,l.z) + j[1].z+ b[6]; l.y += k.y; k.y += (rotate(k.z,30U) ^ rotate(k.z,19U) ^ rotate(k.z,10U)) + bitselect(l.x,k.w,(k.z^l.x));;
 k.x += (rotate(l.y,26U) ^ rotate(l.y,21U) ^ rotate(l.y,7U)) + bitselect(l.w,l.z,l.y) + j[1].w+ b[7]; l.x += k.x; k.x += (rotate(k.y,30U) ^ rotate(k.y,19U) ^ rotate(k.y,10U)) + bitselect(k.w,k.z,(k.y^k.w));;

 l.w += (rotate(l.x,26U) ^ rotate(l.x,21U) ^ rotate(l.x,7U)) + bitselect(l.z,l.y,l.x) + j[2].x+ b[8]; k.w += l.w; l.w += (rotate(k.x,30U) ^ rotate(k.x,19U) ^ rotate(k.x,10U)) + bitselect(k.z,k.y,(k.x^k.z));;
 l.z += (rotate(k.w,26U) ^ rotate(k.w,21U) ^ rotate(k.w,7U)) + bitselect(l.y,l.x,k.w) + j[2].y+ b[9]; k.z += l.z; l.z += (rotate(l.w,30U) ^ rotate(l.w,19U) ^ rotate(l.w,10U)) + bitselect(k.y,k.x,(l.w^k.y));;
 l.y += (rotate(k.z,26U) ^ rotate(k.z,21U) ^ rotate(k.z,7U)) + bitselect(l.x,k.w,k.z) + j[2].z+ b[10]; k.y += l.y; l.y += (rotate(l.z,30U) ^ rotate(l.z,19U) ^ rotate(l.z,10U)) + bitselect(k.x,l.w,(l.z^k.x));;
 l.x += (rotate(k.y,26U) ^ rotate(k.y,21U) ^ rotate(k.y,7U)) + bitselect(k.w,k.z,k.y) + j[2].w+ b[11]; k.x += l.x; l.x += (rotate(l.y,30U) ^ rotate(l.y,19U) ^ rotate(l.y,10U)) + bitselect(l.w,l.z,(l.y^l.w));;

 k.w += (rotate(k.x,26U) ^ rotate(k.x,21U) ^ rotate(k.x,7U)) + bitselect(k.z,k.y,k.x) + j[3].x+ b[12]; l.w += k.w; k.w += (rotate(l.x,30U) ^ rotate(l.x,19U) ^ rotate(l.x,10U)) + bitselect(l.z,l.y,(l.x^l.z));;
 k.z += (rotate(l.w,26U) ^ rotate(l.w,21U) ^ rotate(l.w,7U)) + bitselect(k.y,k.x,l.w) + j[3].y+ b[13]; l.z += k.z; k.z += (rotate(k.w,30U) ^ rotate(k.w,19U) ^ rotate(k.w,10U)) + bitselect(l.y,l.x,(k.w^l.y));;
 k.y += (rotate(l.z,26U) ^ rotate(l.z,21U) ^ rotate(l.z,7U)) + bitselect(k.x,l.w,l.z) + j[3].z+ b[14]; l.y += k.y; k.y += (rotate(k.z,30U) ^ rotate(k.z,19U) ^ rotate(k.z,10U)) + bitselect(l.x,k.w,(k.z^l.x));;
 k.x += (rotate(l.y,26U) ^ rotate(l.y,21U) ^ rotate(l.y,7U)) + bitselect(l.w,l.z,l.y) + j[3].w+ b[15]; l.x += k.x; k.x += (rotate(k.y,30U) ^ rotate(k.y,19U) ^ rotate(k.y,10U)) + bitselect(k.w,k.z,(k.y^k.w));;

 for (uint m = 16; m < 64; m+=16) {
    {
      uint4 n = (uint4)(j[0].y, j[0].z, j[0].w, j[(0 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(0 + 2 & 3U)].y, j[(0 + 2 & 3U)].z, j[(0 + 2 & 3U)].w, j[(0 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(0 + 3 & 3U)].z, j[(0 + 3 & 3U)].w, 0, 0);
      j[0] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[0] += (rotate((uint4)(0, 0, j[0].x, j[0].y), 15U) ^ rotate((uint4)(0, 0, j[0].x, j[0].y), 13U) ^ ((uint4)(0, 0, j[0].x, j[0].y) >> 10U));
    };
    l.w += (rotate(l.x, 26U) ^ rotate(l.x, 21U) ^ rotate(l.x, 7U)) + bitselect(l.z, l.y, l.x) + j[0].x + b[m];
    k.w += l.w;
    l.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U)) + bitselect(k.z, k.y, (k.x ^ k.z));
    ;
    l.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U)) + bitselect(l.y, l.x, k.w) + j[0].y + b[m + 1];
    k.z += l.z;
    l.z += (rotate(l.w, 30U) ^ rotate(l.w, 19U) ^ rotate(l.w, 10U)) + bitselect(k.y, k.x, (l.w ^ k.y));
    ;
    l.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U)) + bitselect(l.x, k.w, k.z) + j[0].z + b[m + 2];
    k.y += l.y;
    l.y += (rotate(l.z, 30U) ^ rotate(l.z, 19U) ^ rotate(l.z, 10U)) + bitselect(k.x, l.w, (l.z ^ k.x));
    ;
    l.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U)) + bitselect(k.w, k.z, k.y) + j[0].w + b[m + 3];
    k.x += l.x;
    l.x += (rotate(l.y, 30U) ^ rotate(l.y, 19U) ^ rotate(l.y, 10U)) + bitselect(l.w, l.z, (l.y ^ l.w));
    ;

    {
      uint4 n = (uint4)(j[1].y, j[1].z, j[1].w, j[(1 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(1 + 2 & 3U)].y, j[(1 + 2 & 3U)].z, j[(1 + 2 & 3U)].w, j[(1 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(1 + 3 & 3U)].z, j[(1 + 3 & 3U)].w, 0, 0);
      j[1] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[1] += (rotate((uint4)(0, 0, j[1].x, j[1].y), 15U) ^ rotate((uint4)(0, 0, j[1].x, j[1].y), 13U) ^ ((uint4)(0, 0, j[1].x, j[1].y) >> 10U));
    };
    k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U)) + bitselect(k.z, k.y, k.x) + j[1].x + b[m + 4];
    l.w += k.w;
    k.w += (rotate(l.x, 30U) ^ rotate(l.x, 19U) ^ rotate(l.x, 10U)) + bitselect(l.z, l.y, (l.x ^ l.z));
    ;
    k.z += (rotate(l.w, 26U) ^ rotate(l.w, 21U) ^ rotate(l.w, 7U)) + bitselect(k.y, k.x, l.w) + j[1].y + b[m + 5];
    l.z += k.z;
    k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U)) + bitselect(l.y, l.x, (k.w ^ l.y));
    ;
    k.y += (rotate(l.z, 26U) ^ rotate(l.z, 21U) ^ rotate(l.z, 7U)) + bitselect(k.x, l.w, l.z) + j[1].z + b[m + 6];
    l.y += k.y;
    k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U)) + bitselect(l.x, k.w, (k.z ^ l.x));
    ;
    k.x += (rotate(l.y, 26U) ^ rotate(l.y, 21U) ^ rotate(l.y, 7U)) + bitselect(l.w, l.z, l.y) + j[1].w + b[m + 7];
    l.x += k.x;
    k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U)) + bitselect(k.w, k.z, (k.y ^ k.w));
    ;

    {
      uint4 n = (uint4)(j[2].y, j[2].z, j[2].w, j[(2 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(2 + 2 & 3U)].y, j[(2 + 2 & 3U)].z, j[(2 + 2 & 3U)].w, j[(2 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(2 + 3 & 3U)].z, j[(2 + 3 & 3U)].w, 0, 0);
      j[2] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[2] += (rotate((uint4)(0, 0, j[2].x, j[2].y), 15U) ^ rotate((uint4)(0, 0, j[2].x, j[2].y), 13U) ^ ((uint4)(0, 0, j[2].x, j[2].y) >> 10U));
    };
    l.w += (rotate(l.x, 26U) ^ rotate(l.x, 21U) ^ rotate(l.x, 7U)) + bitselect(l.z, l.y, l.x) + j[2].x + b[m + 8];
    k.w += l.w;
    l.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U)) + bitselect(k.z, k.y, (k.x ^ k.z));
    ;
    l.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U)) + bitselect(l.y, l.x, k.w) + j[2].y + b[m + 9];
    k.z += l.z;
    l.z += (rotate(l.w, 30U) ^ rotate(l.w, 19U) ^ rotate(l.w, 10U)) + bitselect(k.y, k.x, (l.w ^ k.y));
    ;
    l.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U)) + bitselect(l.x, k.w, k.z) + j[2].z + b[m + 10];
    k.y += l.y;
    l.y += (rotate(l.z, 30U) ^ rotate(l.z, 19U) ^ rotate(l.z, 10U)) + bitselect(k.x, l.w, (l.z ^ k.x));
    ;
    l.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U)) + bitselect(k.w, k.z, k.y) + j[2].w + b[m + 11];
    k.x += l.x;
    l.x += (rotate(l.y, 30U) ^ rotate(l.y, 19U) ^ rotate(l.y, 10U)) + bitselect(l.w, l.z, (l.y ^ l.w));
    ;

    {
      uint4 n = (uint4)(j[3].y, j[3].z, j[3].w, j[(3 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(3 + 2 & 3U)].y, j[(3 + 2 & 3U)].z, j[(3 + 2 & 3U)].w, j[(3 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(3 + 3 & 3U)].z, j[(3 + 3 & 3U)].w, 0, 0);
      j[3] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[3] += (rotate((uint4)(0, 0, j[3].x, j[3].y), 15U) ^ rotate((uint4)(0, 0, j[3].x, j[3].y), 13U) ^ ((uint4)(0, 0, j[3].x, j[3].y) >> 10U));
    };
    k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U)) + bitselect(k.z, k.y, k.x) + j[3].x + b[m + 12];
    l.w += k.w;
    k.w += (rotate(l.x, 30U) ^ rotate(l.x, 19U) ^ rotate(l.x, 10U)) + bitselect(l.z, l.y, (l.x ^ l.z));
    ;
    k.z += (rotate(l.w, 26U) ^ rotate(l.w, 21U) ^ rotate(l.w, 7U)) + bitselect(k.y, k.x, l.w) + j[3].y + b[m + 13];
    l.z += k.z;
    k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U)) + bitselect(l.y, l.x, (k.w ^ l.y));
    ;
    k.y += (rotate(l.z, 26U) ^ rotate(l.z, 21U) ^ rotate(l.z, 7U)) + bitselect(k.x, l.w, l.z) + j[3].z + b[m + 14];
    l.y += k.y;
    k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U)) + bitselect(l.x, k.w, (k.z ^ l.x));
    ;
    k.x += (rotate(l.y, 26U) ^ rotate(l.y, 21U) ^ rotate(l.y, 7U)) + bitselect(l.w, l.z, l.y) + j[3].w + b[m + 15];
    l.x += k.x;
    k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U)) + bitselect(k.w, k.z, (k.y ^ k.w));
    ;
 }
 *d += k;
 *e += l;
}

void B(uint4* restrict d, uint4* restrict e, const uint4 f, const uint4 g, const uint4 h, const uint4 i) {
 uint4 j[i*d).w = b[64] +j[0].x;
 (*e).w = b[65] +j[0].x;

 (*d).z = b[66] +(rotate((*d).w,26U) ^ rotate((*d).w,21U) ^ rotate((*d).w,7U))+bitselect(b[68],b[67],(*d).w)+j[0].y;
 (*e).z = b[69] +(*d).z+(rotate((*e).w,30U) ^ rotate((*e).w,19U) ^ rotate((*e).w,10U))+bitselect(b[71],b[70],(*e).w);

 (*d).y = b[72] +(rotate((*d).z,26U) ^ rotate((*d).z,21U) ^ rotate((*d).z,7U))+bitselect(b[67],(*d).w,(*d).z)+j[0].z;
 (*e).y = b[73] +(*d).y+(rotate((*e).z,30U) ^ rotate((*e).z,19U) ^ rotate((*e).z,10U))+bitselect(b[74],(*e).w,((*e).z^b[74]));

 (*d).x = b[75] +(rotate((*d).y,26U) ^ rotate((*d).y,21U) ^ rotate((*d).y,7U))+bitselect((*d).w,(*d).z,(*d).y)+j[0].w;
 (*e).x = b[76] +(*d).x+(rotate((*e).y,30U) ^ rotate((*e).y,19U) ^ rotate((*e).y,10U))+bitselect((*e).w,(*e).z,((*e).y^(*e).w));

 (*d).w += (rotate((*d).x,26U) ^ rotate((*d).x,21U) ^ rotate((*d).x,7U)) + bitselect((*d).z,(*d).y,(*d).x) + j[1].x+ b[4]; (*e).w += (*d).w; (*d).w += (rotate((*e).x,30U) ^ rotate((*e).x,19U) ^ rotate((*e).x,10U)) + bitselect((*e).z,(*e).y,((*e).x^(*e).z));;
 (*d).z += (rotate((*e).w,26U) ^ rotate((*e).w,21U) ^ rotate((*e).w,7U)) + bitselect((*d).y,(*d).x,(*e).w) + j[1].y+ b[5]; (*e).z += (*d).z; (*d).z += (rotate((*d).w,30U) ^ rotate((*d).w,19U) ^ rotate((*d).w,10U)) + bitselect((*e).y,(*e).x,((*d).w^(*e).y));;
 (*d).y += (rotate((*e).z,26U) ^ rotate((*e).z,21U) ^ rotate((*e).z,7U)) + bitselect((*d).x,(*e).w,(*e).z) + j[1].z+ b[6]; (*e).y += (*d).y; (*d).y += (rotate((*d).z,30U) ^ rotate((*d).z,19U) ^ rotate((*d).z,10U)) + bitselect((*e).x,(*d).w,((*d).z^(*e).x));;
 (*d).x += (rotate((*e).y,26U) ^ rotate((*e).y,21U) ^ rotate((*e).y,7U)) + bitselect((*e).w,(*e).z,(*e).y) + j[1].w+ b[7]; (*e).x += (*d).x; (*d).x += (rotate((*d).y,30U) ^ rotate((*d).y,19U) ^ rotate((*d).y,10U)) + bitselect((*d).w,(*d).z,((*d).y^(*d).w));;

 (*e).w += (rotate((*e).x,26U) ^ rotate((*e).x,21U) ^ rotate((*e).x,7U)) + bitselect((*e).z,(*e).y,(*e).x) + j[2].x+ b[8]; (*d).w += (*e).w; (*e).w += (rotate((*d).x,30U) ^ rotate((*d).x,19U) ^ rotate((*d).x,10U)) + bitselect((*d).z,(*d).y,((*d).x^(*d).z));;
 (*e).z += (rotate((*d).w,26U) ^ rotate((*d).w,21U) ^ rotate((*d).w,7U)) + bitselect((*e).y,(*e).x,(*d).w) + j[2].y+ b[9]; (*d).z += (*e).z; (*e).z += (rotate((*e).w,30U) ^ rotate((*e).w,19U) ^ rotate((*e).w,10U)) + bitselect((*d).y,(*d).x,((*e).w^(*d).y));;
 (*e).y += (rotate((*d).z,26U) ^ rotate((*d).z,21U) ^ rotate((*d).z,7U)) + bitselect((*e).x,(*d).w,(*d).z) + j[2].z+ b[10]; (*d).y += (*e).y; (*e).y += (rotate((*e).z,30U) ^ rotate((*e).z,19U) ^ rotate((*e).z,10U)) + bitselect((*d).x,(*e).w,((*e).z^(*d).x));;
 (*e).x += (rotate((*d).y,26U) ^ rotate((*d).y,21U) ^ rotate((*d).y,7U)) + bitselect((*d).w,(*d).z,(*d).y) + j[2].w+ b[11]; (*d).x += (*e).x; (*e).x += (rotate((*e).y,30U) ^ rotate((*e).y,19U) ^ rotate((*e).y,10U)) + bitselect((*e).w,(*e).z,((*e).y^(*e).w));;

 (*d).w += (rotate((*d).x,26U) ^ rotate((*d).x,21U) ^ rotate((*d).x,7U)) + bitselect((*d).z,(*d).y,(*d).x) + j[3].x+ b[12]; (*e).w += (*d).w; (*d).w += (rotate((*e).x,30U) ^ rotate((*e).x,19U) ^ rotate((*e).x,10U)) + bitselect((*e).z,(*e).y,((*e).x^(*e).z));;
 (*d).z += (rotate((*e).w,26U) ^ rotate((*e).w,21U) ^ rotate((*e).w,7U)) + bitselect((*d).y,(*d).x,(*e).w) + j[3].y+ b[13]; (*e).z += (*d).z; (*d).z += (rotate((*d).w,30U) ^ rotate((*d).w,19U) ^ rotate((*d).w,10U)) + bitselect((*e).y,(*e).x,((*d).w^(*e).y));;
 (*d).y += (rotate((*e).z,26U) ^ rotate((*e).z,21U) ^ rotate((*e).z,7U)) + bitselect((*d).x,(*e).w,(*e).z) + j[3].z+ b[14]; (*e).y += (*d).y; (*d).y += (rotate((*d).z,30U) ^ rotate((*d).z,19U) ^ rotate((*d).z,10U)) + bitselect((*e).x,(*d).w,((*d).z^(*e).x));;
 (*d).x += (rotate((*e).y,26U) ^ rotate((*e).y,21U) ^ rotate((*e).y,7U)) + bitselect((*e).w,(*e).z,(*e).y) + j[3].w+ b[15]; (*e).x += (*d).x; (*d).x += (rotate((*d).y,30U) ^ rotate((*d).y,19U) ^ rotate((*d).y,10U)) + bitselect((*d).w,(*d).z,((*d).y^(*d).w));;

 for (uint m = 16; m < 64; m+=16) {
    {
      uint4 n = (uint4)(j[0].y, j[0].z, j[0].w, j[(0 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(0 + 2 & 3U)].y, j[(0 + 2 & 3U)].z, j[(0 + 2 & 3U)].w, j[(0 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(0 + 3 & 3U)].z, j[(0 + 3 & 3U)].w, 0, 0);
      j[0] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[0] += (rotate((uint4)(0, 0, j[0].x, j[0].y), 15U) ^ rotate((uint4)(0, 0, j[0].x, j[0].y), 13U) ^ ((uint4)(0, 0, j[0].x, j[0].y) >> 10U));
    };
    (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U)) + bitselect((*e).z, (*e).y, (*e).x) + j[0].x + b[m];
    (*d).w += (*e).w;
    (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U)) + bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
    ;
    (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U)) + bitselect((*e).y, (*e).x, (*d).w) + j[0].y + b[m + 1];
    (*d).z += (*e).z;
    (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U)) + bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
    ;
    (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U)) + bitselect((*e).x, (*d).w, (*d).z) + j[0].z + b[m + 2];
    (*d).y += (*e).y;
    (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U)) + bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
    ;
    (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U)) + bitselect((*d).w, (*d).z, (*d).y) + j[0].w + b[m + 3];
    (*d).x += (*e).x;
    (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U)) + bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
    ;

    {
      uint4 n = (uint4)(j[1].y, j[1].z, j[1].w, j[(1 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(1 + 2 & 3U)].y, j[(1 + 2 & 3U)].z, j[(1 + 2 & 3U)].w, j[(1 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(1 + 3 & 3U)].z, j[(1 + 3 & 3U)].w, 0, 0);
      j[1] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[1] += (rotate((uint4)(0, 0, j[1].x, j[1].y), 15U) ^ rotate((uint4)(0, 0, j[1].x, j[1].y), 13U) ^ ((uint4)(0, 0, j[1].x, j[1].y) >> 10U));
    };
    (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U)) + bitselect((*d).z, (*d).y, (*d).x) + j[1].x + b[m + 4];
    (*e).w += (*d).w;
    (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U)) + bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
    ;
    (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U)) + bitselect((*d).y, (*d).x, (*e).w) + j[1].y + b[m + 5];
    (*e).z += (*d).z;
    (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U)) + bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
    ;
    (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U)) + bitselect((*d).x, (*e).w, (*e).z) + j[1].z + b[m + 6];
    (*e).y += (*d).y;
    (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U)) + bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
    ;
    (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U)) + bitselect((*e).w, (*e).z, (*e).y) + j[1].w + b[m + 7];
    (*e).x += (*d).x;
    (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U)) + bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
    ;

    {
      uint4 n = (uint4)(j[2].y, j[2].z, j[2].w, j[(2 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(2 + 2 & 3U)].y, j[(2 + 2 & 3U)].z, j[(2 + 2 & 3U)].w, j[(2 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(2 + 3 & 3U)].z, j[(2 + 3 & 3U)].w, 0, 0);
      j[2] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[2] += (rotate((uint4)(0, 0, j[2].x, j[2].y), 15U) ^ rotate((uint4)(0, 0, j[2].x, j[2].y), 13U) ^ ((uint4)(0, 0, j[2].x, j[2].y) >> 10U));
    };
    (*e).w += (rotate((*e).x, 26U) ^ rotate((*e).x, 21U) ^ rotate((*e).x, 7U)) + bitselect((*e).z, (*e).y, (*e).x) + j[2].x + b[m + 8];
    (*d).w += (*e).w;
    (*e).w += (rotate((*d).x, 30U) ^ rotate((*d).x, 19U) ^ rotate((*d).x, 10U)) + bitselect((*d).z, (*d).y, ((*d).x ^ (*d).z));
    ;
    (*e).z += (rotate((*d).w, 26U) ^ rotate((*d).w, 21U) ^ rotate((*d).w, 7U)) + bitselect((*e).y, (*e).x, (*d).w) + j[2].y + b[m + 9];
    (*d).z += (*e).z;
    (*e).z += (rotate((*e).w, 30U) ^ rotate((*e).w, 19U) ^ rotate((*e).w, 10U)) + bitselect((*d).y, (*d).x, ((*e).w ^ (*d).y));
    ;
    (*e).y += (rotate((*d).z, 26U) ^ rotate((*d).z, 21U) ^ rotate((*d).z, 7U)) + bitselect((*e).x, (*d).w, (*d).z) + j[2].z + b[m + 10];
    (*d).y += (*e).y;
    (*e).y += (rotate((*e).z, 30U) ^ rotate((*e).z, 19U) ^ rotate((*e).z, 10U)) + bitselect((*d).x, (*e).w, ((*e).z ^ (*d).x));
    ;
    (*e).x += (rotate((*d).y, 26U) ^ rotate((*d).y, 21U) ^ rotate((*d).y, 7U)) + bitselect((*d).w, (*d).z, (*d).y) + j[2].w + b[m + 11];
    (*d).x += (*e).x;
    (*e).x += (rotate((*e).y, 30U) ^ rotate((*e).y, 19U) ^ rotate((*e).y, 10U)) + bitselect((*e).w, (*e).z, ((*e).y ^ (*e).w));
    ;

    {
      uint4 n = (uint4)(j[3].y, j[3].z, j[3].w, j[(3 + 1 & 3U)].x);
      uint4 o = (uint4)(j[(3 + 2 & 3U)].y, j[(3 + 2 & 3U)].z, j[(3 + 2 & 3U)].w, j[(3 + 3 & 3U)].x);
      uint4 p = (uint4)(j[(3 + 3 & 3U)].z, j[(3 + 3 & 3U)].w, 0, 0);
      j[3] += o + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3U)) + (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10U));
      j[3] += (rotate((uint4)(0, 0, j[3].x, j[3].y), 15U) ^ rotate((uint4)(0, 0, j[3].x, j[3].y), 13U) ^ ((uint4)(0, 0, j[3].x, j[3].y) >> 10U));
    };
    (*d).w += (rotate((*d).x, 26U) ^ rotate((*d).x, 21U) ^ rotate((*d).x, 7U)) + bitselect((*d).z, (*d).y, (*d).x) + j[3].x + b[m + 12];
    (*e).w += (*d).w;
    (*d).w += (rotate((*e).x, 30U) ^ rotate((*e).x, 19U) ^ rotate((*e).x, 10U)) + bitselect((*e).z, (*e).y, ((*e).x ^ (*e).z));
    ;
    (*d).z += (rotate((*e).w, 26U) ^ rotate((*e).w, 21U) ^ rotate((*e).w, 7U)) + bitselect((*d).y, (*d).x, (*e).w) + j[3].y + b[m + 13];
    (*e).z += (*d).z;
    (*d).z += (rotate((*d).w, 30U) ^ rotate((*d).w, 19U) ^ rotate((*d).w, 10U)) + bitselect((*e).y, (*e).x, ((*d).w ^ (*e).y));
    ;
    (*d).y += (rotate((*e).z, 26U) ^ rotate((*e).z, 21U) ^ rotate((*e).z, 7U)) + bitselect((*d).x, (*e).w, (*e).z) + j[3].z + b[m + 14];
    (*e).y += (*d).y;
    (*d).y += (rotate((*d).z, 30U) ^ rotate((*d).z, 19U) ^ rotate((*d).z, 10U)) + bitselect((*e).x, (*d).w, ((*d).z ^ (*e).x));
    ;
    (*d).x += (rotate((*e).y, 26U) ^ rotate((*e).y, 21U) ^ rotate((*e).y, 7U)) + bitselect((*e).w, (*e).z, (*e).y) + j[3].w + b[m + 15];
    (*e).x += (*d).x;
    (*d).x += (rotate((*d).y, 30U) ^ rotate((*d).y, 19U) ^ rotate((*d).y, 10U)) + bitselect((*d).w, (*d).z, ((*d).y ^ (*d).w));
    ;
 }
 *d += (uint4)(b[74], b[77], b[78], b[79]);
 *e += (uint4)(b[67], b[68], b[80], b[81]);
}

__constant uint q[64] = {
    0x428a2f99, 0xf1374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf794, 0xf59b89c2, 0x73924787, 0x23c6886e, 0xa42ca65c, 0x15ed3627, 0x4d6edcbf, 0xe28217fc, 0xef02488f, 0xb707775c, 0x0468c23f, 0xe7e72b4c, 0x49e1f1a2, 0x4b99c816, 0x926d1570, 0xaa0fc072, 0xadb36e2c,
    0xad87a3ea, 0xbcb1d3a3, 0x7b993186, 0x562b9420, 0xbff3ca0c, 0xda4b0c23, 0x6cd8711a, 0x8f337caa, 0xc91b1417, 0xc359dce1, 0xa83253a7, 0x3b13c12d, 0x9d3d725d, 0xd9031a84, 0xb1a03340, 0x16f58012, 0xe64fb6a2, 0xe84d923a, 0xe93a5730, 0x09837686, 0x078ff753, 0x29833341, 0xd5de0b7e, 0x6948ccf4, 0xe0a1adbe, 0x7c728e11, 0x511c78e4, 0x315b45bd, 0xfca71413, 0xea28f96a, 0x79703128, 0x4e1ef848,
};

void C(uint4* restrict d, uint4* restrict e) {
  uint4 k = *d;
  uint4 l = *e;
  for (uint m = 0; m < 64; m += 8) {
    l.w += (rotate(l.x, 26U) ^ rotate(l.x, 21U) ^ rotate(l.x, 7U)) + bitselect(l.z, l.y, l.x) + q[m];
    k.w += l.w;
    l.w += (rotate(k.x, 30U) ^ rotate(k.x, 19U) ^ rotate(k.x, 10U)) + bitselect(k.z, k.y, (k.x ^ k.z));
    ;
    l.z += (rotate(k.w, 26U) ^ rotate(k.w, 21U) ^ rotate(k.w, 7U)) + bitselect(l.y, l.x, k.w) + q[m + 1];
    k.z += l.z;
    l.z += (rotate(l.w, 30U) ^ rotate(l.w, 19U) ^ rotate(l.w, 10U)) + bitselect(k.y, k.x, (l.w ^ k.y));
    ;
    l.y += (rotate(k.z, 26U) ^ rotate(k.z, 21U) ^ rotate(k.z, 7U)) + bitselect(l.x, k.w, k.z) + q[m + 2];
    k.y += l.y;
    l.y += (rotate(l.z, 30U) ^ rotate(l.z, 19U) ^ rotate(l.z, 10U)) + bitselect(k.x, l.w, (l.z ^ k.x));
    ;
    l.x += (rotate(k.y, 26U) ^ rotate(k.y, 21U) ^ rotate(k.y, 7U)) + bitselect(k.w, k.z, k.y) + q[m + 3];
    k.x += l.x;
    l.x += (rotate(l.y, 30U) ^ rotate(l.y, 19U) ^ rotate(l.y, 10U)) + bitselect(l.w, l.z, (l.y ^ l.w));
    ;
    k.w += (rotate(k.x, 26U) ^ rotate(k.x, 21U) ^ rotate(k.x, 7U)) + bitselect(k.z, k.y, k.x) + q[m + 4];
    l.w += k.w;
    k.w += (rotate(l.x, 30U) ^ rotate(l.x, 19U) ^ rotate(l.x, 10U)) + bitselect(l.z, l.y, (l.x ^ l.z));
    ;
    k.z += (rotate(l.w, 26U) ^ rotate(l.w, 21U) ^ rotate(l.w, 7U)) + bitselect(k.y, k.x, l.w) + q[m + 5];
    l.z += k.z;
    k.z += (rotate(k.w, 30U) ^ rotate(k.w, 19U) ^ rotate(k.w, 10U)) + bitselect(l.y, l.x, (k.w ^ l.y));
    ;
    k.y += (rotate(l.z, 26U) ^ rotate(l.z, 21U) ^ rotate(l.z, 7U)) + bitselect(k.x, l.w, l.z) + q[m + 6];
    l.y += k.y;
    k.y += (rotate(k.z, 30U) ^ rotate(k.z, 19U) ^ rotate(k.z, 10U)) + bitselect(l.x, k.w, (k.z ^ l.x));
    ;
    k.x += (rotate(l.y, 26U) ^ rotate(l.y, 21U) ^ rotate(l.y, 7U)) + bitselect(l.w, l.z, l.y) + q[m + 7];
    l.x += k.x;
    k.x += (rotate(k.y, 30U) ^ rotate(k.y, 19U) ^ rotate(k.y, 10U)) + bitselect(k.w, k.z, (k.y ^ k.w));
    ;
  }
  *d += k;
  *e += l;
}

void D(uint4 r[8]) {
  uint m;
  uint4 s[4];
  s[0] = (uint4)(r[1].x, r[2].y, r[3].z, r[0].w);
  s[1] = (uint4)(r[2].x, r[3].y, r[0].z, r[1].w);
  s[2] = (uint4)(r[3].x, r[0].y, r[1].z, r[2].w);
  s[3] = (uint4)(r[0].x, r[1].y, r[2].z, r[3].w);

  for (m = 0; m < 4; ++m)
    r[m] = (rotate(s[m] & c[0], 24U) | rotate(s[m] & c[1], 8U));

  s[0] = (uint4)(r[5].x, r[6].y, r[7].z, r[4].w);
  s[1] = (uint4)(r[6].x, r[7].y, r[4].z, r[5].w);
  s[2] = (uint4)(r[7].x, r[4].y, r[5].z, r[6].w);
  s[3] = (uint4)(r[4].x, r[5].y, r[6].z, r[7].w);

  for (m = 0; m < 4; ++m)
    r[m + 4] = (rotate(s[m] & c[0], 24U) | rotate(s[m] & c[1], 8U));
}

void E(uint4 r[8]) {
  uint m;
  uint4 s[4];
  s[0] = (uint4)(r[3].x, r[2].y, r[1].z, r[0].w);
  s[1] = (uint4)(r[0].x, r[3].y, r[2].z, r[1].w);
  s[2] = (uint4)(r[1].x, r[0].y, r[3].z, r[2].w);
  s[3] = (uint4)(r[2].x, r[1].y, r[0].z, r[3].w);

  for (m = 0; m < 4; ++m)
    r[m] = (rotate(s[m] & c[0], 24U) | rotate(s[m] & c[1], 8U));

  s[0] = (uint4)(r[7].x, r[6].y, r[5].z, r[4].w);
  s[1] = (uint4)(r[4].x, r[7].y, r[6].z, r[5].w);
  s[2] = (uint4)(r[5].x, r[4].y, r[7].z, r[6].w);
  s[3] = (uint4)(r[6].x, r[5].y, r[4].z, r[7].w);

  for (m = 0; m < 4; ++m)
    r[m + 4] = (rotate(s[m] & c[0], 24U) | rotate(s[m] & c[1], 8U));
}

void F(uint4 r[8]) {
  uint m;
  uint4 t[4];

  for (m = 0; m < 4; ++m)
    t[m] = (r[m] ^= r[m + 4]);

  for (m = 0; m < 4; ++m) {
    t[0] ^= rotate(t[3] + t[2], 7U);
    t[1] ^= rotate(t[0] + t[3], 9U);
    t[2] ^= rotate(t[1] + t[0], 13U);
    t[3] ^= rotate(t[2] + t[1], 18U);
    t[2] ^= rotate(t[3].wxyz + t[0].zwxy, 7U);
    t[1] ^= rotate(t[2].wxyz + t[3].zwxy, 9U);
    t[0] ^= rotate(t[1].wxyz + t[2].zwxy, 13U);
    t[3] ^= rotate(t[0].wxyz + t[1].zwxy, 18U);
  }

  for (m = 0; m < 4; ++m)
    t[m] = (r[m + 4] ^= (r[m] += t[m]));

  for (m = 0; m < 4; ++m) {
    t[0] ^= rotate(t[3] + t[2], 7U);
    t[1] ^= rotate(t[0] + t[3], 9U);
    t[2] ^= rotate(t[1] + t[0], 13U);
    t[3] ^= rotate(t[2] + t[1], 18U);
    t[2] ^= rotate(t[3].wxyz + t[0].zwxy, 7U);
    t[1] ^= rotate(t[2].wxyz + t[3].zwxy, 9U);
    t[0] ^= rotate(t[1].wxyz + t[2].zwxy, 13U);
    t[3] ^= rotate(t[0].wxyz + t[1].zwxy, 18U);
  }

  for (m = 0; m < 4; ++m)
    r[m + 4] += t[m];
}

__constant uint u = 128 << 3;
void G(uint4 v[8], __global uint4* const restrict w, const uint x) {
  const uint y = popcount((uint)(16 - 1U));
  const uint z = a[x - 10];
  const uint aa = a[10 - y];
  const uint ab = rotate((uint)(get_global_id(0) % 128), 3U);
  uint ac = ab;
  uint m, ad, ae, af, ag;
  uint4 ah[8];

  D(v);

  for (af = 0; af < z; ++af) {
    for (m = 0; m < aa; ++m) {
      for (ae = 0; ae < 8; ++ae)
        w[ac + ae] = v[ae];

      for (ad = 0; ad < 16; ++ad)
        F(v);

      ac += u;
    }
  }

  for (af = 0; af < z; ++af) {
    for (m = 0; m < a[10]; ++m) {
      ad = mul24((v[7].x & (a[x] - 16)), (uint)(128));
      ac = ab + rotate(ad, 3U - y);
      ag = (v[7].x & (16 - 1U));

      for (ae = 0; ae < 8; ++ae)
        ah[ae] = w[ac + ae];

      for (ad = 0; ad < ag; ++ad)
        F(ah);

      for (ae = 0; ae < 8; ++ae)
        v[ae] ^= ah[ae];

      F(v);
    }
  }

  E(v);
}

__kernel void H(__global const uint4* const restrict ai, volatile __global uint* const restrict aj, __global uint4* const restrict ak, const uint4 al, const uint4 am, const uint an, const uint ao) {
  uint4 v[8];
  uint4 ap, aq, ar, as, at, n;
  uint4 au = (uint4)(ai.x, ai.y, ai.z, get_global_id(0));
  uint4 av = al, aw = am;

  A(&av, &aw, au, (uint4)(b[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, b[86]));
  B(&ar, &as, av ^ b[82], aw ^ b[82], b[82], b[82]);
  B(&ap, &aq, av ^ b[83], aw ^ b[83], b[83], b[83]);

  at = ap;
  n = aq;
  A(&ap, &aq, ai[0], ai[1], ai[2], ai[3]);

  for (uint m = 0; m < 4; ++m) {
    av = ap;
    aw = aq;
    v[rotate(m, 1U)] = ar;
    v[rotate(m, 1U) + 1] = as;

    A(&av, &aw, au, (uint4)(m + 1, b[84], 0U, 0U), (uint4)(0U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, b[87]));
    A(&v[rotate(m, 1U)], &v[rotate(m, 1U) + 1], av, aw, (uint4)(b[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, b[88]));
  }

  G(v, ak, ao);

  A(&at, &n, v[0], v[1], v[2], v[3]);
  A(&at, &n, v[4], v[5], v[6], v[7]);
  C(&at, &n);
  A(&ar, &as, at, n, (uint4)(b[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, b[88]));

  bool ax = (rotate(as.w & c[0], 24U) | rotate(as.w & c[1], 8U)) <= an;
  barrier(2);
  if (ax)
    aj[atomic_add(&aj[(0xFF)], 1)] = get_global_id(0);
  ;
}