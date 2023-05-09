	.globl	fast_matmul::fast::matmul
	.p2align	2
fast_matmul::fast::matmul:
Lfunc_begin13:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 37
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	.cfi_startproc
	sub sp, sp, #352
	.cfi_def_cfa_offset 352
	stp x28, x27, [sp, #256]
	stp x26, x25, [sp, #272]
	stp x24, x23, [sp, #288]
	stp x22, x21, [sp, #304]
	stp x20, x19, [sp, #320]
	stp x29, x30, [sp, #336]
	add x29, sp, #336
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
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	ldr x17, [x6]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x17, LBB13_95
	mov x19, x6
	mov x22, x1
	mov x15, x0
	mov w8, #0
	mov x6, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x17, #1
	str x9, [sp, #80]
	ldp x23, x30, [x4, #16]
	ldr x9, [x4]
	str x9, [sp, #128]
	ldp x24, x4, [x3, #16]
	ldr x20, [x3]
	ldp x25, x9, [x5, #16]
	stur x9, [x29, #-112]
	ldr x21, [x5]
	stp x17, x0, [sp, #160]
	str x30, [sp, #72]
	str x4, [sp, #152]
	str x2, [sp, #8]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_3
LBB13_2:
	ldr x8, [sp, #80]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x6, x6, x8
	cset w8, hs
	cmp x6, x2
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x2, x6, ne
	str x9, [sp, #16]
	tbz w8, #0, LBB13_4
	b LBB13_91

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x6, x2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x6, lo
	str x8, [sp, #16]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	b.hs LBB13_91

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	ldr x10, [x19, #16]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x10, LBB13_95
	stur xzr, [x29, #-128]
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x10, #1
	str x9, [sp, #88]
	add x9, x6, x17
	cmp x9, x2
	csel x2, x9, x2, lo
	sub x9, x2, x6
	stur x9, [x29, #-104]
	sub x3, x9, #1
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	mul x9, x30, x6
	str x9, [sp, #32]
	stur x6, [x29, #-144]
	str x10, [sp, #120]
	stp x3, x2, [x29, #-160]
LBB13_6:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_8
	ldr x8, [sp, #88]
	ldur x9, [x29, #-128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x5, x9, x8
	cset w8, hs
	cmp x5, x22
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x11, x22, x5, ne
	tbz w8, #0, LBB13_10
	b LBB13_85

	ldur x9, [x29, #-128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x9, x22
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x9, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	b.hs LBB13_85
	mov x5, x9
	mov x11, x8

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		let ik = min(pc + param.kc, k);
	add x8, x5, x10
	cmp x8, x22
	csel x7, x8, x22, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub x9, x7, x5
	ldur x8, [x29, #-104]
	stur x9, [x29, #-96]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	mul x26, x9, x8
	stp x7, x5, [sp, #136]
	stur x11, [x29, #-128]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	cbz x26, LBB13_15
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	lsr x9, x26, #61
	cmp x9, #0
	cset w8, eq
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	cbnz x9, LBB13_96
	lsl x28, x26, #2
	ubfiz x1, x8, #2, #32
	stur x1, [x29, #-120]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 171
		match layout.size() {
	cbz x28, LBB13_82
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	mov x0, x28
	bl ___rust_alloc_zeroed
	ldp x7, x5, [sp, #136]
	ldp x3, x2, [x29, #-160]
	ldur x6, [x29, #-144]
	ldp x4, x17, [sp, #152]
	ldr x30, [sp, #72]
	ldr x15, [sp, #168]
	mov x27, x0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	cbz x0, LBB13_98

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x2, x6
	ldr x16, [sp, #128]
	b.hi LBB13_16
	b LBB13_23

	mov w27, #4
	cmp x2, x6
	ldr x16, [sp, #128]
	b.ls LBB13_23
LBB13_16:
	subs x9, x7, x5
	b.ls LBB13_23
	mov x10, #0
	ldr x8, [sp, #32]
	add x11, x8, x5
	mov x12, x6
LBB13_18:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x12, x12, #1
	mov x13, x9
	mov x0, x11
	mov x8, x10
LBB13_19:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x0, x23
	b.hs LBB13_89
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp x8, x26
	b.hs LBB13_90
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 73
		copy.insert(i - i_from, j - j_from, self.get(i, j));
	ldr w14, [x16, x0, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	str w14, [x27, x8, lsl #2]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x8, x8, #1
	add x0, x0, #1
	subs x13, x13, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB13_19
	ldur x8, [x29, #-96]
	add x10, x10, x8
	add x11, x11, x30
	cmp x12, x2
	b.ne LBB13_18
LBB13_23:
	str x19, [sp]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	ldr x19, [x19, #8]
	cbz x19, LBB13_95
	mov x30, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x19, #1
	str x9, [sp, #96]
	ldr x9, [sp, #120]
	ldur x10, [x29, #-96]
	cmp x9, x10
	csel x9, x9, x10, lo
	stur x9, [x29, #-136]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	mul x9, x4, x5
	str x9, [sp, #24]
	str x22, [sp, #56]
LBB13_25:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_27
	ldr x8, [sp, #96]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x16, x30, x8
	cset w8, hs
	cmp x16, x15
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x30, x15, x16, ne
	tbz w8, #0, LBB13_29
	b LBB13_83

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x30, x15
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x30, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	b.hs LBB13_83
	mov x16, x30
	mov x30, x8

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	add x8, x16, x19
	cmp x8, x15
	csel x10, x8, x15, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub x22, x10, x16
	ldur x8, [x29, #-96]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	mul x28, x22, x8
	stp x30, x16, [sp, #104]
	stur x10, [x29, #-120]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	cbz x28, LBB13_34
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	lsr x9, x28, #61
	cmp x9, #0
	cset w8, eq
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	cbnz x9, LBB13_96
	lsl x0, x28, #2
	ubfiz x1, x8, #2, #32
	str x0, [sp, #64]
	str x1, [sp, #48]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 171
		match layout.size() {
	cbz x0, LBB13_81
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	bl ___rust_alloc_zeroed
	ldp x30, x16, [sp, #104]
	ldp x7, x5, [sp, #136]
	ldp x3, x2, [x29, #-160]
	ldur x6, [x29, #-144]
	ldp x4, x17, [sp, #152]
	ldr x15, [sp, #168]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	cbz x0, LBB13_97

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x7, x5
	b.hi LBB13_35
	b LBB13_42

	mov w0, #4
	cmp x7, x5
	b.ls LBB13_42
LBB13_35:
	ldur x8, [x29, #-120]
	cmp x8, x16
	b.ls LBB13_42
	mov x10, #0
	ldr x8, [sp, #24]
	add x11, x8, x16
	mov x12, x5
LBB13_37:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x12, x12, #1
	mov x13, x22
	mov x8, x11
	mov x9, x10
LBB13_38:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x24
	b.hs LBB13_87
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp x9, x28
	b.hs LBB13_88
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 73
		copy.insert(i - i_from, j - j_from, self.get(i, j));
	ldr w14, [x20, x8, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	str w14, [x0, x9, lsl #2]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x9, x9, #1
	add x8, x8, #1
	subs x13, x13, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB13_38
	add x10, x10, x22
	add x11, x11, x4
	cmp x12, x7
	b.ne LBB13_37
LBB13_42:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cmp x2, x6
	b.eq LBB13_95
	ldur x9, [x29, #-120]
	cmp x9, x16
	b.eq LBB13_95
	sub x11, x22, #1
	ldur x8, [x29, #-136]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbz x8, LBB13_72
	mov x13, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	lsl x9, x9, #2
	sub x9, x9, x16, lsl #2
	str x9, [sp, #64]
LBB13_46:
	tbz w8, #0, LBB13_48
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x13, x3
	cset w8, hs
	cmp x13, x17
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x14, x17, x13, ne
	tbz w8, #0, LBB13_49
	b LBB13_79

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x13, x17
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x14, x13, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_79

	ldur x8, [x29, #-104]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x13, x8
	b.hs LBB13_66
	mov x12, #0
	mov w8, #0
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	add x9, x6, x13
	ldur x10, [x29, #-112]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	madd x9, x10, x9, x16
	stur x9, [x29, #-120]
LBB13_51:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_54
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x16, x12, x11
	cset w8, hs
	cmp x16, x19
	csinc w8, w8, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x12, x19, x16, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	tbnz w8, #0, LBB13_71
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x16, x22
	b.hs LBB13_51
	b LBB13_56

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x12, x19
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x12, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	b.hs LBB13_71
	mov x16, x12
	mov x12, x8
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x16, x22
	b.hs LBB13_51
LBB13_56:
	mov x1, #0
	mov x4, #0
	ldur x8, [x29, #-120]
	add x7, x8, x16
	mov x3, x0
	str x7, [sp, #48]
LBB13_57:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x5, x4, #1
	mul x8, x4, x22
	str x8, [sp, #40]
	mov x30, x13
LBB13_58:
	ldur x8, [x29, #-96]
	madd x8, x30, x8, x4
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x8, x26
	b.hs LBB13_92
	add x30, x30, #1
	mov x9, x7
	mov x17, x16
LBB13_60:
	add x10, x1, x17
	cmp x10, x28
	b.hs LBB13_94
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp x9, x25
	b.hs LBB13_86
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 60
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	ldr w10, [x3, x17, lsl #2]
	add x15, x17, #1
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	ldr w17, [x27, x8, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 60
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	lsl x6, x9, #2
	ldr w2, [x21, x6]
	madd w10, w17, w10, w2
	str w10, [x21, x6]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	add x9, x9, #1
	mov x17, x15
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x15, x22
	b.lo LBB13_60
	ldur x8, [x29, #-112]
	add x7, x7, x8
	ldur x8, [x29, #-104]
	cmp x30, x8
	b.lo LBB13_58
	add x1, x1, x22
	ldr x8, [sp, #64]
	add x3, x3, x8
	mov w8, #1
	mov x4, x5
	ldur x9, [x29, #-136]
	cmp x5, x9
	ldr x7, [sp, #48]
	b.ne LBB13_57
	ldp x17, x15, [sp, #160]
	ldp x5, x4, [sp, #144]
	ldp x2, x6, [x29, #-152]
	ldur x3, [x29, #-160]
	ldr x7, [sp, #136]
	ldr x30, [sp, #104]
	b LBB13_51
LBB13_66:
	mov w9, #1
LBB13_67:
	mov w8, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x10, x9, x11
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x9, x9, x22
	b.hs LBB13_70
	cmp x10, x19
	b.lo LBB13_67
	mov x13, x14
	b LBB13_46
LBB13_70:
	mov x13, x14
	b LBB13_46
LBB13_71:
	mov w8, #1
	mov x13, x14
	ldr x16, [sp, #112]
	b LBB13_46

	mov w9, #0
LBB13_73:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w9, #0, LBB13_75
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x8, x8, x3
	cset w9, hs
	cmp x8, x17
	csinc w9, w9, wzr, lo
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w9, #0
	csinc x8, x17, x8, ne
	tbz w9, #0, LBB13_76
	b LBB13_79

		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x8, x17
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB13_79

	mov w10, #1
LBB13_77:
	mov w9, #1
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x12, x10, x11
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x10, x10, x22
	b.hs LBB13_73
	cmp x12, x19
	b.lo LBB13_77
	b LBB13_73
LBB13_79:
	mov w8, #1
	ldr x22, [sp, #56]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x28, LBB13_25
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x28, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov w2, #4
	mov x28, x30
	bl ___rust_dealloc
	mov x30, x28
	ldp x7, x5, [sp, #136]
	ldp x3, x2, [x29, #-160]
	ldur x6, [x29, #-144]
	ldp x4, x17, [sp, #152]
	ldr x15, [sp, #168]
	mov w8, #1
	b LBB13_25

	mov x0, x1
	cbnz x1, LBB13_33
	b LBB13_97

	mov x27, x1
	cbnz x1, LBB13_14
	b LBB13_98
LBB13_83:
	mov w8, #1
	ldr x19, [sp]
	ldr x10, [sp, #120]
	ldr x30, [sp, #72]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x26, LBB13_6
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	lsl x1, x26, #2
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov x0, x27
	mov w2, #4
	bl ___rust_dealloc
	ldp x3, x2, [x29, #-160]
	ldr x10, [sp, #120]
	ldur x6, [x29, #-144]
	ldp x4, x17, [sp, #152]
	ldr x30, [sp, #72]
	ldr x15, [sp, #168]
	mov w8, #1
	b LBB13_6
LBB13_85:
	mov w8, #1
	ldp x2, x6, [sp, #8]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB13_3
	b LBB13_2
LBB13_86:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
Lloh8:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGE
Lloh9:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGEOFF
	mov x0, x9
	mov x1, x25
	bl core::panicking::panic_bounds_check
LBB13_87:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
Lloh10:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGE
Lloh11:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGEOFF
	mov x0, x8
	mov x1, x24
	bl core::panicking::panic_bounds_check
LBB13_88:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
Lloh12:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGE
Lloh13:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGEOFF
	mov x0, x9
	mov x1, x28
	bl core::panicking::panic_bounds_check
LBB13_89:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
Lloh14:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGE
Lloh15:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGEOFF
	mov x1, x23
	bl core::panicking::panic_bounds_check
LBB13_90:
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
Lloh16:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGE
Lloh17:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.13@PAGEOFF
	mov x0, x8
	mov x1, x26
	bl core::panicking::panic_bounds_check
LBB13_91:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 69
		}
	ldp x29, x30, [sp, #336]
	ldp x20, x19, [sp, #320]
	ldp x22, x21, [sp, #304]
	ldp x24, x23, [sp, #288]
	ldp x26, x25, [sp, #272]
	ldp x28, x27, [sp, #256]
	add sp, sp, #352
	ret
LBB13_92:
	ldr x9, [sp, #40]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	add x10, x16, x9
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp x10, x28
	b.hs LBB13_94
Lloh18:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGE
Lloh19:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGEOFF
	mov x0, x8
	mov x1, x26
	bl core::panicking::panic_bounds_check
LBB13_94:
Lloh20:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGE
Lloh21:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.12@PAGEOFF
	mov x0, x10
	mov x1, x28
	bl core::panicking::panic_bounds_check
LBB13_95:
Lloh22:
	adrp x0, l_anon.757e4453bdfd2025643d21437d3351a7.2@PAGE
Lloh23:
	add x0, x0, l_anon.757e4453bdfd2025643d21437d3351a7.2@PAGEOFF
Lloh24:
	adrp x2, l_anon.757e4453bdfd2025643d21437d3351a7.4@PAGE
Lloh25:
	add x2, x2, l_anon.757e4453bdfd2025643d21437d3351a7.4@PAGEOFF
	mov w1, #27
	bl core::panicking::panic

	bl alloc::raw_vec::capacity_overflow
LBB13_97:
	ldr x0, [sp, #48]
	ldr x1, [sp, #64]
		// /rustc/2f2c438dce75d8cc532c3baa849eeddc0901802c/library/alloc/src/raw_vec.rs : 189
		Err(_) => handle_alloc_error(layout),
	bl alloc::alloc::handle_alloc_error
LBB13_98:
	ldur x0, [x29, #-120]
	mov x1, x28
	bl alloc::alloc::handle_alloc_error
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh22, Lloh23
