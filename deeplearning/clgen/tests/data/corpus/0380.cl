__kernel void fn_A(image2d_t A, global uint* B) {
  int C = get_global_id(0);
  int2 D = (int2)(get_simd_size() * get_sub_group_id() * sizeof(uint), 0);
  intel_sub_group_block_write_ui(A, D, B[C]);
}
__kernel void fn_B(image2d_t A, global uint2* B) {
  int C = get_global_id(0);
  int2 D = (int2)(get_simd_size() * get_sub_group_id() * sizeof(uint), 0);
  intel_sub_group_block_write_ui2(A, D, B[C]);
}

__kernel void fn_C(image2d_t A, global uint4* B) {
  int C = get_global_id(0);
  int2 D = (int2)(get_simd_size() * get_sub_group_id() * sizeof(uint), 0);
  intel_sub_group_block_write_ui4(A, D, B[C]);
}

__kernel void fn_D(image2d_t A, global uint8* B) {
  int C = get_global_id(0);
  int2 D = (int2)(get_simd_size() * get_sub_group_id() * sizeof(uint), 0);
  intel_sub_group_block_write_ui8(A, D, B[C]);
}