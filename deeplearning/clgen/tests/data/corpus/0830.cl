kernel void fn_A(global int* A, global int* B, int C) {
  int D = A[get_global_id(0)];

  for (int E = 0; E < 512; E++) {
    switch (D % 16) {
      case 0:
        D += (1 * 16) + 1;
        break;
      case 1:
        D += (34 * 16) + 1;
        break;
      case 2:
        D += (35 * 16) + 1;
        break;
      case 3:
        D += (284 * 16) + 1;
        break;
      case 4:
        D += (2486 * 16) + 1;
        break;
      case 5:
        D += (145 * 16) + 1;
        break;
      case 6:
        D += (234 * 16) + 1;
        break;
      case 7:
        D += (1224 * 16) + 1;
        break;
      case 8:
        D += (82365 * 16) + 1;
        break;
      case 9:
        D += (123456 * 16) + 1;
        break;
      case 10:
        D += (124 * 16) + 1;
        break;
      case 11:
        D += (823 * 16) + 1;
        break;
      case 12:
        D += (1178 * 16) + 1;
        break;
      case 13:
        D += (141 * 16) + 1;
        break;
      case 14:
        D += (134567 * 16) + 1;
        break;
      case 15:
        D += (2429 * 16) + 1;
        break;
      default:
        D += 1;
    }
  }

  B[get_global_id(0)] = D;
}