ulong fn_A(ulong* A) {
  return 1;
}

kernel void fn_B(global ulong* A) {
  *A = fn_A((void*)0);
}