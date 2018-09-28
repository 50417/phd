constant char* __constant gb_A = "hello world"; void fn_A(__constant char* A) {
}

void fn_B() {
  fn_A("hello world");
  fn_A(gb_A);
}