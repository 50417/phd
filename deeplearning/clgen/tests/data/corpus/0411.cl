kernel void fn_A() {
  barrier(1);
  barrier(2);
  mem_fence(1);
  mem_fence(2);
  read_mem_fence(1);
  read_mem_fence(2);
  write_mem_fence(1);
  write_mem_fence(2);
}