__attribute__((overloadable)) void fn_A(int* A) {
}

__attribute__((overloadable)) void fn_B(private int* A) {
}

__attribute__((overloadable)) void fn_B(global int* A) {
}

__attribute__((overloadable)) void fn_B(local int* A) {
}

__attribute__((overloadable)) void fn_B(constant int* A) {
}