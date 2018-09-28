kernel void fn_A(global int* A) {
  event_t B = 0;
  wait_group_events(1, &B);
}