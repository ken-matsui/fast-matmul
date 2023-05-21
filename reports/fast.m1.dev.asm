	.globl	fast_matmul::fast::matmul
	.p2align	2
fast_matmul::fast::matmul:
Lfunc_begin79:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception10
	stp x28, x27, [sp, #-32]!
	.cfi_def_cfa_offset 32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	.cfi_remember_state
	sub sp, sp, #1568
	str x0, [sp, #416]
	str x1, [sp, #424]
	str x2, [sp, #432]
	str x3, [sp, #440]
	str x4, [sp, #448]
	str x5, [sp, #456]
	str x6, [sp, #464]
	stur x0, [x29, #-224]
	stur x1, [x29, #-216]
	stur x2, [x29, #-208]
	stur x3, [x29, #-200]
	stur x4, [x29, #-192]
	stur x5, [x29, #-184]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for jc in (0..n).step_by(param.nc) {
	str xzr, [sp, #544]
	str x2, [sp, #552]
	ldr x2, [x6]
	ldr x0, [sp, #544]
	ldr x1, [sp, #552]
	add x8, sp, #512
	str x8, [sp, #472]
	bl core::iter::traits::iterator::Iterator::step_by
	ldr x0, [sp, #472]
	add x8, sp, #480
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	ldr q0, [sp, #480]
	str q0, [sp, #560]
	ldr q0, [sp, #496]
	str q0, [sp, #576]
	b LBB79_1
LBB79_1:
	add x0, sp, #560
	bl <core::iter::adapters::step_by::StepBy<I> as core::iter::traits::iterator::Iterator>::next
	str x0, [sp, #592]
	str x1, [sp, #600]
	ldr x8, [sp, #592]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_3
	b LBB79_2
LBB79_2:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 83
		}
	add sp, sp, #1568
	.cfi_def_cfa wsp, 32
	ldp x29, x30, [sp, #16]
	ldp x28, x27, [sp], #32
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w27
	.cfi_restore w28
	ret

	.cfi_restore_state
	ldr x8, [sp, #464]
	ldr x9, [sp, #424]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 39
		for jc in (0..n).step_by(param.nc) {
	ldr x10, [sp, #600]
	str x10, [sp, #400]
	stur x10, [x29, #-176]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 40
		for pc in (0..k).step_by(param.kc) {
	str xzr, [sp, #672]
	str x9, [sp, #680]
	ldr x2, [x8, #16]
	ldr x0, [sp, #672]
	ldr x1, [sp, #680]
	add x8, sp, #640
	str x8, [sp, #408]
	bl core::iter::traits::iterator::Iterator::step_by
	ldr x0, [sp, #408]
	add x8, sp, #608
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	ldr q0, [sp, #608]
	str q0, [sp, #688]
	ldr q0, [sp, #624]
	str q0, [sp, #704]
	b LBB79_4
LBB79_4:
	add x0, sp, #688
	bl <core::iter::adapters::step_by::StepBy<I> as core::iter::traits::iterator::Iterator>::next
	str x0, [sp, #728]
	str x1, [sp, #736]
	ldr x8, [sp, #728]
	subs x8, x8, #0
	cset w8, eq
	tbnz w8, #0, LBB79_1
	b LBB79_5
LBB79_5:
	ldr x9, [sp, #464]
	ldr x8, [sp, #736]
	str x8, [sp, #384]
	stur x8, [x29, #-168]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let ik = min(pc + param.kc, k);
	ldr x9, [x9, #16]
	adds x8, x8, x9
	str x8, [sp, #392]
	cset w8, hs
	tbnz w8, #0, LBB79_7
	b LBB79_6
LBB79_6:
	ldr x1, [sp, #424]
	ldr x0, [sp, #392]
	bl core::cmp::min
	ldr x9, [sp, #464]
	ldr x8, [sp, #400]
	str x0, [sp, #368]
	stur x0, [x29, #-160]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 42
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	ldr x9, [x9]
	adds x8, x8, x9
	str x8, [sp, #376]
	cset w8, hs
	tbnz w8, #0, LBB79_9
	b LBB79_8

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 41
		let ik = min(pc + param.kc, k);
	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_17@PAGE
	add x2, x2, l___unnamed_17@PAGEOFF
	bl core::panicking::panic
LBB79_8:
	ldr x1, [sp, #432]
	ldr x0, [sp, #376]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 42
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	bl core::cmp::min
	ldr x1, [sp, #384]
	ldr x2, [sp, #368]
	ldr x3, [sp, #400]
	mov x4, x0
	ldr x0, [sp, #448]
	add x8, sp, #744
	bl fast_matmul::matrix::Matrix::pack_into
	ldr x9, [sp, #416]
	ldr x8, [sp, #464]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	str xzr, [sp, #848]
	str x9, [sp, #856]
	ldr x2, [x8, #8]
	ldr x0, [sp, #848]
	ldr x1, [sp, #856]
	add x8, sp, #816
	bl core::iter::traits::iterator::Iterator::step_by
	b LBB79_12

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 42
		let Bc = B.pack_into(pc, ik, jc, min(jc + param.nc, n));
	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_18@PAGE
	add x2, x2, l___unnamed_18@PAGEOFF
	bl core::panicking::panic
LBB79_10:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 81
		}
	add x0, sp, #744
	bl core::ptr::drop_in_place<fast_matmul::matrix::Matrix>
	b LBB79_84

	stur x0, [x29, #-152]
	mov x8, x1
	stur w8, [x29, #-144]
	b LBB79_10
LBB79_12:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	add x8, sp, #784
	add x0, sp, #816
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	b LBB79_13
LBB79_13:
	ldr q0, [sp, #784]
	str q0, [sp, #864]
	ldr q0, [sp, #800]
	str q0, [sp, #880]
	b LBB79_14
LBB79_14:
	add x0, sp, #864
	bl <core::iter::adapters::step_by::StepBy<I> as core::iter::traits::iterator::Iterator>::next
	str x0, [sp, #352]
	str x1, [sp, #360]
	b LBB79_15
LBB79_15:
	ldr x8, [sp, #360]
	ldr x9, [sp, #352]
	str x9, [sp, #904]
	str x8, [sp, #912]
	ldr x8, [sp, #904]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_17
	b LBB79_16
LBB79_16:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 81
		}
	add x0, sp, #744
	bl core::ptr::drop_in_place<fast_matmul::matrix::Matrix>
	b LBB79_4

	ldr x9, [sp, #464]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 44
		for ic in (0..m).step_by(param.mc) {
	ldr x8, [sp, #912]
	str x8, [sp, #336]
	stur x8, [x29, #-136]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 46
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	ldr x9, [x9, #8]
	adds x8, x8, x9
	str x8, [sp, #344]
	cset w8, hs
	tbnz w8, #0, LBB79_19
	b LBB79_18
LBB79_18:
	ldr x1, [sp, #416]
	ldr x0, [sp, #344]
	bl core::cmp::min
	str x0, [sp, #328]
	b LBB79_21

	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_19@PAGE
	add x2, x2, l___unnamed_19@PAGEOFF
	bl core::panicking::panic
	b LBB79_20
LBB79_20:
	brk #0x1
LBB79_21:
	ldr x4, [sp, #368]
	ldr x3, [sp, #384]
	ldr x2, [sp, #328]
	ldr x1, [sp, #336]
	ldr x0, [sp, #440]
	add x8, sp, #920
	bl fast_matmul::matrix::Matrix::pack_into
	b LBB79_22
LBB79_22:
	ldr x8, [sp, #464]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	ldr x8, [x8]
	str xzr, [sp, #1024]
	str x8, [sp, #1032]
	ldr x2, [sp, #776]
	ldr x0, [sp, #1024]
	ldr x1, [sp, #1032]
	add x8, sp, #992
	bl core::iter::traits::iterator::Iterator::step_by
	b LBB79_25
LBB79_23:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 80
		}
	add x0, sp, #920
	bl core::ptr::drop_in_place<fast_matmul::matrix::Matrix>
	b LBB79_10

	stur x0, [x29, #-152]
	mov x8, x1
	stur w8, [x29, #-144]
	b LBB79_23
LBB79_25:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	add x8, sp, #960
	add x0, sp, #992
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	b LBB79_26
LBB79_26:
	ldr q0, [sp, #960]
	str q0, [sp, #1040]
	ldr q0, [sp, #976]
	str q0, [sp, #1056]
	b LBB79_27
LBB79_27:
	add x0, sp, #1040
	bl <core::iter::adapters::step_by::StepBy<I> as core::iter::traits::iterator::Iterator>::next
	str x0, [sp, #312]
	str x1, [sp, #320]
	b LBB79_28
LBB79_28:
	ldr x8, [sp, #320]
	ldr x9, [sp, #312]
	str x9, [sp, #1072]
	str x8, [sp, #1080]
	ldr x8, [sp, #1072]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_30
	b LBB79_29
LBB79_29:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 80
		}
	add x0, sp, #920
	bl core::ptr::drop_in_place<fast_matmul::matrix::Matrix>
	b LBB79_14

	ldr x8, [sp, #464]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 50
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	ldr x9, [sp, #1080]
	str x9, [sp, #304]
	stur x9, [x29, #-128]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 51
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	ldr x8, [x8, #8]
	str xzr, [sp, #1152]
	str x8, [sp, #1160]
	ldr x2, [sp, #944]
	ldr x0, [sp, #1152]
	ldr x1, [sp, #1160]
	add x8, sp, #1120
	bl core::iter::traits::iterator::Iterator::step_by
	b LBB79_31
LBB79_31:
	add x8, sp, #1088
	add x0, sp, #1120
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	b LBB79_32
LBB79_32:
	ldr q0, [sp, #1088]
	str q0, [sp, #1168]
	ldr q0, [sp, #1104]
	str q0, [sp, #1184]
	b LBB79_33
LBB79_33:
	add x0, sp, #1168
	bl <core::iter::adapters::step_by::StepBy<I> as core::iter::traits::iterator::Iterator>::next
	str x0, [sp, #288]
	str x1, [sp, #296]
	b LBB79_34
LBB79_34:
	ldr x8, [sp, #296]
	ldr x9, [sp, #288]
	str x9, [sp, #1200]
	str x8, [sp, #1208]
	ldr x8, [sp, #1200]
	subs x8, x8, #0
	cset w8, eq
	tbnz w8, #0, LBB79_27
	b LBB79_35
LBB79_35:
	ldr x8, [sp, #464]
	ldr x9, [sp, #1208]
	str x9, [sp, #272]
	stur x9, [x29, #-120]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 55
		for pr in 0..min(param.kc, Ac.col /* or Bc.row */) {
	ldr x0, [x8, #16]
	ldr x1, [sp, #952]
	bl core::cmp::min
	str x0, [sp, #280]
	b LBB79_36
LBB79_36:
	ldr x8, [sp, #280]
	str xzr, [sp, #1216]
	str x8, [sp, #1224]
	ldr x0, [sp, #1216]
	ldr x1, [sp, #1224]
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	str x0, [sp, #256]
	str x1, [sp, #264]
	b LBB79_37
LBB79_37:
	ldr x8, [sp, #264]
	ldr x9, [sp, #256]
	str x9, [sp, #1232]
	str x8, [sp, #1240]
	b LBB79_38
LBB79_38:
	add x0, sp, #1232
	bl core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
	str x0, [sp, #240]
	str x1, [sp, #248]
	b LBB79_39
LBB79_39:
	ldr x8, [sp, #248]
	ldr x9, [sp, #240]
	str x9, [sp, #1248]
	str x8, [sp, #1256]
	ldr x8, [sp, #1248]
	subs x8, x8, #0
	cset w8, eq
	tbnz w8, #0, LBB79_33
	b LBB79_40
LBB79_40:
	ldr x9, [sp, #304]
	ldr x8, [sp, #1256]
	str x8, [sp, #216]
	stur x8, [x29, #-112]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 56
		for j in jr..Bc.col {
	ldr x8, [sp, #776]
	str x9, [sp, #1264]
	str x8, [sp, #1272]
	ldr x0, [sp, #1264]
	ldr x1, [sp, #1272]
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	str x0, [sp, #224]
	str x1, [sp, #232]
	b LBB79_41
LBB79_41:
	ldr x8, [sp, #232]
	ldr x9, [sp, #224]
	str x9, [sp, #1280]
	str x8, [sp, #1288]
	b LBB79_42
LBB79_42:
	add x0, sp, #1280
	bl core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
	str x0, [sp, #200]
	str x1, [sp, #208]
	b LBB79_43
LBB79_43:
	ldr x8, [sp, #208]
	ldr x9, [sp, #200]
	str x9, [sp, #1296]
	str x8, [sp, #1304]
	ldr x8, [sp, #1296]
	subs x8, x8, #0
	cset w8, eq
	tbnz w8, #0, LBB79_38
	b LBB79_44
LBB79_44:
	ldr x9, [sp, #272]
	ldr x8, [sp, #1304]
	str x8, [sp, #176]
	stur x8, [x29, #-104]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		for i in ir..Ac.row {
	ldr x8, [sp, #944]
	str x9, [sp, #1312]
	str x8, [sp, #1320]
	ldr x0, [sp, #1312]
	ldr x1, [sp, #1320]
	bl <I as core::iter::traits::collect::IntoIterator>::into_iter
	str x0, [sp, #184]
	str x1, [sp, #192]
	b LBB79_45
LBB79_45:
	ldr x8, [sp, #192]
	ldr x9, [sp, #184]
	stur x9, [x29, #-256]
	stur x8, [x29, #-248]
	b LBB79_46
LBB79_46:
	sub x0, x29, #256
	bl core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
	str x0, [sp, #160]
	str x1, [sp, #168]
	b LBB79_47
LBB79_47:
	ldr x8, [sp, #168]
	ldr x9, [sp, #160]
	stur x9, [x29, #-240]
	stur x8, [x29, #-232]
	ldur x8, [x29, #-240]
	subs x8, x8, #0
	cset w8, eq
	tbnz w8, #0, LBB79_42
	b LBB79_48
LBB79_48:
	ldr x8, [sp, #216]
	ldur x9, [x29, #-232]
	str x9, [sp, #136]
	stur x9, [x29, #-96]
	add x0, sp, #920
	mov x10, x0
	stur x10, [x29, #-64]
	stur x9, [x29, #-56]
	stur x8, [x29, #-48]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 54
		unsafe { self.inner.get_unchecked(j * self.row + i) }
	bl <alloc::vec::Vec<T,A> as core::ops::deref::Deref>::deref
	str x0, [sp, #144]
	str x1, [sp, #152]
	b LBB79_49
LBB79_49:
	ldr x9, [sp, #216]
	ldr x10, [sp, #944]
	umulh x8, x9, x10
	mul x9, x9, x10
	str x9, [sp, #128]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_51
	b LBB79_50
LBB79_50:
	ldr x8, [sp, #128]
	ldr x9, [sp, #136]
	adds x8, x8, x9
	str x8, [sp, #120]
	cset w8, hs
	tbnz w8, #0, LBB79_54
	b LBB79_53

	adrp x0, _str.1@PAGE
	add x0, x0, _str.1@PAGEOFF
	mov w8, #33
	mov x1, x8
	adrp x2, l___unnamed_20@PAGE
	add x2, x2, l___unnamed_20@PAGEOFF
	bl core::panicking::panic
	b LBB79_52
LBB79_52:
	brk #0x1
LBB79_53:
	ldr x2, [sp, #120]
	ldr x1, [sp, #152]
	ldr x0, [sp, #144]
	bl core::slice::<impl [T]>::get_unchecked
	str x0, [sp, #112]
	b LBB79_56

	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_20@PAGE
	add x2, x2, l___unnamed_20@PAGEOFF
	bl core::panicking::panic
	b LBB79_55
LBB79_55:
	brk #0x1
LBB79_56:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		}
	b LBB79_57
LBB79_57:
	ldr x8, [sp, #176]
	ldr x9, [sp, #216]
	add x0, sp, #744
	mov x10, x0
	stur x10, [x29, #-88]
	stur x9, [x29, #-80]
	stur x8, [x29, #-72]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 54
		unsafe { self.inner.get_unchecked(j * self.row + i) }
	bl <alloc::vec::Vec<T,A> as core::ops::deref::Deref>::deref
	str x0, [sp, #96]
	str x1, [sp, #104]
	b LBB79_58
LBB79_58:
	ldr x9, [sp, #176]
	ldr x10, [sp, #768]
	umulh x8, x9, x10
	mul x9, x9, x10
	str x9, [sp, #88]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_60
	b LBB79_59
LBB79_59:
	ldr x8, [sp, #88]
	ldr x9, [sp, #216]
	adds x8, x8, x9
	str x8, [sp, #80]
	cset w8, hs
	tbnz w8, #0, LBB79_63
	b LBB79_62

	adrp x0, _str.1@PAGE
	add x0, x0, _str.1@PAGEOFF
	mov w8, #33
	mov x1, x8
	adrp x2, l___unnamed_20@PAGE
	add x2, x2, l___unnamed_20@PAGEOFF
	bl core::panicking::panic
	b LBB79_61
LBB79_61:
	brk #0x1
LBB79_62:
	ldr x2, [sp, #80]
	ldr x1, [sp, #104]
	ldr x0, [sp, #96]
	bl core::slice::<impl [T]>::get_unchecked
	str x0, [sp, #72]
	b LBB79_65

	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_20@PAGE
	add x2, x2, l___unnamed_20@PAGEOFF
	bl core::panicking::panic
	b LBB79_64
LBB79_64:
	brk #0x1
LBB79_65:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 55
		}
	b LBB79_66
LBB79_66:
	ldr x1, [sp, #72]
	ldr x0, [sp, #112]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 58
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	bl <&u32 as core::ops::arith::Mul<&u32>>::mul
	str w0, [sp, #68]
	b LBB79_67
LBB79_67:
	ldr x8, [sp, #136]
	ldr x9, [sp, #336]
	adds x8, x8, x9
	str x8, [sp, #56]
	cset w8, hs
	tbnz w8, #0, LBB79_69
	b LBB79_68
LBB79_68:
	ldr x8, [sp, #176]
	ldr x9, [sp, #400]
	adds x8, x8, x9
	str x8, [sp, #48]
	cset w8, hs
	tbnz w8, #0, LBB79_79
	b LBB79_70

	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_21@PAGE
	add x2, x2, l___unnamed_21@PAGEOFF
	bl core::panicking::panic
	b LBB79_20
LBB79_70:
	ldr x0, [sp, #456]
	ldr x8, [sp, #48]
	ldr x9, [sp, #56]
	mov x10, x0
	stur x10, [x29, #-40]
	stur x9, [x29, #-32]
	stur x8, [x29, #-24]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 58
		unsafe { &mut *self.inner.get_unchecked_mut(j * self.row + i) }
	bl <alloc::vec::Vec<T,A> as core::ops::deref::DerefMut>::deref_mut
	str x0, [sp, #32]
	str x1, [sp, #40]
	b LBB79_71
LBB79_71:
	ldr x9, [sp, #48]
	ldr x8, [sp, #456]
	ldr x10, [x8, #24]
	umulh x8, x9, x10
	mul x9, x9, x10
	str x9, [sp, #24]
	subs x8, x8, #0
	cset w8, ne
	tbnz w8, #0, LBB79_73
	b LBB79_72
LBB79_72:
	ldr x8, [sp, #24]
	ldr x9, [sp, #56]
	adds x8, x8, x9
	str x8, [sp, #16]
	cset w8, hs
	tbnz w8, #0, LBB79_76
	b LBB79_75

	adrp x0, _str.1@PAGE
	add x0, x0, _str.1@PAGEOFF
	mov w8, #33
	mov x1, x8
	adrp x2, l___unnamed_22@PAGE
	add x2, x2, l___unnamed_22@PAGEOFF
	bl core::panicking::panic
	b LBB79_74
LBB79_74:
	brk #0x1
LBB79_75:
	ldr x2, [sp, #16]
	ldr x1, [sp, #40]
	ldr x0, [sp, #32]
	bl core::slice::<impl [T]>::get_unchecked_mut
	str x0, [sp, #8]
	b LBB79_78

	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_22@PAGE
	add x2, x2, l___unnamed_22@PAGEOFF
	bl core::panicking::panic
	b LBB79_77
LBB79_77:
	brk #0x1
LBB79_78:
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/matrix.rs : 59
		}
	b LBB79_80

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 58
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_23@PAGE
	add x2, x2, l___unnamed_23@PAGEOFF
	bl core::panicking::panic
	b LBB79_20
LBB79_80:
	ldr w9, [sp, #68]
	ldr x8, [sp, #8]
	ldr w8, [x8]
	adds w8, w8, w9
	str w8, [sp, #4]
	cset w8, hs
	tbnz w8, #0, LBB79_82
	b LBB79_81
LBB79_81:
	ldr w8, [sp, #4]
	ldr x9, [sp, #8]
	str w8, [x9]
		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 57
		for i in ir..Ac.row {
	b LBB79_46

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 58
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	adrp x0, _str.2@PAGE
	add x0, x0, _str.2@PAGEOFF
	mov w8, #28
	mov x1, x8
	adrp x2, l___unnamed_24@PAGE
	add x2, x2, l___unnamed_24@PAGEOFF
	bl core::panicking::panic
	b LBB79_20

		// /Users/kmatsui/Library/CloudStorage/Dropbox/GitHub/ken-matsui/fast-matmul/src/fast.rs : 38
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	bl core::panicking::panic_cannot_unwind
LBB79_84:
	ldur x0, [x29, #-152]
	bl __Unwind_Resume
