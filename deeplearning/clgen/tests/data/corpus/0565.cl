constant float gb_A = 0x1.921fb6p+1f * 2.0f; constant float gb_B = (439.0f * 0x1.921fb6p+1f) / 44100.0f; constant float gb_C = (441.0f * 0x1.921fb6p+1f) / 44100.0f; kernel void fn_A(int A, global float* B) {
  const int C = get_global_id(0);

  B[C] = ((C + 1) % 2) * sin((A + C) * gb_B) + (C % 2) * sin((A + C - 1) * gb_C);
}