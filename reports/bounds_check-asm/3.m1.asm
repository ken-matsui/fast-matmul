	.globl	fast_matmul::fast::matmul
	.p2align	2
fast_matmul::fast::matmul:
Lfunc_begin13:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 37
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	.cfi_startproc
	sub sp, sp, #384
	.cfi_def_cfa_offset 384
	stp x28, x27, [sp, #288]
	stp x26, x25, [sp, #304]
	stp x24, x23, [sp, #320]
	stp x22, x21, [sp, #336]
	stp x20, x19, [sp, #352]
	stp x29, x30, [sp, #368]
	add x29, sp, #368
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	str x3, [sp, #80]
	str x0, [sp, #136]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	ldr x14, [x6]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x14, LBB13_66
	mov x19, x6
	mov x21, x4
	mov x22, x1
	mov w8, #0
	mov x25, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x14, #1
	stp x9, x1, [sp, #8]
	ldp x20, x23, [x5, #16]
	ldr x24, [x5]
	str x14, [sp, #152]
	stp x4, x6, [sp, #32]
	str x2, [sp, #24]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_3
LBB13_2:
	ldr x8, [sp, #8]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x25, x25, x8
	cset w8, hs
	cmp x25, x2
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x2, x25, ne
	str x9, [sp]
	tbz w8, #0, LBB13_4
	b LBB13_62

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x25, x2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x25, lo
	str x8, [sp]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	b.hs LBB13_62

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	ldr x26, [x19, #16]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x26, LBB13_66
	str xzr, [sp, #128]
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x10, x26, #1
	add x9, x25, x14
	cmp x9, x2
	csel x27, x9, x2, lo
	stp x26, x25, [sp, #104]
	stp x27, x10, [sp, #48]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
LBB13_6:
	ldr x8, [sp, #56]
	ldr x9, [sp, #128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x9, x8
	cset w8, hs
	cmp x1, x22
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x22, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	tbnz w8, #0, LBB13_60
	str x9, [sp, #128]
	b LBB13_10

	ldr x9, [sp, #128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x9, x22
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x9, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	b.hs LBB13_60
	mov x1, x9
	str x8, [sp, #128]
LBB13_10:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		let ik = min(pc + param.kc, k);
	add x8, x1, x26
	cmp x8, x22
	csel x2, x8, x22, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	sub x8, x29, #168
	mov x0, x21
	stp x2, x1, [sp, #88]
	mov x3, x25
	mov x4, x27
	bl fast_matmul::matrix::Matrix::pack_into
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	ldr x8, [x19, #8]
	str x8, [sp, #184]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x8, LBB13_66
	ldur x25, [x29, #-136]
	ldur x21, [x29, #-168]
	cbz x25, LBB13_56
	mov x10, #0
	mov w8, #0
	ldr x19, [sp, #184]
	sub x9, x19, #1
	str x9, [sp, #64]
	sub x9, x25, #1
	str x9, [sp, #160]
	ldp x22, x27, [x29, #-152]
	ldr x14, [sp, #152]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
LBB13_13:
	ldr x8, [sp, #64]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x10, x8
	cset w8, hs
	ldr x9, [sp, #136]
	cmp x1, x9
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x9, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	tbnz w8, #0, LBB13_57
	str x9, [sp, #72]
	b LBB13_17

	ldr x8, [sp, #136]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x8
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	b.hs LBB13_57
	mov x1, x10
	str x8, [sp, #72]
LBB13_17:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	add x8, x1, x19
	ldr x9, [sp, #136]
	cmp x8, x9
	csel x2, x8, x9, lo
	sub x8, x29, #128
	ldp x0, x4, [sp, #80]
	str x1, [sp, #120]
	ldr x3, [sp, #96]
	bl fast_matmul::matrix::Matrix::pack_into
	ldp x8, x9, [x29, #-104]
	ldr x10, [sp, #104]
	cmp x10, x9
	csel x10, x10, x9, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x8, LBB13_66
	sub x9, x8, #1
	ldur x0, [x29, #-128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbz x10, LBB13_46
	mov x12, #0
	mov w14, #0
	ldur x11, [x29, #-112]
LBB13_20:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w14, #0, LBB13_22
	ldp x14, x13, [sp, #152]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x12, x12, x13
	cset w13, hs
	cmp x12, x14
	csinc w13, w13, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w13, #0
	csinc x15, x14, x12, ne
	str x15, [sp, #144]
	tbz w13, #0, LBB13_23
	b LBB13_53

	ldr x14, [sp, #152]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x12, x14
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x13, x12, lo
	str x13, [sp, #144]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_53

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x12, x25
	b.hs LBB13_40
	mov x16, #0
	mov w13, #0
	ldp x14, x15, [sp, #112]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	add x14, x14, x12
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	madd x14, x23, x14, x15
	str x14, [sp, #176]
LBB13_25:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w13, #0, LBB13_28
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x14, x16, x9
	cset w13, hs
	cmp x14, x19
	csinc w13, w13, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w13, #0
	csinc x16, x19, x14, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	tbnz w13, #0, LBB13_44
	mov w13, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x14, x8
	b.hs LBB13_25
	b LBB13_30

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x16, x19
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x13, x16, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	b.hs LBB13_44
	mov x14, x16
	mov x16, x13
	mov w13, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x14, x8
	b.hs LBB13_25
LBB13_30:
	stur x16, [x29, #-176]
	mov x2, #0
	ldr x13, [sp, #176]
	add x13, x13, x14
	sub x19, x8, x14
	str x14, [sp, #168]
	mov x16, x14
LBB13_31:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x4, x2, #1
	mul x5, x2, x8
	mov x17, x13
	mov x7, x12
LBB13_32:
	madd x30, x27, x7, x2
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.inner.len());
	cmp x30, x22
	b.hs LBB13_63
	add x7, x7, #1
	mov x1, x19
	mov x3, x16
	mov x6, x17
LBB13_34:
	cmp x3, x11
	b.hs LBB13_64
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		assert!(j * self.row + i < self.inner.len());
	cmp x6, x20
	b.hs LBB13_61
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 57
		self.inner[j * self.row + i]
	ldr w14, [x0, x3, lsl #2]
	ldr w26, [x21, x30, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	lsl x15, x6, #2
	ldr w28, [x24, x15]
	madd w14, w26, w14, w28
	str w14, [x24, x15]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x6, x6, #1
	add x3, x3, #1
	subs x1, x1, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB13_34
	add x17, x17, x23
	cmp x7, x25
	b.ne LBB13_32
	add x16, x16, x8
	mov x2, x4
	cmp x4, x10
	b.ne LBB13_31
	mov w13, #1
	ldr x19, [sp, #184]
	ldur x16, [x29, #-176]
	b LBB13_25
LBB13_40:
	mov w12, #1
LBB13_41:
	mov w14, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x12, x9
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x12, x12, x8
	b.hs LBB13_45
	cmp x13, x19
	b.lo LBB13_41
	ldr x12, [sp, #144]
	b LBB13_20
LBB13_44:
	mov w14, #1
	ldr x12, [sp, #144]
	b LBB13_20
LBB13_45:
	ldr x12, [sp, #144]
	b LBB13_20

	mov w11, #0
	ldr x14, [sp, #152]
LBB13_47:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w11, #0, LBB13_49
	ldr x11, [sp, #160]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x10, x10, x11
	cset w11, hs
	cmp x10, x14
	csinc w11, w11, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w11, #0
	csinc x10, x14, x10, ne
	tbz w11, #0, LBB13_50
	b LBB13_53

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x14
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x10, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_53

	mov w12, #1
LBB13_51:
	mov w11, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x12, x9
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x12, x12, x8
	b.hs LBB13_47
	cmp x13, x19
	b.lo LBB13_51
	b LBB13_47
LBB13_53:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 63
		}
	ldur x8, [x29, #-120]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_55
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov w2, #4
	bl ___rust_dealloc
	ldr x14, [sp, #152]

	mov w8, #1
	ldr x10, [sp, #72]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
	b LBB13_13

	ldr x8, [sp, #136]
	ldr x14, [sp, #152]
	ldr x9, [sp, #184]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	cbnz x8, LBB13_65
LBB13_57:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 64
		}
	ldur x8, [x29, #-160]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_59
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov x0, x21
	mov w2, #4
	bl ___rust_dealloc
	ldr x14, [sp, #152]

	mov w8, #1
	ldp x21, x19, [sp, #32]
	ldp x22, x2, [sp, #16]
	ldp x26, x25, [sp, #104]
	ldr x27, [sp, #48]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
	b LBB13_6
LBB13_60:
	mov w8, #1
	ldr x25, [sp]
	tbz w8, #0, LBB13_3
	b LBB13_2
LBB13_61:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		assert!(j * self.row + i < self.inner.len());
Lloh8:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGE
Lloh9:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGEOFF
Lloh10:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGE
Lloh11:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGEOFF
	mov w1, #53
	bl core::panicking::panic
LBB13_62:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 66
		}
	ldp x29, x30, [sp, #368]
	ldp x20, x19, [sp, #352]
	ldp x22, x21, [sp, #336]
	ldp x24, x23, [sp, #320]
	ldp x26, x25, [sp, #304]
	ldp x28, x27, [sp, #288]
	add sp, sp, #384
	ret
LBB13_63:
	ldr x8, [sp, #168]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.inner.len());
	add x8, x8, x5
	cmp x8, x11
LBB13_64:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
Lloh12:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGE
Lloh13:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGEOFF
Lloh14:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.13@PAGE
Lloh15:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.13@PAGEOFF
	mov w1, #53
	bl core::panicking::panic

	ldr x8, [sp, #136]
	cmp x9, x8
	csel x2, x9, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	sub x8, x29, #128
	ldp x0, x4, [sp, #80]
	mov x1, #0
	ldr x3, [sp, #96]
	bl fast_matmul::matrix::Matrix::pack_into

Lloh16:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.2@PAGE
Lloh17:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.2@PAGEOFF
Lloh18:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.4@PAGE
Lloh19:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.4@PAGEOFF
	mov w1, #27
	bl core::panicking::panic
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
