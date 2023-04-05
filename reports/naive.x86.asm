fast_matmul::naive::matmul:
 push    rbp
 push    r15
 push    r14
 push    r13
 push    r12
 push    rbx
 sub     rsp, 56
 mov     qword, ptr, [rsp, +, 8], rsi
 test    rdx, rdx
 je      .LBB15_12
 test    rdi, rdi
 je      .LBB15_12
 cmp     qword, ptr, [rsp, +, 8], 0
 je      .LBB15_12
 mov     r10, r9
 mov     rbx, qword, ptr, [rcx]
 mov     r14, qword, ptr, [rcx, +, 24]
 mov     rcx, qword, ptr, [rcx, +, 32]
 mov     r9, qword, ptr, [r8]
 mov     r12, qword, ptr, [r8, +, 24]
 mov     rax, qword, ptr, [r8, +, 32]
 mov     r11, qword, ptr, [r10]
 mov     rbp, qword, ptr, [r10, +, 24]
 mov     rsi, qword, ptr, [r10, +, 32]
 mov     qword, ptr, [rsp], rsi
 xor     r8d, r8d
 xor     r15d, r15d
 mov     qword, ptr, [rsp, +, 40], rdx
 mov     qword, ptr, [rsp, +, 32], r9
 mov     qword, ptr, [rsp, +, 24], r11
.LBB15_4:
 lea     rdx, [r15, +, 1]
 mov     qword, ptr, [rsp, +, 48], rdx
 imul    r9, r15
 mov     qword, ptr, [rsp, +, 16], r9
 imul    r15, r11
 xor     r10d, r10d
.LBB15_5:
 lea     r11, [r15, +, r10]
 cmp     r11, qword, ptr, [rsp]
 jae     .LBB15_13
 lea     rdx, [r10, +, 1]
 mov     rsi, qword, ptr, [rsp, +, 8]
 mov     r13, r8
.LBB15_7:
 cmp     r10, rcx
 jae     .LBB15_16
 cmp     r13, rax
 jae     .LBB15_17
 mov     r9, qword, ptr, [r12, +, 8*r13]
 imul    r9, qword, ptr, [r14, +, 8*r10]
 add     qword, ptr, [rbp, +, 8*r11], r9
 inc     r13
 add     r10, rbx
 dec     rsi
 jne     .LBB15_7
 mov     r10, rdx
 cmp     rdx, rdi
 jne     .LBB15_5
 mov     r9, qword, ptr, [rsp, +, 32]
 add     r8, r9
 mov     rdx, qword, ptr, [rsp, +, 40]
 mov     r15, qword, ptr, [rsp, +, 48]
 cmp     r15, rdx
 mov     r11, qword, ptr, [rsp, +, 24]
 jne     .LBB15_4
.LBB15_12:
 add     rsp, 56
 pop     rbx
 pop     r12
 pop     r13
 pop     r14
 pop     r15
 pop     rbp
 ret
.LBB15_13:
 cmp     r10, rcx
 jae     .LBB15_16
 mov     r13, qword, ptr, [rsp, +, 16]
 cmp     r13, rax
 jae     .LBB15_17
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.5]
 mov     rdi, r11
 mov     rsi, qword, ptr, [rsp]
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB15_16:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rdi, r10
 mov     rsi, rcx
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB15_17:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rdi, r13
 mov     rsi, rax
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
