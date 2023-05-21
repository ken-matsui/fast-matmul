	.globl	fast_matmul::fast::matmul
	.p2align	2
fast_matmul::fast::matmul:
Lfunc_begin14:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
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
	stur x0, [x29, #-136]
	str x6, [sp, #80]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for jc in (0..n).step_by(param.nc) {
	ldr x27, [x6]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x27, LBB14_83
	mov x20, x1
	mov w8, #0
	stur xzr, [x29, #-104]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x27, #1
	str x9, [sp]
	ldr x9, [x4]
	str x9, [sp, #32]
	ldr x9, [x4, #24]
	ldr x10, [x3]
	str x10, [sp, #120]
	ldr x10, [x3, #24]
	ldr x28, [x5]
	str x9, [sp, #16]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for jc in (0..n).step_by(param.nc) {
	lsl x25, x9, #2
	ldr x9, [x5, #24]
	str x10, [sp, #72]
	lsl x10, x10, #2
	stur x10, [x29, #-128]
	stur x9, [x29, #-112]
	lsl x19, x9, #2
	str x2, [sp, #8]
	stp x25, x1, [sp, #56]
	b LBB14_3
LBB14_2:
	mov w8, #1
	ldr x9, [sp, #24]
	stur x9, [x29, #-104]
	ldr x2, [sp, #8]
LBB14_3:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB14_5
	ldr x8, [sp]
	ldur x9, [x29, #-104]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x9, x9, x8
	cset w8, hs
	cmp x9, x2
	csinc w8, w8, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	stur x9, [x29, #-104]
	csinc x9, x2, x9, ne
	tbz w8, #0, LBB14_6
	b LBB14_82

	ldur x8, [x29, #-104]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x8, x2
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x9, x8, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for jc in (0..n).step_by(param.nc) {
	b.hs LBB14_82

	str x9, [sp, #24]
	ldr x8, [sp, #80]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		for pc in (0..k).step_by(param.kc) {
	ldr x9, [x8, #16]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x9, LBB14_83
	mov x21, #0
	mov w8, #0
	str x9, [sp, #88]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x9, x9, #1
	str x9, [sp, #48]
	ldur x10, [x29, #-104]
	add x9, x10, x27
	cmp x9, x2
	csel x9, x9, x2, lo
	str x9, [sp, #168]
	sub x22, x9, x10
	sub x9, x22, #1
	stur x9, [x29, #-96]
	ldr x9, [sp, #16]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		for pc in (0..k).step_by(param.kc) {
	mul x9, x9, x10
	str x9, [sp, #40]
LBB14_8:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB14_10
	ldr x8, [sp, #48]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x1, x21, x8
	cset w8, hs
	cmp x1, x20
	csinc w8, w8, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x2, x20, x1, ne
	ldr x17, [sp, #88]
	tbz w8, #0, LBB14_12
	b LBB14_2

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x21, x20
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x21, lo
	ldr x17, [sp, #88]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		for pc in (0..k).step_by(param.kc) {
	b.hs LBB14_2
	mov x1, x21
	mov x2, x8

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let ik = min(pc + param.kc, k);
	add x8, x1, x17
	cmp x8, x20
	csel x8, x8, x20, lo
	stur x8, [x29, #-120]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub x23, x8, x1
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	mul x10, x23, x22
	lsl x0, x10, #2
	str x0, [sp, #96]
	str x10, [sp, #112]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	cbz x10, LBB14_17
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	lsr x9, x10, #61
	cmp x9, #0
	cset w8, eq
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	cbnz x9, LBB14_84
	ubfiz x26, x8, #2, #32
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 171
		match layout.size() {
	cbz x0, LBB14_80
	mov x20, x1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	mov x1, x26
	mov x24, x2
	bl ___rust_alloc_zeroed
	mov x2, x24
	mov x24, x0
	mov x1, x20
	ldr x17, [sp, #88]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	cbz x0, LBB14_81

	ldur x8, [x29, #-104]
	ldr x9, [sp, #168]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x9, x8
	b.hi LBB14_18
	b LBB14_23

	mov w24, #4
	ldur x8, [x29, #-104]
	ldr x9, [sp, #168]
	cmp x9, x8
	b.ls LBB14_23
LBB14_18:
	ldur x8, [x29, #-120]
	subs x8, x8, x1
	b.ls LBB14_23
	lsl x9, x23, #2
	ldp x11, x10, [sp, #32]
	add x10, x10, x1
	add x10, x11, x10, lsl #2
	mov x11, x24
	ldur x12, [x29, #-104]
LBB14_20:
	mov x13, x8
	mov x14, x10
	mov x15, x11
LBB14_21:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 73
		copy.insert(i - i_from, j - j_from, *self.get(i, j));
	ldr w16, [x14], #4
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	str w16, [x15], #4
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	subs x13, x13, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB14_21
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x12, x12, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	add x11, x11, x9
	add x10, x10, x25
	ldr x13, [sp, #168]
	cmp x12, x13
	b.ne LBB14_20
LBB14_23:
	str x2, [sp, #104]
	ldr x8, [sp, #80]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	ldr x21, [x8, #8]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cbz x21, LBB14_83
	mov x25, #0
	mov w8, #0
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	sub x10, x21, #1
	cmp x17, x23
	csel x20, x17, x23, lo
	ldr x9, [sp, #72]
	str x1, [sp, #160]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	mul x9, x9, x1
	stp x9, x10, [sp, #128]
LBB14_25:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w8, #0, LBB14_28
	ldr x8, [sp, #136]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x25, x25, x8
	cset w8, hs
	ldur x9, [x29, #-136]
	cmp x25, x9
	csinc w8, w8, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w8, #0
	csinc x9, x9, x25, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	tbnz w8, #0, LBB14_78
	stur x9, [x29, #-144]
	b LBB14_30

	ldur x8, [x29, #-136]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x25, x8
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x8, x25, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	b.hs LBB14_78
	stur x8, [x29, #-144]
LBB14_30:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 46
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	add x8, x25, x21
	ldur x9, [x29, #-136]
	cmp x8, x9
	csel x16, x8, x9, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub x26, x16, x25
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	mul x10, x26, x23
	lsl x0, x10, #2
	stp x0, x10, [x29, #-160]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	cbz x10, LBB14_35
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	lsr x9, x10, #61
	cmp x9, #0
	cset w8, eq
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	cbnz x9, LBB14_84
	ubfiz x1, x8, #2, #32
	str x1, [sp, #144]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 171
		match layout.size() {
	cbz x0, LBB14_77
	str x16, [sp, #152]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	bl ___rust_alloc_zeroed
	ldr x16, [sp, #152]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	cbz x0, LBB14_85

	ldr x8, [sp, #160]
	ldur x9, [x29, #-120]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x9, x8
	b.hi LBB14_36
	b LBB14_41

	mov w0, #4
	ldr x8, [sp, #160]
	ldur x9, [x29, #-120]
	cmp x9, x8
	b.ls LBB14_41
LBB14_36:
	cmp x16, x25
	b.ls LBB14_41
	lsl x8, x16, #2
	sub x8, x8, x25, lsl #2
	ldp x12, x9, [sp, #120]
	add x11, x9, x25
	mov x9, x0
	ldr x10, [sp, #160]
	add x11, x12, x11, lsl #2
LBB14_38:
	mov x12, x26
	mov x13, x11
	mov x14, x9
LBB14_39:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 73
		copy.insert(i - i_from, j - j_from, *self.get(i, j));
	ldr w15, [x13], #4
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	str w15, [x14], #4
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	subs x12, x12, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	b.ne LBB14_39
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x10, x10, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	add x9, x9, x8
	ldur x12, [x29, #-128]
	add x11, x11, x12
	ldur x12, [x29, #-120]
	cmp x10, x12
	b.ne LBB14_38
LBB14_41:
	ldur x8, [x29, #-104]
	ldr x9, [sp, #168]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	cmp x9, x8
	b.eq LBB14_83
	cmp x16, x25
	b.eq LBB14_83
	sub x8, x26, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cbz x20, LBB14_68
	mov x10, #0
	mov w12, #0
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	lsl x9, x16, #2
	sub x9, x9, x25, lsl #2
	b LBB14_46
LBB14_45:
	mov w12, #1
	mov x10, x11
LBB14_46:
	tbz w12, #0, LBB14_48
	ldur x11, [x29, #-96]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x10, x10, x11
	cset w11, hs
	cmp x10, x27
	csinc w12, w11, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w12, #0
	csinc x11, x27, x10, ne
	tbz w12, #0, LBB14_49
	b LBB14_75

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x10, x27
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x11, x10, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB14_75

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x10, x22
	b.hs LBB14_63
	mov x13, #0
	mov w15, #0
	ldp x14, x12, [x29, #-112]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	add x12, x12, x10
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	madd x12, x14, x12, x25
LBB14_51:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w15, #0, LBB14_54
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x14, x13, x8
	cset w13, hs
	cmp x14, x21
	csinc w15, w13, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w15, #0
	csinc x13, x21, x14, ne
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 51
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	tbnz w15, #0, LBB14_45
	mov w15, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x14, x26
	b.hs LBB14_51
	b LBB14_56

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x13, x21
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x15, x13, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 51
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	b.hs LBB14_45
	mov x14, x13
	mov x13, x15
	mov w15, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x14, x26
	b.hs LBB14_51
LBB14_56:
	mov x15, #0
	add x16, x12, x14
	add x16, x28, x16, lsl #2
	mov x17, x0
LBB14_57:
	mov x1, x16
	mov x2, x10
LBB14_58:
	madd x3, x2, x23, x15
	mov x4, x1
	mov x5, x14
LBB14_59:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/internal_macros.rs : 55
		$imp::$method(*self, *other)
	ldr w6, [x17, x5, lsl #2]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x7, x5, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/internal_macros.rs : 55
		$imp::$method(*self, *other)
	ldr w5, [x24, x3, lsl #2]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 58
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	ldr w30, [x4]
	madd w5, w5, w6, w30
	str w5, [x4], #4
	mov x5, x7
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cmp x7, x26
	b.lo LBB14_59
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x2, x2, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	add x1, x1, x19
	cmp x2, x22
	b.lo LBB14_58
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	add x15, x15, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	add x17, x17, x9
	cmp x15, x20
	b.ne LBB14_57
	mov w15, #1
	b LBB14_51
LBB14_63:
	mov w10, #1
LBB14_64:
	mov w12, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x13, x10, x8
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 51
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x10, x10, x26
	b.hs LBB14_67
	cmp x13, x21
	b.lo LBB14_64
	mov x10, x11
	b LBB14_46
LBB14_67:
	mov x10, x11
	b LBB14_46

	mov x9, #0
	mov w10, #0
LBB14_69:
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	tbz w10, #0, LBB14_71
	ldur x10, [x29, #-96]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x9, x9, x10
	cset w10, hs
	cmp x9, x27
	csinc w10, w10, wzr, lo
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	cmp w10, #0
	csinc x9, x27, x9, ne
	tbz w10, #0, LBB14_72
	b LBB14_75

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp x9, x27
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	cinc x9, x9, lo
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	b.hs LBB14_75

	mov w11, #1
LBB14_73:
	mov w10, #1
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	adds x12, x11, x8
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 51
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	add x11, x11, x26
	b.hs LBB14_69
	cmp x12, x21
	b.lo LBB14_73
	b LBB14_69
LBB14_75:
	mov w8, #1
	ldp x9, x25, [x29, #-152]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x9, LBB14_25
	ldur x1, [x29, #-160]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov w2, #4
	bl ___rust_dealloc
	mov w8, #1
	b LBB14_25

	mov x0, x1
	cbnz x1, LBB14_34
	b LBB14_85
LBB14_78:
	mov w8, #1
	ldp x25, x20, [sp, #56]
	ldp x21, x9, [sp, #104]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	cbz x9, LBB14_8
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov x0, x24
	ldr x1, [sp, #96]
	mov w2, #4
	bl ___rust_dealloc
	mov w8, #1
	b LBB14_8

	mov x24, x26
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	cbnz x26, LBB14_16

		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 189
		Err(_) => handle_alloc_error(layout),
	mov x0, x26
	ldr x1, [sp, #96]
	bl alloc::alloc::handle_alloc_error
LBB14_82:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 83
		}
	ldp x29, x30, [sp, #336]
	ldp x20, x19, [sp, #320]
	ldp x22, x21, [sp, #304]
	ldp x24, x23, [sp, #288]
	ldp x26, x25, [sp, #272]
	ldp x28, x27, [sp, #256]
	add sp, sp, #352
	ret
LBB14_83:
Lloh8:
	adrp x0, l_anon.055998728a44272401c17263f21ebe43.2@PAGE
Lloh9:
	add x0, x0, l_anon.055998728a44272401c17263f21ebe43.2@PAGEOFF
Lloh10:
	adrp x2, l_anon.055998728a44272401c17263f21ebe43.4@PAGE
Lloh11:
	add x2, x2, l_anon.055998728a44272401c17263f21ebe43.4@PAGEOFF
	mov w1, #27
	bl core::panicking::panic

	bl alloc::raw_vec::capacity_overflow
LBB14_85:
	ldr x0, [sp, #144]
	ldur x1, [x29, #-160]
		// /rustc/521f4dae1bdf7fe9cf9436ecef9ee7c7442708bf/library/alloc/src/raw_vec.rs : 189
		Err(_) => handle_alloc_error(layout),
	bl alloc::alloc::handle_alloc_error
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
