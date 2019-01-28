void A(event_t a); void kernel B() {
  event_t b;

  A(b);

  A(0);
}