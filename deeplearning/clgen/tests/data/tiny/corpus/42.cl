typedef struct channel {
  bool Red;
  bool Green;
  bool Blue;
} channel;

__kernel void A(__global unsigned char* a, __global unsigned char* b, unsigned c, __global unsigned char* d, __global unsigned char* e, __constant struct channel* f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  unsigned char i = b[h * c + g];
  unsigned char j = e[h * c + g];

  if (f->Red) {
    unsigned char k = a[(h * c + g) * 3];
    unsigned char l = d[(h * c + g) * 3];
    a[(h * c + g) * 3] = l * j / 255.0f + k * (255.0f - j) / 255.0f;
  } else {
    unsigned char k = a[(h * c + g) * 3];
    a[(h * c + g) * 3] = k * (255.0f - j) / 255.0f;
  }

  if (f->Green) {
    unsigned char k = a[(h * c + g) * 3 + 1];
    unsigned char l = d[(h * c + g) * 3 + 1];
    a[(h * c + g) * 3 + 1] = l * j / 255.0f + k * (255.0f - j) / 255.0f;
  } else {
    unsigned char k = a[(h * c + g) * 3 + 1];
    a[(h * c + g) * 3 + 1] = k * (255.0f - j) / 255.0f;
  }

  if (f->Blue) {
    unsigned char k = a[(h * c + g) * 3 + 2];
    unsigned char l = d[(h * c + g) * 3 + 2];
    a[(h * c + g) * 3 + 2] = l * j / 255.0f + k * (255.0f - j) / 255.0f;
  } else {
    unsigned char k = a[(h * c + g) * 3 + 2];
    a[(h * c + g) * 3 + 2] = k * (255.0f - j) / 255.0f;
  }

  b[h * c + g] = j + i * ((255.0f - j) / 255.0f);
}