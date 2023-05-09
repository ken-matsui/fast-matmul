	.globl	fast_matmul::fast::matmul
	.p2align	2
fast_matmul::fast::matmul:
Lfunc_begin13:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 37
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	.cfi_startproc
	sub sp, sp, #416
	.cfi_def_cfa_offset 416
	stp x28, x27, [sp, #320]
	stp x26, x25, [sp, #336]
	stp x24, x23, [sp, #352]
	stp x22, x21, [sp, #368]
	stp x20, x19, [sp, #384]
	stp x29, x30, [sp, #400]
	add x29, sp, #400
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
	str x3, [sp, #144]
	stur x0, [x29, #-192]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	ldr x15, [x6]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x15, LBB13_75
	mov x20, x6
	mov x21, x4
	mov x23, x1
	mov w8, #0
	mov x24, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x15, #1
	str x9, [sp, #40]
	ldp x10, x9, [x5, #24]
	ldr x25, [x5, #16]
	stp x15, x10, [x29, #-184]
	mul x22, x9, x10
	ldr x26, [x5]
	stp x4, x6, [sp, #64]
	stp x1, x2, [sp, #48]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_3
LBB13_2:
	ldr x8, [sp, #40]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x24, x24, x8
	cset w8, hs
	cmp x24, x2
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x2, x24, ne
	str x9, [sp, #32]
	tbz w8, #0, LBB13_4
	b LBB13_65

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x24, x2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x24, lo
	str x8, [sp, #32]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	b.hs LBB13_65

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	ldr x27, [x20, #16]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x27, LBB13_75
	mov x10, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x11, x27, #1
	add x9, x24, x15
	cmp x9, x2
	csel x4, x9, x2, lo
	str x24, [sp, #168]
	str x27, [sp, #200]
	stp x4, x11, [sp, #80]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
LBB13_6:
	ldr x8, [sp, #88]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x10, x8
	cset w8, hs
	cmp x1, x23
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x23, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	tbnz w8, #0, LBB13_63
	str x9, [sp, #128]
	b LBB13_10

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x23
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	b.hs LBB13_63
	mov x1, x10
	str x8, [sp, #128]
LBB13_10:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		let ik = min(pc + param.kc, k);
	add x8, x1, x27
	cmp x8, x23
	csel x2, x8, x23, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	sub x8, x29, #168
	mov x0, x21
	stp x2, x1, [sp, #184]
	mov x3, x24
	bl fast_matmul::matrix::Matrix::pack_into
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	ldr x19, [x20, #8]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x19, LBB13_75
	ldur x28, [x29, #-136]
	ldur x21, [x29, #-168]
	cbz x28, LBB13_59
	mov x10, #0
	mov w8, #0
	sub x9, x19, #1
	str x9, [sp, #96]
	sub x9, x28, #1
	str x9, [sp, #152]
	ldp x27, x23, [x29, #-152]
	mul x24, x23, x28
	ldur x15, [x29, #-184]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
LBB13_13:
	ldr x8, [sp, #96]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x10, x8
	cset w8, hs
	ldur x9, [x29, #-192]
	cmp x1, x9
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x9, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	tbnz w8, #0, LBB13_60
	str x9, [sp, #136]
	b LBB13_17

	ldur x8, [x29, #-192]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x8
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	b.hs LBB13_60
	mov x1, x10
	str x8, [sp, #136]
LBB13_17:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	add x8, x1, x19
	ldur x9, [x29, #-192]
	cmp x8, x9
	csel x2, x8, x9, lo
	sub x8, x29, #128
	ldr x0, [sp, #144]
	str x1, [sp, #160]
	ldp x4, x3, [sp, #184]
	bl fast_matmul::matrix::Matrix::pack_into
	ldp x11, x9, [x29, #-104]
	ldr x8, [sp, #200]
	cmp x8, x9
	csel x2, x8, x9, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x11, LBB13_75
	sub x12, x11, #1
	ldur x0, [x29, #-128]
	ldur x15, [x29, #-184]
	ldr x17, [sp, #152]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbz x2, LBB13_49
	mov x16, #0
	mov w8, #0
	mul x14, x9, x11
	ldur x1, [x29, #-112]
	ldr x13, [sp, #160]
LBB13_20:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_22
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x16, x16, x17
	cset w8, hs
	cmp x16, x15
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x4, x15, x16, ne
	tbz w8, #0, LBB13_23
	b LBB13_56

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x16, x15
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x4, x16, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_56

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x16, x28
	b.hs LBB13_43
	mov x5, #0
	mov w8, #0
	ldr x9, [sp, #168]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	add x9, x9, x16
	ldur x10, [x29, #-176]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	madd x9, x10, x9, x13
LBB13_25:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_28
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x3, x5, x12
	cset w8, hs
	cmp x3, x19
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x5, x19, x3, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	tbnz w8, #0, LBB13_48
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x3, x11
	b.hs LBB13_25
	b LBB13_30

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x5, x19
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x5, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	b.hs LBB13_48
	mov x3, x5
	mov x5, x8
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x3, x11
	b.hs LBB13_25
LBB13_30:
	stp x5, x9, [sp, #8]
	str x4, [sp, #24]
	mov x7, #0
	add x4, x9, x3
	sub x13, x11, x3
	mov x6, x3
	stp x4, x2, [sp, #112]
LBB13_31:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x8, x7, #1
	str x8, [sp, #176]
	mul x8, x7, x11
	str x8, [sp, #104]
	mov x15, x16
LBB13_32:
	madd x9, x23, x15, x7
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.row * self.col);
	cmp x9, x24
	b.hs LBB13_70
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x9, x27
	b.hs LBB13_66
	add x15, x15, #1
	mov x5, x13
	mov x8, x6
	mov x10, x4
LBB13_35:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.row * self.col);
	cmp x8, x14
	b.hs LBB13_72
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x1
	b.hs LBB13_73
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		assert!(j * self.row + i < self.row * self.col);
	cmp x10, x22
	b.hs LBB13_69
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp x10, x25
	b.hs LBB13_64
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	ldr w17, [x0, x8, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 57
		self.inner[j * self.row + i]
	ldr w30, [x21, x9, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	lsl x2, x10, #2
	ldr w20, [x26, x2]
	madd w17, w30, w17, w20
	str w17, [x26, x2]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x10, x10, #1
	add x8, x8, #1
	subs x5, x5, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB13_35
	ldur x8, [x29, #-176]
	add x4, x4, x8
	cmp x15, x28
	b.ne LBB13_32
	add x6, x6, x11
	mov w8, #1
	ldr x9, [sp, #176]
	mov x7, x9
	ldp x4, x2, [sp, #112]
	cmp x9, x2
	b.ne LBB13_31
	ldur x15, [x29, #-184]
	ldp x17, x13, [sp, #152]
	ldp x9, x4, [sp, #16]
	ldr x5, [sp, #8]
	b LBB13_25
LBB13_43:
	mov w9, #1
LBB13_44:
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x10, x9, x12
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x9, x9, x11
	b.hs LBB13_47
	cmp x10, x19
	b.lo LBB13_44
	mov x16, x4
	b LBB13_20
LBB13_47:
	mov x16, x4
	b LBB13_20
LBB13_48:
	mov w8, #1
	mov x16, x4
	b LBB13_20

	mov x8, #0
	mov w9, #0
LBB13_50:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w9, #0, LBB13_52
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x8, x8, x17
	cset w9, hs
	cmp x8, x15
	csinc w9, w9, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w9, #0
	csinc x8, x15, x8, ne
	tbz w9, #0, LBB13_53
	b LBB13_56

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x8, x15
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_56

	mov w10, #1
LBB13_54:
	mov w9, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x10, x12
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x10, x10, x11
	b.hs LBB13_50
	cmp x13, x19
	b.lo LBB13_54
	b LBB13_50
LBB13_56:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 63
		}
	ldur x8, [x29, #-120]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_58
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov w2, #4
	bl ___rust_dealloc
	ldur x15, [x29, #-184]

	mov w8, #1
	ldr x10, [sp, #136]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
	b LBB13_13

	ldp x8, x15, [x29, #-192]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	cbnz x8, LBB13_74
LBB13_60:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 64
		}
	ldur x8, [x29, #-160]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_62
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov x0, x21
	mov w2, #4
	bl ___rust_dealloc
	ldur x15, [x29, #-184]

	mov w8, #1
	ldp x21, x20, [sp, #64]
	ldp x23, x2, [sp, #48]
	ldr x24, [sp, #168]
	ldr x27, [sp, #200]
	ldr x4, [sp, #80]
	ldr x10, [sp, #128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
	b LBB13_6
LBB13_63:
	mov w8, #1
	ldr x24, [sp, #32]
	tbz w8, #0, LBB13_3
	b LBB13_2
LBB13_64:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
Lloh8:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.16@PAGE
Lloh9:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.16@PAGEOFF
	mov x0, x10
	mov x1, x25
	bl core::panicking::panic_bounds_check
LBB13_65:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 66
		}
	ldp x29, x30, [sp, #400]
	ldp x20, x19, [sp, #384]
	ldp x22, x21, [sp, #368]
	ldp x24, x23, [sp, #352]
	ldp x26, x25, [sp, #336]
	ldp x28, x27, [sp, #320]
	add sp, sp, #416
	ret
LBB13_66:
	ldr x8, [sp, #104]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.row * self.col);
	add x8, x3, x8
	cmp x8, x14
	b.hs LBB13_72
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x1
	b.hs LBB13_73
Lloh10:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGE
Lloh11:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGEOFF
	mov x0, x9
	mov x1, x27
	bl core::panicking::panic_bounds_check
LBB13_69:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		assert!(j * self.row + i < self.row * self.col);
Lloh12:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGE
Lloh13:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGEOFF
Lloh14:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.15@PAGE
Lloh15:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.15@PAGEOFF
	mov w1, #56
	bl core::panicking::panic
LBB13_70:
	ldr x8, [sp, #104]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		assert!(j * self.row + i < self.row * self.col);
	add x8, x3, x8
	cmp x8, x14
	b.hs LBB13_72
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x1
	b.hs LBB13_73
LBB13_72:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
Lloh16:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGE
Lloh17:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.11@PAGEOFF
Lloh18:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.13@PAGE
Lloh19:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.13@PAGEOFF
	mov w1, #56
	bl core::panicking::panic
LBB13_73:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
Lloh20:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGE
Lloh21:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.14@PAGEOFF
	mov x0, x8
	bl core::panicking::panic_bounds_check

	ldur x8, [x29, #-192]
	cmp x19, x8
	csel x2, x19, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	sub x8, x29, #128
	ldr x0, [sp, #144]
	mov x1, #0
	ldp x4, x3, [sp, #184]
	bl fast_matmul::matrix::Matrix::pack_into

Lloh22:
	adrp x0, l_anon.59be6f2441934e95d79b4ac6bac88412.2@PAGE
Lloh23:
	add x0, x0, l_anon.59be6f2441934e95d79b4ac6bac88412.2@PAGEOFF
Lloh24:
	adrp x2, l_anon.59be6f2441934e95d79b4ac6bac88412.4@PAGE
Lloh25:
	add x2, x2, l_anon.59be6f2441934e95d79b4ac6bac88412.4@PAGEOFF
	mov w1, #27
	bl core::panicking::panic
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
