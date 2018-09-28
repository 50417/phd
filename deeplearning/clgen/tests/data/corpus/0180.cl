__kernel void fn_A(__global int* A) {
  unsigned int B = get_global_id(0);
  while (B < get_global_id(0)) {
    if (B < 2) {
      if (B < 1) {
        return;
      }
    } else {
      for (int C = 0; C < 2; C++) {
        unsigned int D = C + 2;
        while (D < B) {
          D += 2;
        }
      }
    }
    B++;
  }
  *A = 0;
}