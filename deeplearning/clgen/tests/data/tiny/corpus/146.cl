typedef unsigned char uchar4; typedef unsigned char uchar8; void A(uchar8 a) {
  uchar4 b[4] = {{(uchar4){a.lo}}};
}