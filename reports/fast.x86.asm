fast_matmul::fast::matmul:
 push    rbp
 push    r15
 push    r14
 push    r13
 push    r12
 push    rbx
 sub     rsp, 264
 mov     qword, ptr, [rsp, +, 152], rdi
 mov     r11, qword, ptr, [r8]
 mov     rdi, qword, ptr, [r8, +, 24]
 mov     r14, qword, ptr, [r8, +, 32]
 mov     rax, qword, ptr, [rcx]
 mov     qword, ptr, [rsp, +, 160], rax
 mov     rax, qword, ptr, [rcx, +, 24]
 mov     qword, ptr, [rsp, +, 256], rax
 mov     rax, qword, ptr, [rcx, +, 32]
 mov     qword, ptr, [rsp, +, 184], rax
 mov     rax, qword, ptr, [r9]
 mov     qword, ptr, [rsp, +, 176], rax
 mov     r13, qword, ptr, [r9, +, 24]
 mov     rbp, qword, ptr, [r9, +, 32]
 xor     eax, eax
 xor     r8d, r8d
 mov     qword, ptr, [rsp, +, 16], rsi
 mov     qword, ptr, [rsp, +, 40], r11
 test    al, 1
 je      .LBB9_4
.LBB9_2:
 add     r8, 19
 setb    al
 cmp     r8, rdx
 setae   cl
 or      cl, al
 lea     rax, [r8, +, 1]
 cmovne  rax, rdx
 je      .LBB9_5
 jmp     .LBB9_3
.LBB9_4:
 cmp     r8, rdx
 mov     rax, r8
 adc     rax, 0
 cmp     r8, rdx
 jae     .LBB9_3
.LBB9_5:
 mov     qword, ptr, [rsp, +, 136], rax
 mov     qword, ptr, [rsp, +, 72], rdi
 lea     rax, [r8, +, 20]
 cmp     rax, rdx
 mov     qword, ptr, [rsp, +, 144], rdx
 cmovae  rax, rdx
 mov     qword, ptr, [rsp, +, 168], rax
 mov     rdx, rax
 sub     rdx, r8
 mov     rax, r11
 mov     qword, ptr, [rsp, +, 80], r8
 imul    rax, r8
 mov     qword, ptr, [rsp, +, 240], rax
 xor     ecx, ecx
 xor     ebx, ebx
.LBB9_6:
 test    bl, 1
 je      .LBB9_9
 add     rcx, 19
 mov     rdi, rcx
 setb    al
 cmp     rcx, rsi
 setae   cl
 or      cl, al
 mov     r8, rdi
 lea     rax, [rdi, +, 1]
 cmovne  rax, rsi
 mov     rdi, qword, ptr, [rsp, +, 72]
 je      .LBB9_10
 jmp     .LBB9_8
.LBB9_9:
 cmp     rcx, rsi
 mov     rax, rcx
 adc     rax, 0
 mov     r8, rcx
 cmp     rcx, rsi
 mov     rdi, qword, ptr, [rsp, +, 72]
 jae     .LBB9_8
.LBB9_10:
 mov     qword, ptr, [rsp, +, 8], r8
 mov     qword, ptr, [rsp, +, 120], rax
 lea     rax, [r8, +, 20]
 cmp     rax, rsi
 cmovae  rax, rsi
 mov     qword, ptr, [rsp, +, 96], rax
 sub     rax, r8
 mov     r8, rax
 mov     r12, rax
 imul    r12, rdx
 test    r12, r12
 mov     qword, ptr, [rsp, +, 32], rax
 mov     qword, ptr, [rsp, +, 128], rdx
 je      .LBB9_11
 xor     ebx, ebx
 movabs  rax, 1152921504606846976
 cmp     r12, rax
 setb    al
 jae     .LBB9_79
 lea     rdi, [8*r12]
 mov     bl, al
 shl     rbx, 3
 test    rdi, rdi
 mov     qword, ptr, [rsp, +, 24], rdi
 je      .LBB9_14
 mov     rsi, rbx
 call    qword, ptr, [rip, +, __rust_alloc_zeroed@GOTPCREL]
 mov     r8, qword, ptr, [rsp, +, 32]
 mov     r11, qword, ptr, [rsp, +, 40]
 mov     rsi, qword, ptr, [rsp, +, 16]
 mov     r15, rax
 test    r15, r15
 je      .LBB9_80
.LBB9_17:
 mov     rax, qword, ptr, [rsp, +, 168]
 cmp     rax, qword, ptr, [rsp, +, 80]
 mov     rbx, qword, ptr, [rsp, +, 72]
 ja      .LBB9_18
 jmp     .LBB9_25
