fast_matmul::naive::matmul:
 stp     x26, x25, [sp, #-80]!
 stp     x24, x23, [sp, #16]
 stp     x22, x21, [sp, #32]
 stp     x20, x19, [sp, #48]
 stp     x29, x30, [sp, #64]
 add     x29, sp, #64
 cbz     x2, LBB16_12
 cbz     x0, LBB16_12
 cbz     x1, LBB16_12
 mov     x14, #0
 mov     x6, #0
 ldr     x15, [x3]
 ldr     x16, [x4]
 ldr     x17, [x5]
 ldp     x5, x8, [x5, #24]
 ldp     x3, x10, [x3, #24]
 ldp     x4, x9, [x4, #24]
LBB16_4:
 mov     x12, #0
 mul     x11, x16, x6
 mul     x7, x17, x6
 add     x6, x6, #1
LBB16_5:
 add     x13, x7, x12
 cmp     x13, x8
 b.hs    LBB16_15
 add     x19, x12, #1
 mov     x20, x1
 mov     x21, x14
LBB16_7:
 cmp     x12, x10
 b.hs    LBB16_18
 cmp     x21, x9
 b.hs    LBB16_13
 ldr     x22, [x3, x12, lsl, #3]
 ldr     x23, [x4, x21, lsl, #3]
 lsl     x24, x13, #3
 ldr     x25, [x5, x24]
 madd    x22, x23, x22, x25
 str     x22, [x5, x24]
 add     x21, x21, #1
 add     x12, x12, x15
 subs    x20, x20, #1
 b.ne    LBB16_7
 mov     x12, x19
 cmp     x19, x0
 b.ne    LBB16_5
 add     x14, x14, x16
 cmp     x6, x2
 b.ne    LBB16_4
LBB16_12:
 ldp     x29, x30, [sp, #64]
 ldp     x20, x19, [sp, #48]
 ldp     x22, x21, [sp, #32]
 ldp     x24, x23, [sp, #16]
 ldp     x26, x25, [sp], #80
 ret
LBB16_13:
 mov     x11, x21
LBB16_14:
Lloh38:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh39:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x0, x11
 mov     x1, x9
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB16_15:
 cmp     x12, x10
 b.hs    LBB16_18
 cmp     x11, x9
 b.hs    LBB16_14
Lloh40:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGE
Lloh41:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.5@PAGEOFF
 mov     x0, x13
 mov     x1, x8
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
LBB16_18:
Lloh42:
 adrp    x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGE
Lloh43:
 add     x2, x2, l_anon.a1e6f2bc78e0fc781da0d8c177dd566d.4@PAGEOFF
 mov     x0, x12
 mov     x1, x10
 bl      __ZN4core9panicking18panic_bounds_check17hef2e757c8319d91bE
