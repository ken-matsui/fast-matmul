fast_matmul::fast::matmul:
 sub     sp, sp, #272
 stp     x28, x27, [sp, #176]
 stp     x26, x25, [sp, #192]
 stp     x24, x23, [sp, #208]
 stp     x22, x21, [sp, #224]
 stp     x20, x19, [sp, #240]
 stp     x29, x30, [sp, #256]
 add     x29, sp, #256
 mov     x22, x2
 mov     x17, x0
 mov     w8, #0
 mov     x6, #0
 ldr     x2, [x4]
 ldp     x20, x19, [x4, #24]
 ldr     x4, [x3]
 ldp     x21, x23, [x3, #24]
 ldr     x9, [x5]
 stur    x9, [x29, #-96]
 ldp     x28, x24, [x5, #24]
 stur    x1, [x29, #-120]
 stp     x2, x0, [sp, #120]
 str     x4, [sp, #112]
 tbz     w8, #0, LBB10_2
LBB10_1:
 adds    x6, x6, #19
 cset    w8, hs
 cmp     x6, x22
 csinc   w8, w8, wzr, lo
 cmp     w8, #0
 csinc   x9, x22, x6, ne
 str     x9, [sp, #32]
 tbz     w8, #0, LBB10_3
 b       LBB10_71
LBB10_2:
 cmp     x6, x22
 cinc    x8, x6, lo
 str     x8, [sp, #32]
 b.hs    LBB10_71
LBB10_3:
 mov     x5, #0
 mov     w8, #0
 add     x9, x6, #20
 cmp     x9, x22
 csel    x3, x9, x22, lo
 sub     x9, x3, x6
 stur    x9, [x29, #-112]
 mul     x9, x2, x6
 str     x9, [sp, #72]
 stp     x3, x6, [sp, #96]
 str     x22, [sp, #8]
LBB10_4:
 tbz     w8, #0, LBB10_6
 adds    x7, x5, #19
 cset    w8, hs
 cmp     x7, x1
 csinc   w8, w8, wzr, lo
 cmp     w8, #0
 csinc   x5, x1, x7, ne
 tbz     w8, #0, LBB10_8
 b       LBB10_65
LBB10_6:
 cmp     x5, x1
 cinc    x8, x5, lo
 b.hs    LBB10_65
 mov     x7, x5
 mov     x5, x8
LBB10_8:
 add     x8, x7, #20
 cmp     x8, x1
 csel    x15, x8, x1, lo
 sub     x22, x15, x7
 ldur    x8, [x29, #-112]
 mul     x25, x22, x8
 stp     x7, x5, [sp, #80]
 cbz     x25, LBB10_14
 lsr     x9, x25, #60
 cmp     x9, #0
 cset    w8, eq
 cbnz    x9, LBB10_75
 lsl     x27, x25, #3
 ubfiz   x26, x8, #3, #32
 stur    x26, [x29, #-104]
 cbz     x27, LBB10_12
 mov     x0, x27
 mov     x1, x26
 mov     x26, x15
 bl      ___rust_alloc_zeroed
 mov     x15, x26
 ldp     x7, x5, [sp, #80]
 ldp     x3, x6, [sp, #96]
 ldp     x4, x2, [sp, #112]
 ldr     x17, [sp, #128]
 ldur    x1, [x29, #-120]
 mov     x26, x0
LBB10_12:
 cbz     x26, LBB10_76
 cmp     x3, x6
 b.hi    LBB10_15
 b       LBB10_22
LBB10_14:
 mov     w26, #8
 cmp     x3, x6
 b.ls    LBB10_22
LBB10_15:
 cmp     x15, x7
 b.ls    LBB10_22
 mov     x9, #0
 ldr     x8, [sp, #72]
 add     x10, x8, x7
 mov     x11, x6
LBB10_17:
 add     x11, x11, #1
 mov     x12, x22
 mov     x0, x10
 mov     x8, x9
LBB10_18:
 cmp     x0, x19
 b.hs    LBB10_67
 cmp     x8, x25
 b.hs    LBB10_68
 ldr     x13, [x20, x0, lsl, #3]
 str     x13, [x26, x8, lsl, #3]
 add     x8, x8, #1
 add     x0, x0, #1
 subs    x12, x12, #1
 b.ne    LBB10_18
 add     x9, x9, x22
 add     x10, x10, x2
 cmp     x11, x3
 b.ne    LBB10_17
LBB10_22:
 mov     x10, #0
 mov     w8, #0
 mul     x9, x4, x7
 str     x9, [sp, #64]
 str     x15, [sp, #48]
LBB10_23:
 tbz     w8, #0, LBB10_25
 adds    x16, x10, #19
 cset    w8, hs
 cmp     x16, x17
 csinc   w8, w8, wzr, lo
 cmp     w8, #0
 csinc   x10, x17, x16, ne
 tbz     w8, #0, LBB10_27
 b       LBB10_63
LBB10_25:
 cmp     x10, x17
 cinc    x8, x10, lo
 b.hs    LBB10_63
 mov     x16, x10
 mov     x10, x8
LBB10_27:
 add     x8, x16, #20
 cmp     x8, x17
 csel    x30, x8, x17, lo
 sub     x13, x30, x16
 mul     x27, x13, x22
 stur    x13, [x29, #-104]
 str     x10, [sp]
 str     x16, [sp, #24]
 cbz     x27, LBB10_32
 lsr     x9, x27, #60
 cmp     x9, #0
 cset    w8, eq
 cbnz    x9, LBB10_75
 lsl     x0, x27, #3
 ubfiz   x8, x8, #3, #32
 str     x0, [sp, #40]
 str     x8, [sp, #16]
 cbz     x0, LBB10_60
 mov     x1, x8
 str     x30, [sp, #56]
 bl      ___rust_alloc_zeroed
 ldp     x15, x30, [sp, #48]
 ldur    x13, [x29, #-104]
 ldr     x16, [sp, #24]
 ldp     x7, x5, [sp, #80]
 ldp     x3, x6, [sp, #96]
 ldp     x4, x2, [sp, #112]
 ldr     x17, [sp, #128]
 ldur    x1, [x29, #-120]
 cbz     x0, LBB10_77
LBB10_31:
 cmp     x15, x7
 b.hi    LBB10_33
 b       LBB10_40
LBB10_32:
 mov     w0, #8
 cmp     x15, x7
 b.ls    LBB10_40
LBB10_33:
 cmp     x30, x16
 b.ls    LBB10_40
 mov     x10, #0
 ldr     x8, [sp, #64]
 add     x11, x8, x16
 mov     x12, x7
LBB10_35:
 add     x12, x12, #1
 mov     x8, x11
 mov     x9, x10
LBB10_36:
 cmp     x8, x23
 b.hs    LBB10_69
 cmp     x9, x27
 b.hs    LBB10_70
 ldr     x14, [x21, x8, lsl, #3]
 str     x14, [x0, x9, lsl, #3]
 add     x9, x9, #1
 add     x8, x8, #1
 subs    x13, x13, #1
 b.ne    LBB10_36
 ldur    x13, [x29, #-104]
 add     x10, x10, x13
 add     x11, x11, x4
 cmp     x12, x15
 b.ne    LBB10_35
LBB10_40:
 mov     x12, #0
 mov     w8, #0
 lsl     x9, x30, #3
 sub     x9, x9, x16, lsl, #3
 str     x9, [sp, #40]
LBB10_41:
 tbz     w8, #0, LBB10_44
 adds    x13, x12, #19
 cset    w8, hs
 cmp     x13, #19
 csinc   w8, w8, wzr, ls
 cmp     w8, #0
 mov     w9, #20
 csinc   x12, x9, x13, ne
 tbnz    w8, #0, LBB10_61
 mov     w8, #1
 cmp     x13, #19
 b.hi    LBB10_41
 b       LBB10_46
LBB10_44:
 cmp     x12, #20
 cinc    x8, x12, lo
 cmp     x12, #19
 b.hi    LBB10_61
 mov     x13, x12
 mov     x12, x8
 mov     w8, #1
 cmp     x13, #19
 b.hi    LBB10_41
LBB10_46:
 mov     x15, #0
 mov     w8, #0
 add     x9, x6, x13
 ldur    x10, [x29, #-96]
 madd    x9, x10, x9, x16
 str     x9, [sp, #56]
 tbz     w8, #0, LBB10_48
LBB10_47:
 adds    x15, x15, #19
 cset    w8, hs
 cmp     x15, #19
 csinc   w8, w8, wzr, ls
 cmp     w8, #0
 mov     w9, #20
 csinc   x16, x9, x15, ne
 tbz     w8, #0, LBB10_49
 b       LBB10_59
LBB10_48:
 cmp     x15, #20
 cinc    x16, x15, lo
 cmp     x15, #19
 b.hi    LBB10_59
LBB10_49:
 mov     x17, #0
 mov     x3, #0
 ldr     x8, [sp, #56]
 add     x1, x8, x15
 mov     x2, x0
 ldur    x8, [x29, #-104]
LBB10_50:
 add     x4, x3, #1
 mul     x8, x3, x8
 str     x8, [sp, #16]
 mov     x6, x1
 mov     x7, x13
LBB10_51:
 madd    x8, x7, x22, x3
 cmp     x8, x25
 b.hs    LBB10_72
 add     x7, x7, #1
 mov     x9, x6
 mov     x30, x15
LBB10_53:
 add     x10, x17, x30
 cmp     x10, x27
 b.hs    LBB10_74
 cmp     x9, x24
 b.hs    LBB10_66
 ldr     x10, [x2, x30, lsl, #3]
 add     x11, x30, #1
 ldr     x30, [x26, x8, lsl, #3]
 lsl     x14, x9, #3
 ldr     x5, [x28, x14]
 madd    x10, x30, x10, x5
 str     x10, [x28, x14]
 add     x9, x9, #1
 mov     x30, x11
 cmp     x11, #20
 b.ne    LBB10_53
 ldur    x8, [x29, #-96]
 add     x6, x6, x8
 cmp     x7, #20
 b.ne    LBB10_51
 ldur    x8, [x29, #-104]
 add     x17, x17, x8
 ldr     x9, [sp, #40]
 add     x2, x2, x9
 mov     x3, x4
 cmp     x4, #20
 b.ne    LBB10_50
 mov     w8, #1
 mov     x15, x16
 ldur    x1, [x29, #-120]
 ldp     x2, x17, [sp, #120]
 ldp     x6, x4, [sp, #104]
 ldp     x5, x3, [sp, #88]
 ldr     x7, [sp, #80]
 tbz     w8, #0, LBB10_48
 b       LBB10_47
LBB10_59:
 mov     w8, #1
 ldr     x15, [sp, #48]
 ldr     x16, [sp, #24]
 b       LBB10_41
LBB10_60:
 mov     x0, x8
 cbnz    x8, LBB10_31
 b       LBB10_77
LBB10_61:
 mov     w8, #1
 ldr     x10, [sp]
 cbz     x27, LBB10_23
 lsl     x1, x27, #3
 mov     w2, #8
 mov     x27, x10
 bl      ___rust_dealloc
 mov     x10, x27
 ldr     x15, [sp, #48]
 ldp     x7, x5, [sp, #80]
 ldp     x3, x6, [sp, #96]
 ldp     x4, x2, [sp, #112]
 ldr     x17, [sp, #128]
 ldur    x1, [x29, #-120]
 mov     w8, #1
 b       LBB10_23
LBB10_63:
 mov     w8, #1
 ldr     x22, [sp, #8]
 cbz     x25, LBB10_4
 lsl     x1, x25, #3
 mov     x0, x26
 mov     w2, #8
 bl      ___rust_dealloc
 ldp     x5, x3, [sp, #88]
 ldp     x6, x4, [sp, #104]
 ldp     x2, x17, [sp, #120]
 ldur    x1, [x29, #-120]
 mov     w8, #1
 b       LBB10_4
LBB10_65:
 mov     w8, #1
 ldr     x6, [sp, #32]
 tbz     w8, #0, LBB10_2
 b       LBB10_1
LBB10_66:
Lloh4:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGE
Lloh5:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGEOFF
 mov     x0, x9
 mov     x1, x24
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_67:
Lloh6:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh7:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x1, x19
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_68:
Lloh8:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGE
Lloh9:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGEOFF
 mov     x0, x8
 mov     x1, x25
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_69:
Lloh10:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh11:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x0, x8
 mov     x1, x23
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_70:
Lloh12:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGE
Lloh13:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGEOFF
 mov     x0, x9
 mov     x1, x27
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_71:
 ldp     x29, x30, [sp, #256]
 ldp     x20, x19, [sp, #240]
 ldp     x22, x21, [sp, #224]
 ldp     x24, x23, [sp, #208]
 ldp     x26, x25, [sp, #192]
 ldp     x28, x27, [sp, #176]
 add     sp, sp, #272
 ret
LBB10_72:
 ldr     x9, [sp, #16]
 add     x10, x15, x9
 cmp     x10, x27
 b.hs    LBB10_74
Lloh14:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh15:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x0, x8
 mov     x1, x25
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_74:
Lloh16:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh17:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x0, x10
 mov     x1, x27
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB10_75:
 bl      __ZN5alloc7raw_vec17capacity_overflow17h1fd53268405d69f8E
LBB10_76:
 mov     x0, x27
 ldur    x1, [x29, #-104]
 bl      __ZN5alloc5alloc18handle_alloc_error17h529c874fd95aa355E
LBB10_77:
 ldr     x0, [sp, #40]
 ldr     x1, [sp, #16]
 bl      __ZN5alloc5alloc18handle_alloc_error17h529c874fd95aa355E