.LBB9_11:
 mov     r15d, 8
 mov     rax, qword, ptr, [rsp, +, 168]
 cmp     rax, qword, ptr, [rsp, +, 80]
 mov     rbx, qword, ptr, [rsp, +, 72]
 jbe     .LBB9_25
.LBB9_18:
 mov     rax, qword, ptr, [rsp, +, 96]
 cmp     rax, qword, ptr, [rsp, +, 8]
 jbe     .LBB9_25
 mov     rax, qword, ptr, [rsp, +, 240]
 mov     rcx, qword, ptr, [rsp, +, 8]
 add     rcx, rax
 xor     edx, edx
 mov     r10, qword, ptr, [rsp, +, 80]
.LBB9_20:
 inc     r10
 mov     rdi, rcx
 mov     rax, rdx
.LBB9_21:
 cmp     rdi, r14
 jae     .LBB9_30
 cmp     rax, r12
 jae     .LBB9_31
 mov     r9, qword, ptr, [rbx, +, 8*rdi]
 mov     qword, ptr, [r15, +, 8*rax], r9
 inc     rax
 inc     rdi
 dec     r8
 jne     .LBB9_21
 mov     r8, qword, ptr, [rsp, +, 32]
 add     rdx, r8
 add     rcx, r11
 cmp     r10, qword, ptr, [rsp, +, 168]
 jne     .LBB9_20
.LBB9_25:
 mov     rax, qword, ptr, [rsp, +, 160]
 mov     rdi, qword, ptr, [rsp, +, 8]
 imul    rax, rdi
 mov     qword, ptr, [rsp, +, 232], rax
 xor     ecx, ecx
 xor     eax, eax
.LBB9_26:
 test    al, 1
 je      .LBB9_32
 add     rcx, 19
 mov     r9, rcx
 setb    al
 mov     rdx, qword, ptr, [rsp, +, 152]
 cmp     rcx, rdx
 setae   cl
 or      cl, al
 mov     r10, r9
 lea     rax, [r9, +, 1]
 cmovne  rax, rdx
 je      .LBB9_28
 jmp     .LBB9_33
.LBB9_32:
 mov     rdx, qword, ptr, [rsp, +, 152]
 cmp     rcx, rdx
 mov     rax, rcx
 adc     rax, 0
 mov     r10, rcx
 cmp     rcx, rdx
 jae     .LBB9_33
.LBB9_28:
 lea     rbx, [r10, +, 20]
 cmp     rbx, rdx
 cmovae  rbx, rdx
 mov     qword, ptr, [rsp, +, 56], rbx
 sub     rbx, r10
 mov     qword, ptr, [rsp, +, 88], rbx
 imul    rbx, r8
 test    rbx, rbx
 mov     qword, ptr, [rsp, +, 208], rax
 mov     qword, ptr, [rsp, +, 48], r10
 je      .LBB9_29
 xor     ecx, ecx
 movabs  rax, 1152921504606846976
 cmp     rbx, rax
 setb    al
 jae     .LBB9_79
 mov     rdx, rdi
 lea     rdi, [8*rbx]
 mov     cl, al
 shl     rcx, 3
 test    rdi, rdi
 mov     qword, ptr, [rsp, +, 24], rcx
 mov     qword, ptr, [rsp, +, 64], rdi
 je      .LBB9_37
 mov     rsi, rcx
 call    qword, ptr, [rip, +, __rust_alloc_zeroed@GOTPCREL]
 mov     rdi, qword, ptr, [rsp, +, 8]
 mov     rsi, qword, ptr, [rsp, +, 16]
 mov     r10, rax
 test    r10, r10
 je      .LBB9_81
.LBB9_40:
 cmp     qword, ptr, [rsp, +, 96], rdi
 mov     rdi, qword, ptr, [rsp, +, 88]
 ja      .LBB9_41
 jmp     .LBB9_48
.LBB9_29:
 mov     r10d, 8
 cmp     qword, ptr, [rsp, +, 96], rdi
 mov     rdi, qword, ptr, [rsp, +, 88]
 jbe     .LBB9_48
.LBB9_41:
 mov     rax, qword, ptr, [rsp, +, 56]
 cmp     rax, qword, ptr, [rsp, +, 48]
 jbe     .LBB9_48
 mov     rax, qword, ptr, [rsp, +, 232]
 mov     rcx, qword, ptr, [rsp, +, 48]
 add     rax, rcx
 xor     edx, edx
 mov     r11, qword, ptr, [rsp, +, 8]
.LBB9_43:
 inc     r11
 mov     r8, rdi
 mov     rdi, rax
 mov     rcx, rdx
