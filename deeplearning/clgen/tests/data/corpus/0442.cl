size_t fn_A(private char* A) {
  return (size_t)A;
}

intptr_t fn_B(global char* A) {
  return (intptr_t)A;
}

uintptr_t fn_C(constant char* A) {
  return (uintptr_t)A;
}

size_t fn_D(local char* A) {
  return (size_t)A;
}

size_t fn_E(char* A) {
  return (size_t)A;
}

private
char* fn_F(size_t A) {
  return (private char*)A;
}

global char* fn_G(size_t A) {
  return (global char*)A;
}

local char* fn_H(local char* A, ptrdiff_t B) {
  return A + B;
}

global char* fn_I(global char* A, ptrdiff_t B) {
  return A + B;
}

ptrdiff_t fn_J(local char* A, local char* B) {
  return A - B;
}

ptrdiff_t fn_K(private char* A, private char* B) {
  return A - B;
}

ptrdiff_t fn_L(private char* A, char* B) {
  return A - B;
}