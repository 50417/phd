__kernel void fn_A(__global float* A, int B, int C, int D, int E) {
  int2 F = (int2)(get_global_id(0), get_global_id(1));

  if (F.x < 1) {
    (A)[((F.y) * D + (F.x))] = 0x1.fffffep127f;
  } else if (F.x < B && F.x > (B - (1 + E))) {
    (A)[((F.y) * D + (F.x))] = 0x1.fffffep127f;
  }
}