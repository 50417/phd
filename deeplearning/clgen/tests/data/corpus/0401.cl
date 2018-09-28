kernel void fn_A(global long* A, global long* B, global long* C) {
  int D = get_global_id(0);
  switch (D) {
    case 0:
      C[D] = 0xFEDCBA9876543210UL;
      break;
    case 1:
      C[D] = A[D] & B[D];
      break;
    case 2:
      C[D] = A[D] | B[D];
      break;
    case 3:
      C[D] = A[D] ^ B[D];
      break;
    case 4:
      C[D] = A[D] ? 0x1122334455667788L : 0x8877665544332211UL;
      break;
  }
}