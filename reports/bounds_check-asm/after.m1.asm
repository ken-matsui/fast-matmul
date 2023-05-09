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
	str x3, [sp, #120]
	stur x0, [x29, #-176]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	ldr x23, [x6]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x23, LBB13_71
	mov x19, x6
	mov x21, x4
	mov x22, x1
	mov w8, #0
	mov x27, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x23, #1
	stp x9, x1, [sp, #16]
	ldp x25, x20, [x5, #16]
	ldr x24, [x5]
	stp x4, x6, [sp, #40]
	str x2, [sp, #32]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_3
LBB13_2:
	ldr x8, [sp, #16]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x27, x27, x8
	cset w8, hs
	cmp x27, x2
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x2, x27, ne
	str x9, [sp, #8]
	tbz w8, #0, LBB13_4
	b LBB13_68

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x27, x2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x27, lo
	str x8, [sp, #8]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	b.hs LBB13_68

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	ldr x28, [x19, #16]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x28, LBB13_71
	mov x10, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x11, x28, #1
	add x9, x27, x23
	cmp x9, x2
	csel x4, x9, x2, lo
	str x27, [sp, #136]
	str x28, [sp, #184]
	stp x4, x11, [sp, #56]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
LBB13_6:
	ldr x8, [sp, #64]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x10, x8
	cset w8, hs
	cmp x1, x22
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x22, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	tbnz w8, #0, LBB13_65
	str x9, [sp, #104]
	b LBB13_10

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x22
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	b.hs LBB13_65
	mov x1, x10
	str x8, [sp, #104]
LBB13_10:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		let ik = min(pc + param.kc, k);
	add x8, x1, x28
	cmp x8, x22
	csel x2, x8, x22, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	sub x8, x29, #168
	mov x0, x21
	stp x2, x1, [sp, #168]
	mov x3, x27
	bl fast_matmul::matrix::Matrix::pack_into
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	ldr x26, [x19, #8]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x26, LBB13_71
	ldur x19, [x29, #-136]
	ldur x21, [x29, #-168]
	cbz x19, LBB13_61
	mov x10, #0
	mov w8, #0
	sub x9, x26, #1
	str x9, [sp, #72]
	sub x9, x19, #1
	str x9, [sp, #144]
	ldp x22, x28, [x29, #-152]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
LBB13_13:
	ldr x8, [sp, #72]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x10, x8
	cset w8, hs
	ldur x9, [x29, #-176]
	cmp x1, x9
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x9, x1, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	tbnz w8, #0, LBB13_62
	str x9, [sp, #112]
	b LBB13_17

	ldur x8, [x29, #-176]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x8
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	b.hs LBB13_62
	mov x1, x10
	str x8, [sp, #112]
LBB13_17:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	add x8, x1, x26
	ldur x9, [x29, #-176]
	cmp x8, x9
	csel x2, x8, x9, lo
	sub x8, x29, #128
	ldr x0, [sp, #120]
	str x1, [sp, #128]
	ldp x4, x3, [sp, #168]
	bl fast_matmul::matrix::Matrix::pack_into
	ldp x10, x8, [x29, #-104]
	ldr x9, [sp, #184]
	cmp x9, x8
	csel x12, x9, x8, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x10, LBB13_71
	sub x11, x10, #1
	ldur x0, [x29, #-128]
	ldr x15, [sp, #144]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbz x12, LBB13_51
	mov x14, #0
	mov w8, #0
	ldur x1, [x29, #-112]
LBB13_20:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_22
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x14, x14, x15
	cset w8, hs
	cmp x14, x23
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x16, x23, x14, ne
	tbz w8, #0, LBB13_23
	b LBB13_58

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x14, x23
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x16, x14, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_58

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x14, x19
	b.hs LBB13_45
	str x16, [sp]
	mov x3, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	sub x9, x14, #1
	mul x9, x28, x9
	str x9, [sp, #96]
	sub x16, x19, x14
	ldp x13, x9, [sp, #128]
	add x9, x9, x14
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	madd x9, x20, x9, x13
	str x9, [sp, #88]
LBB13_25:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_27
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x3, x3, x11
	cset w8, hs
	cmp x3, x26
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x26, x3, ne
	tbz w8, #0, LBB13_28
	b LBB13_50

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x3, x26
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x9, x3, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	b.hs LBB13_50

	str x9, [sp, #160]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x3, x10
	b.hs LBB13_39
	mov x6, #0
	ldr x8, [sp, #88]
	add x30, x8, x3
	sub x4, x10, x3
	str x30, [sp, #80]
LBB13_30:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x8, x6, #1
	str x8, [sp, #152]
	mov x13, x14
LBB13_31:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		assert!(j * Bc.row + pr < Bc.inner.len());
	madd x17, x28, x13, x6
	cmp x17, x22
	b.hs LBB13_69
	add x13, x13, #1
	mov x5, x4
	mov x8, x3
	mov x9, x30
LBB13_33:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x1
	b.hs LBB13_66
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp x9, x25
	b.hs LBB13_67
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	ldr w27, [x0, x8, lsl #2]
	ldr w15, [x21, x17, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 60
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	lsl x7, x9, #2
	ldr w2, [x24, x7]
	madd w15, w15, w27, w2
	str w15, [x24, x7]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x9, x9, #1
	add x8, x8, #1
	subs x5, x5, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB13_33
	add x30, x30, x20
	cmp x13, x19
	b.ne LBB13_31
	add x3, x3, x10
	mov w8, #1
	ldr x9, [sp, #152]
	mov x6, x9
	cmp x9, x12
	ldr x30, [sp, #80]
	b.ne LBB13_30
	ldr x3, [sp, #160]
	b LBB13_25
LBB13_39:
	mov x8, #0
	ldr x9, [sp, #96]
LBB13_40:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x8, x8, #1
	mov x13, x16
	mov x17, x9

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		assert!(j * Bc.row + pr < Bc.inner.len());
	add x17, x17, x28
	cmp x17, x22
	b.hs LBB13_69
	sub x13, x13, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbnz x13, LBB13_41
	add x9, x9, #1
	cmp x8, x12
	b.ne LBB13_40
	mov w8, #1
	ldr x3, [sp, #160]
	b LBB13_25
LBB13_45:
	mov w9, #1
LBB13_46:
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x9, x11
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x9, x9, x10
	b.hs LBB13_49
	cmp x13, x26
	b.lo LBB13_46
	mov x14, x16
	b LBB13_20
LBB13_49:
	mov x14, x16
	b LBB13_20
LBB13_50:
	mov w8, #1
	ldr x14, [sp]
	ldr x15, [sp, #144]
	b LBB13_20

	mov x8, #0
	mov w9, #0
LBB13_52:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w9, #0, LBB13_54
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x8, x8, x15
	cset w9, hs
	cmp x8, x23
	csinc w9, w9, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w9, #0
	csinc x8, x23, x8, ne
	tbz w9, #0, LBB13_55
	b LBB13_58

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x8, x23
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_58

	mov w12, #1
LBB13_56:
	mov w9, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x12, x11
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x12, x12, x10
	b.hs LBB13_52
	cmp x13, x26
	b.lo LBB13_56
	b LBB13_52
LBB13_58:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 66
		}
	ldur x8, [x29, #-120]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_60
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov w2, #4
	bl ___rust_dealloc

	mov w8, #1
	ldr x10, [sp, #112]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_15
	b LBB13_13

	ldur x8, [x29, #-176]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	cbnz x8, LBB13_70
LBB13_62:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 67
		}
	ldur x8, [x29, #-160]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x8, LBB13_64
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x8, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov x0, x21
	mov w2, #4
	bl ___rust_dealloc

	mov w8, #1
	ldp x21, x19, [sp, #40]
	ldp x22, x2, [sp, #24]
	ldr x27, [sp, #136]
	ldr x28, [sp, #184]
	ldr x4, [sp, #56]
	ldr x10, [sp, #104]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
	b LBB13_6
LBB13_65:
	mov w8, #1
	ldr x27, [sp, #8]
	tbz w8, #0, LBB13_3
	b LBB13_2
LBB13_66:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
Lloh8:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.15@PAGE
Lloh9:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.15@PAGEOFF
	mov x0, x8
	bl core::panicking::panic_bounds_check
LBB13_67:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
Lloh10:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.16@PAGE
Lloh11:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.16@PAGEOFF
	mov x0, x9
	mov x1, x25
	bl core::panicking::panic_bounds_check
LBB13_68:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 69
		}
	ldp x29, x30, [sp, #368]
	ldp x20, x19, [sp, #352]
	ldp x22, x21, [sp, #336]
	ldp x24, x23, [sp, #320]
	ldp x26, x25, [sp, #304]
	ldp x28, x27, [sp, #288]
	add sp, sp, #384
	ret
LBB13_69:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		assert!(j * Bc.row + pr < Bc.inner.len());
Lloh12:
	adrp x0, l_anon.757e4453bdfd2025643d21437d3351a7.11@PAGE
Lloh13:
	add x0, x0, l_anon.757e4453bdfd2025643d21437d3351a7.11@PAGEOFF
Lloh14:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGE
Lloh15:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGEOFF
	mov w1, #50
	bl core::panicking::panic

	ldur x8, [x29, #-176]
	cmp x26, x8
	csel x2, x26, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	sub x8, x29, #128
	ldr x0, [sp, #120]
	mov x1, #0
	ldp x4, x3, [sp, #168]
	bl fast_matmul::matrix::Matrix::pack_into

Lloh16:
	adrp x0, l_anon.757e4453bdfd2025643d21437d3351a7.2@PAGE
Lloh17:
	add x0, x0, l_anon.757e4453bdfd2025643d21437d3351a7.2@PAGEOFF
Lloh18:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.4@PAGE
Lloh19:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.4@PAGEOFF
	mov w1, #27
	bl core::panicking::panic
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
