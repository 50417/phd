typedef struct latLong {
  float lat;
  float lng;
} LatLong;

__kernel void fn_A(__global LatLong* A, __global float* B, const int C, const float D, const float E) {
  int F = get_global_id(0);

  if (F < C) {
    __global LatLong* G = A + F;

    __global float* H = B + F;
    *H = (float)sqrt((D - G->lat) * (D - G->lat) + (E - G->lng) * (E - G->lng));
  }
}