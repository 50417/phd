kernel void fn_A(void) {
  local long A;
  local long B;
  local int* C = (local int*)&A;
  if (&A > &B)
    C++;
  *C = 0;
}