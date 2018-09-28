__attribute__((amdgpu_num_vgpr(64))) kernel void fn_A() {
}

__attribute__((amdgpu_num_sgpr(32))) kernel void fn_B() {
}

__attribute__((amdgpu_num_vgpr(64), amdgpu_num_sgpr(32))) kernel void fn_C() {
}

__attribute__((amdgpu_num_sgpr(20), amdgpu_num_vgpr(40))) kernel void fn_D() {
}

__attribute__((amdgpu_num_vgpr(0))) kernel void fn_E() {
}

__attribute__((amdgpu_num_sgpr(0))) kernel void fn_F() {
}

__attribute__((amdgpu_num_vgpr(0), amdgpu_num_sgpr(0))) kernel void fn_G() {
}