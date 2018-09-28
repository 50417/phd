void fn_A(event_t A); void kernel fn_B() {
  event_t A;

  fn_A(A);

  fn_A(0);

  fn_A((event_t)0);
}