.LBB9_44:
 cmp     rdi, qword, ptr, [rsp, +, 184]
 jae     .LBB9_53
 cmp     rcx, rbx
 jae     .LBB9_54
 mov     r9, qword, ptr, [rsp, +, 256]
 mov     r9, qword, ptr, [r9, +, 8*rdi]
 mov     qword, ptr, [r10, +, 8*rcx], r9
 inc     rcx
 inc     rdi
 dec     r8
 jne     .LBB9_44
 mov     rdi, qword, ptr, [rsp, +, 88]
 add     rdx, rdi
 add     rax, qword, ptr, [rsp, +, 160]
 cmp     r11, qword, ptr, [rsp, +, 96]
 jne     .LBB9_43
.LBB9_48:
 mov     rcx, qword, ptr, [rsp, +, 56]
 shl     rcx, 3
 mov     rax, qword, ptr, [rsp, +, 48]
 lea     rax, [8*rax]
 sub     rcx, rax
 mov     qword, ptr, [rsp, +, 56], rcx
 xor     r11d, r11d
 xor     r9d, r9d
 mov     r8, qword, ptr, [rsp, +, 32]
.LBB9_49:
 test    r9b, 1
 je      .LBB9_56
 add     r11, 19
 setb    al
 cmp     r11, 20
 setae   cl
 or      cl, al
 mov     rdx, r11
 lea     r11, [r11, +, 1]
 mov     ecx, 20
 cmovne  r11, rcx
 je      .LBB9_57
 jmp     .LBB9_51
.LBB9_56:
 cmp     r11, 20
 mov     rax, r11
 adc     rax, 0
 mov     rdx, r11
 cmp     r11, 19
 mov     r11, rax
 ja      .LBB9_51
.LBB9_57:
 mov     r9b, 1
 cmp     rdx, 19
 ja      .LBB9_49
 mov     qword, ptr, [rsp, +, 104], r14
 mov     rax, qword, ptr, [rsp, +, 80]
 mov     qword, ptr, [rsp, +, 64], rdx
 add     rdx, rax
 imul    rdx, qword, ptr, [rsp, +, 176]
 add     rdx, qword, ptr, [rsp, +, 48]
 xor     r14d, r14d
 xor     eax, eax
 test    al, 1
 je      .LBB9_62
.LBB9_60:
 add     r14, 19
 setb    al
 cmp     r14, 20
 setae   cl
 or      cl, al
 lea     rcx, [r14, +, 1]
 mov     eax, 20
 cmovne  rcx, rax
 mov     qword, ptr, [rsp, +, 112], rcx
 je      .LBB9_64
 jmp     .LBB9_61
.LBB9_62:
 cmp     r14, 20
 mov     rax, r14
 adc     rax, 0
 mov     qword, ptr, [rsp, +, 112], rax
 cmp     r14, 19
 ja      .LBB9_63
.LBB9_64:
 mov     qword, ptr, [rsp, +, 200], r11
 mov     qword, ptr, [rsp, +, 192], rdx
 add     rdx, r14
 mov     rax, r10
 xor     r9d, r9d
 mov     rsi, r14
 xor     r14d, r14d
 mov     qword, ptr, [rsp, +, 224], rdx
.LBB9_65:
 lea     rcx, [r14, +, 1]
 mov     qword, ptr, [rsp, +, 248], rcx
 mov     rcx, r14
 imul    rcx, rdi
 mov     qword, ptr, [rsp, +, 216], rcx
 mov     r11, qword, ptr, [rsp, +, 64]
 mov     qword, ptr, [rsp, +, 24], r14
.LBB9_66:
 mov     rdi, r11
 imul    rdi, r8
 add     rdi, r14
 cmp     rdi, r12
 jae     .LBB9_75
 inc     r11
 mov     rcx, rdx
 mov     r14, rsi
 mov     r8, rsi
.LBB9_68:
 lea     rsi, [r9, +, r8]
 cmp     rsi, rbx
 jae     .LBB9_74
 cmp     rcx, rbp
 jae     .LBB9_78
 mov     rsi, qword, ptr, [rax, +, 8*r8]
 imul    rsi, qword, ptr, [r15, +, 8*rdi]
 add     qword, ptr, [r13, +, 8*rcx], rsi
 inc     r8
 inc     rcx
 cmp     r8, 20
 jne     .LBB9_68
 add     rdx, qword, ptr, [rsp, +, 176]
 cmp     r11, 20
 mov     r8, qword, ptr, [rsp, +, 32]
 mov     rsi, r14
 mov     r14, qword, ptr, [rsp, +, 24]
 jne     .LBB9_66
 mov     rdi, qword, ptr, [rsp, +, 88]
 add     r9, rdi
 add     rax, qword, ptr, [rsp, +, 56]
 mov     rcx, qword, ptr, [rsp, +, 248]
 mov     r14, rcx
 cmp     rcx, 20
 mov     rdx, qword, ptr, [rsp, +, 224]
 jne     .LBB9_65
 mov     al, 1
 mov     r14, qword, ptr, [rsp, +, 112]
 mov     rsi, qword, ptr, [rsp, +, 16]
 mov     r11, qword, ptr, [rsp, +, 200]
 mov     r9b, 1
 mov     rdx, qword, ptr, [rsp, +, 192]
 test    al, 1
 je      .LBB9_62
 jmp     .LBB9_60
