__kernel void fn_A(int A) {
  while (A + 100 < 102) {
    if (get_local_id(0) < 5) {
      A = 2;
      break;
    }
  }
}