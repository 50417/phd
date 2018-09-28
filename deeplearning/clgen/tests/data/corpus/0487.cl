typedef struct {
  char a;
  int b;
  int c;
  char d;
} S;

void fn_A(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].z = 42.f;
}

void fn_B(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].z = 7.f;
  B[C].y = 42.f;
}

void fn_C(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].zy = (float2)(7.f, 42.f);
}

void fn_D(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].y = B[C].z;
}

void fn_E(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].wzyx = B[C];
}

void fn_F(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].zy = B[C].yz;
}

void fn_G(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].wzyx = A[C];
}

void fn_H(global float4* A, global float4* B) {
  int C = get_global_id(0);
  B[C].zy = A[C].yz;
}

void fn_I(global float4* A, global float4* B) {
  int C = get_global_id(0);

  float4 D = B[C];
  D.z = 42.f;
  B[C] = D;
  B[C + 1] = D;
}

void fn_J(global S* A, global S* B) {
  int C = get_global_id(0);
  B[C].c = 42;
}

void fn_K(global S* A, global S* B) {
  int C = get_global_id(0);
  B[C].c = B[C].b;
}

void fn_L(global S* A, global S* B) {
  int C = get_global_id(0);
  B[C].c = A[C].b;
}

kernel void fn_M(global float4* A, global float4* B, global float4* C, global float4* D, global float4* E, global float4* F, global float4* G, global float4* H, global float4* I, global float4* J,

                 global S* K, global S* L, global S* M, global S* N,

                 global float* O) {
  fn_A(A, B);
  fn_B(A, C);
  fn_C(A, D);
  fn_D(A, E);
  fn_E(A, F);
  fn_F(A, G);
  fn_G(A, H);
  fn_H(A, I);
  fn_I(A, J);

  fn_J(K, L);
  fn_K(K, M);
  fn_L(K, N);
}