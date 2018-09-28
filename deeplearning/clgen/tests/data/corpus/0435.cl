void fn_A(void) __attribute__((convergent)); void fn_B(void) __attribute__((convergent(1))); void fn_C(int A __attribute__((convergent))); void fn_D(void) {
  int A __attribute__((convergent));
}