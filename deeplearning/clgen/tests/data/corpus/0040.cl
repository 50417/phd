void fn_A(void) __attribute__((convergent)); void fn_B(void); void fn_C(void) __attribute__((noduplicate)); void fn_D(void); void fn_E(void); void fn_F(int A) {
  if (A) {
    fn_D();
  }
  fn_B();
  if (A) {
    fn_E();
  }
}
void fn_G(int A) {
  if (A) {
    fn_D();
  }
  fn_A();
  if (A) {
    fn_E();
  }
}
void fn_H() {
  for (int A = 0; A < 10; A++)
    fn_A();
}
void fn_I() {
  for (int A = 0; A < 10; A++)
    fn_C();
}