.LBB9_61:
 mov     r14, qword, ptr, [rsp, +, 104]
 jmp     .LBB9_49
.LBB9_63:
 mov     r14, qword, ptr, [rsp, +, 104]
 jmp     .LBB9_49
.LBB9_37:
 mov     r10, rcx
 mov     rdi, rdx
 test    r10, r10
 jne     .LBB9_40
 jmp     .LBB9_81
.LBB9_51:
 mov     al, 1
 test    rbx, rbx
 mov     rdi, qword, ptr, [rsp, +, 8]
 mov     rcx, qword, ptr, [rsp, +, 208]
 mov     r11, qword, ptr, [rsp, +, 40]
 je      .LBB9_26
 shl     rbx, 3
 mov     edx, 8
 mov     rdi, r10
 mov     rsi, rbx
 mov     rbx, rcx
 call    qword, ptr, [rip, +, __rust_dealloc@GOTPCREL]
 mov     al, 1
 mov     rcx, rbx
 mov     r8, qword, ptr, [rsp, +, 32]
 mov     rdi, qword, ptr, [rsp, +, 8]
 mov     r11, qword, ptr, [rsp, +, 40]
 mov     rsi, qword, ptr, [rsp, +, 16]
 jmp     .LBB9_26
.LBB9_14:
 mov     r15, rbx
 test    r15, r15
 jne     .LBB9_17
 jmp     .LBB9_80
.LBB9_33:
 mov     bl, 1
 test    r12, r12
 mov     rdx, qword, ptr, [rsp, +, 128]
 mov     rcx, qword, ptr, [rsp, +, 120]
 je      .LBB9_6
 shl     r12, 3
 mov     edx, 8
 mov     rdi, r15
 mov     rsi, r12
 call    qword, ptr, [rip, +, __rust_dealloc@GOTPCREL]
 mov     rcx, qword, ptr, [rsp, +, 120]
 mov     rdx, qword, ptr, [rsp, +, 128]
 mov     r11, qword, ptr, [rsp, +, 40]
 mov     rsi, qword, ptr, [rsp, +, 16]
 jmp     .LBB9_6
.LBB9_8:
 mov     al, 1
 mov     r8, qword, ptr, [rsp, +, 136]
 mov     rdx, qword, ptr, [rsp, +, 144]
 test    al, 1
 je      .LBB9_4
 jmp     .LBB9_2
.LBB9_78:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.5]
 mov     rdi, rcx
 mov     rsi, rbp
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_30:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rsi, r14
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_31:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.5]
 mov     rdi, rax
 mov     rsi, r12
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_53:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rsi, qword, ptr, [rsp, +, 184]
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_54:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.5]
 mov     rdi, rcx
 mov     rsi, rbx
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_3:
 add     rsp, 264
 pop     rbx
 pop     r12
 pop     r13
 pop     r14
 pop     r15
 pop     rbp
 ret
.LBB9_75:
 add     rsi, qword, ptr, [rsp, +, 216]
 mov     rax, rsi
 cmp     rsi, rbx
 jae     .LBB9_74
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rsi, r12
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_74:
 lea     rdx, [rip, +, .Lanon.a54329a88b523eeef20e323da3a76430.4]
 mov     rdi, rsi
 mov     rsi, rbx
 call    qword, ptr, [rip, +, _ZN4core9panicking18panic_bounds_check17h8ca51854a0fa2e57E@GOTPCREL]
 ud2
.LBB9_79:
 call    qword, ptr, [rip, +, _ZN5alloc7raw_vec17capacity_overflow17h02fde2e2d9165b9fE@GOTPCREL]
 ud2
.LBB9_80:
 mov     rdi, qword, ptr, [rsp, +, 24]
 mov     rsi, rbx
 call    qword, ptr, [rip, +, _ZN5alloc5alloc18handle_alloc_error17h69217671ba2cfb41E@GOTPCREL]
 ud2
.LBB9_81:
 mov     rdi, qword, ptr, [rsp, +, 64]
 mov     rsi, qword, ptr, [rsp, +, 24]
 call    qword, ptr, [rip, +, _ZN5alloc5alloc18handle_alloc_error17h69217671ba2cfb41E@GOTPCREL]
 ud2
