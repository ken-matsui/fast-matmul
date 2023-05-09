.section .text.fast_matmul::fast::matmul,"ax",@progbits
	.globl	fast_matmul::fast::matmul
	.p2align	4, 0x90
	.type	fast_matmul::fast::matmul,@function
fast_matmul::fast::matmul:

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 37
		pub fn matmul(m: usize, k: usize, n: usize, A: &Matrix, B: &Matrix, C: &mut Matrix, param: Param) {
	.cfi_startproc
	push rbp
	.cfi_def_cfa_offset 16
	push r15
	.cfi_def_cfa_offset 24
	push r14
	.cfi_def_cfa_offset 32
	push r13
	.cfi_def_cfa_offset 40
	push r12
	.cfi_def_cfa_offset 48
	push rbx
	.cfi_def_cfa_offset 56
	sub rsp, 344
	.cfi_def_cfa_offset 400
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16

	mov r12, rdx
	mov rdx, qword ptr [rsp + 400]

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	mov rax, qword ptr [rdx]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	test rax, rax
	je .LBB12_97

	mov r13, rsi
	mov r11, rdi
	mov qword ptr [rsp + 48], rax

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	lea r15, [rax - 1]

	mov rax, qword ptr [r8 + 24]
	mov qword ptr [rsp + 144], rax
	mov rax, qword ptr [r8]
	mov qword ptr [rsp + 320], rax
	mov rbx, qword ptr [r8 + 16]
	mov rax, qword ptr [rcx + 24]
	mov qword ptr [rsp + 160], rax
	mov rax, qword ptr [rcx]
	mov qword ptr [rsp + 328], rax
	mov rax, qword ptr [rcx + 16]
	mov qword ptr [rsp + 176], rax
	mov rax, qword ptr [r9 + 24]
	mov qword ptr [rsp + 168], rax
	mov rax, qword ptr [r9]
	mov qword ptr [rsp + 336], rax
	mov rax, qword ptr [r9 + 16]
	mov qword ptr [rsp + 184], rax
	xor eax, eax
	xor ecx, ecx

	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 24], rdi

	mov qword ptr [rsp + 136], rbx
	mov qword ptr [rsp + 256], r15

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test al, 1
	je .LBB12_5

.LBB12_3:
	mov rsi, qword ptr [rsp + 8]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rsi, r15
	setb al
	cmp rsi, r12
	setae cl

	or cl, al

	mov rax, rsi
	mov qword ptr [rsp + 8], rsi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [rsi + 1]
	cmovne rax, r12

	mov qword ptr [rsp + 72], rax

	mov rax, qword ptr [rsp + 48]
	je .LBB12_6
	jmp .LBB12_4

	.p2align	4, 0x90
.LBB12_5:
	mov rax, qword ptr [rsp + 8]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rax, r12

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	mov rcx, rax

	adc rcx, 0

	mov qword ptr [rsp + 72], rcx

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rax, r12

	mov rax, qword ptr [rsp + 48]

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 38
		for jc in (0..n).step_by(param.nc) {
	jae .LBB12_4

.LBB12_6:
		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	mov rdx, qword ptr [rdx + 16]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	test rdx, rdx
	je .LBB12_97

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	lea rcx, [rdx - 1]

	mov qword ptr [rsp + 312], rcx

	mov rcx, qword ptr [rsp + 8]
	add rax, rcx
	cmp rax, r12
	cmovae rax, r12
	mov qword ptr [rsp + 88], rax
	sub rax, rcx
	mov qword ptr [rsp + 120], rax
	dec rax
	mov qword ptr [rsp + 152], rax
	mov rax, qword ptr [rsp + 144]

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	imul rax, rcx
	mov qword ptr [rsp + 304], rax
	xor ecx, ecx
	xor ebx, ebx
	mov qword ptr [rsp + 80], rdx

.LBB12_8:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test bl, 1
	je .LBB12_11

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rcx, qword ptr [rsp + 312]

	mov rsi, rcx
	setb al
	cmp rcx, r13
	setae cl

	or cl, al

	mov rdi, rsi
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [rsi + 1]
	cmovne rax, r13

	mov rbx, qword ptr [rsp + 136]
	je .LBB12_12
	jmp .LBB12_10

	.p2align	4, 0x90
.LBB12_11:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rcx, r13

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	mov rax, rcx
	adc rax, 0

	mov rdi, rcx

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rcx, r13
	mov rbx, qword ptr [rsp + 136]

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 39
		for pc in (0..k).step_by(param.kc) {
	jae .LBB12_10

.LBB12_12:
	mov qword ptr [rsp + 16], rdi

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 40
		let ik = min(pc + param.kc, k);
	lea rcx, [rdi + rdx]

	cmp rcx, r13
	cmovae rcx, r13

	mov qword ptr [rsp + 96], rcx

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub rcx, rdi

	mov qword ptr [rsp + 64], rcx

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	imul rcx, qword ptr [rsp + 120]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	test rcx, rcx

	mov qword ptr [rsp + 264], rax

	mov qword ptr [rsp + 32], rcx

	je .LBB12_13

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	xor r15d, r15d
	movabs rax, 2305843009213693952
	cmp rcx, rax
	setb al

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	jae .LBB12_98

	lea rbp, [4*rcx]
	mov r15b, al
	shl r15, 2

	test rbp, rbp

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 171
		match layout.size() {
	je .LBB12_16

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	mov rdi, rbp
	mov rsi, r15
	call qword ptr [rip + __rust_alloc_zeroed@GOTPCREL]
	mov r11, qword ptr [rsp + 24]
	mov r14, rax

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	test r14, r14
	je .LBB12_99

.LBB12_19:
	mov rax, qword ptr [rsp + 88]
	cmp rax, qword ptr [rsp + 8]

	mov r15, qword ptr [rsp + 144]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	ja .LBB12_20
	jmp .LBB12_27

	.p2align	4, 0x90
.LBB12_13:
	mov r14d, 4
	mov rax, qword ptr [rsp + 88]
	cmp rax, qword ptr [rsp + 8]

	mov r15, qword ptr [rsp + 144]
	jbe .LBB12_27

.LBB12_20:
	mov rcx, qword ptr [rsp + 96]
	sub rcx, qword ptr [rsp + 16]
	jbe .LBB12_27

	mov rax, qword ptr [rsp + 304]
	mov rdx, qword ptr [rsp + 16]

	add rdx, rax
	xor esi, esi
	mov r8, qword ptr [rsp + 8]

	.p2align	4, 0x90
.LBB12_22:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	inc r8

	mov r9, rcx
	mov rdi, rdx
	mov rax, rsi

	.p2align	4, 0x90
.LBB12_23:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp rdi, rbx
	jae .LBB12_33

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp rax, qword ptr [rsp + 32]
	jae .LBB12_35

	mov r10, qword ptr [rsp + 320]

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	mov r10d, dword ptr [r10 + 4*rdi]

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	mov dword ptr [r14 + 4*rax], r10d

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	inc rax
	inc rdi
	dec r9

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jne .LBB12_23

	add rsi, qword ptr [rsp + 64]
	add rdx, r15

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp r8, qword ptr [rsp + 88]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jne .LBB12_22

.LBB12_27:
	mov qword ptr [rsp + 200], r13
	mov qword ptr [rsp + 208], r12

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	mov rax, qword ptr [rsp + 400]
	mov r13, qword ptr [rax + 8]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	test r13, r13
	je .LBB12_97

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 22
		StepBy { iter, step: step - 1, first_take: true }
	lea rax, [r13 - 1]

	mov qword ptr [rsp + 280], rax

	mov rax, qword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 64]
	cmp rax, rcx
	cmovb rcx, rax
	mov qword ptr [rsp + 128], rcx
	mov rax, qword ptr [rsp + 160]
	mov rdx, qword ptr [rsp + 16]

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	imul rax, rdx
	mov qword ptr [rsp + 272], rax
	xor esi, esi
	xor r15d, r15d
	mov r12, qword ptr [rsp + 176]

.LBB12_29:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test r15b, 1
	je .LBB12_36

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rsi, qword ptr [rsp + 280]

	setb al
	cmp rsi, r11
	setae cl

	or cl, al

	mov rdi, rsi
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [rsi + 1]
	cmovne rax, r11

	mov rcx, rax
	je .LBB12_31
	jmp .LBB12_37

	.p2align	4, 0x90
.LBB12_36:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rsi, r11

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	mov rax, rsi
	adc rax, 0

	mov rdi, rsi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rsi, r11
	mov rcx, rax

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 43
		for ic in (0..m).step_by(param.mc) {
	jae .LBB12_37

.LBB12_31:
	mov qword ptr [rsp + 56], rdi

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 45
		let Ac = A.pack_into(ic, min(ic + param.mc, m), pc, ik);
	lea r15, [rdi + r13]

	cmp r15, r11
	cmovae r15, r11

	mov rbp, r15

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 70
		let mut copy = Matrix::new(i_to - i_from, j_to - j_from);
	sub r15, rdi

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 26
		inner: vec![Value::default(); row * col],
	mov rbx, r15
	imul rbx, qword ptr [rsp + 64]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	test rbx, rbx

	mov qword ptr [rsp + 296], rcx

	je .LBB12_32

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/alloc/layout.rs : 447
		if element_size != 0 && n > Layout::max_size_for_align(align) / element_size {
	xor esi, esi
	movabs rax, 2305843009213693952
	cmp rbx, rax
	setb al

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 175
		let layout = match Layout::array::<T>(capacity) {
	jae .LBB12_98

	lea rdi, [4*rbx]
	mov sil, al
	shl rsi, 2

	test rdi, rdi

	mov qword ptr [rsp + 112], rsi

	mov qword ptr [rsp + 104], rdi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 171
		match layout.size() {
	je .LBB12_41

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 164
		unsafe { __rust_alloc_zeroed(layout.size(), layout.align()) }
	call qword ptr [rip + __rust_alloc_zeroed@GOTPCREL]
	mov rdx, qword ptr [rsp + 16]
	mov r11, qword ptr [rsp + 24]
	mov r8, rax

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	test r8, r8
	je .LBB12_100

.LBB12_44:
	cmp qword ptr [rsp + 96], rdx

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	ja .LBB12_45
	jmp .LBB12_52

	.p2align	4, 0x90
.LBB12_32:
	mov r8d, 4
	cmp qword ptr [rsp + 96], rdx

	jbe .LBB12_52

.LBB12_45:
	cmp rbp, qword ptr [rsp + 56]
	jbe .LBB12_52

	mov rax, qword ptr [rsp + 272]
	mov rcx, qword ptr [rsp + 56]

	add rax, rcx
	xor edx, edx
	mov rsi, qword ptr [rsp + 16]

	.p2align	4, 0x90
.LBB12_47:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	inc rsi

	mov r9, r15
	mov rdi, rax
	mov rcx, rdx

	.p2align	4, 0x90
.LBB12_48:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp rdi, r12
	jae .LBB12_60

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp rcx, rbx
	jae .LBB12_61

	mov r10, qword ptr [rsp + 328]

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	mov r10d, dword ptr [r10 + 4*rdi]

		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 62
		*self.get_ref_mut(i, j) = val;
	mov dword ptr [r8 + 4*rcx], r10d

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	inc rcx
	inc rdi
	dec r9

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jne .LBB12_48

	add rdx, r15
	add rax, qword ptr [rsp + 160]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rsi, qword ptr [rsp + 96]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jne .LBB12_47

.LBB12_52:
	mov rax, qword ptr [rsp + 88]
	cmp rax, qword ptr [rsp + 8]

	je .LBB12_97

	mov rdi, qword ptr [rsp + 56]
	cmp rbp, rdi
	mov r9, qword ptr [rsp + 48]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 21
		assert!(step != 0);
	je .LBB12_97

	lea rdx, [r15 - 1]
	cmp qword ptr [rsp + 128], 0

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	je .LBB12_85

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	shl rbp, 2
	lea rax, [4*rdi]
	sub rbp, rax
	mov qword ptr [rsp + 240], rbp
	xor r10d, r10d
	xor eax, eax

.LBB12_56:
	test al, 1
	je .LBB12_62

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add r10, qword ptr [rsp + 152]

	setb al
	cmp r10, r9
	setae cl

	or cl, al

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [r10 + 1]
	cmovne rax, r9

	je .LBB12_63
	jmp .LBB12_58

	.p2align	4, 0x90
.LBB12_62:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp r10, r9

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	mov rax, r10
	adc rax, 0

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp r10, r9

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	jae .LBB12_58

.LBB12_63:
	mov qword ptr [rsp + 40], rax

	cmp r10, qword ptr [rsp + 120]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jae .LBB12_64

	mov rax, qword ptr [rsp + 8]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	add rax, r10
	imul rax, qword ptr [rsp + 168]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	add rax, rdi
	mov qword ptr [rsp + 248], rax
	xor eax, eax
	xor ecx, ecx

.LBB12_70:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test cl, 1
	je .LBB12_73

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rax, rdx

	mov rsi, rax
	setb al
	cmp rsi, r13
	setae cl

	or cl, al

	mov rcx, rsi
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [rsi + 1]
	cmovne rax, r13

	je .LBB12_74
	jmp .LBB12_72

	.p2align	4, 0x90
.LBB12_73:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rax, r13
	mov rcx, rax

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	adc rax, 0

	mov rsi, rcx

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rcx, r13

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	jae .LBB12_72

.LBB12_74:
	mov cl, 1
	cmp rsi, r15

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jae .LBB12_70

	mov qword ptr [rsp + 192], rax

	mov rax, qword ptr [rsp + 248]

	lea r11, [rax + rsi]
	mov rax, r8
	xor r9d, r9d
	xor edi, edi
	mov qword ptr [rsp + 232], r10
	mov qword ptr [rsp + 104], rsi
	mov qword ptr [rsp + 224], r11

.LBB12_76:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 488
		unsafe { intrinsics::unchecked_add(self, rhs) }
	lea rcx, [rdi + 1]

	mov qword ptr [rsp + 288], rcx

	mov qword ptr [rsp + 112], rdi

	imul rdi, r15
	mov qword ptr [rsp + 216], rdi

	.p2align	4, 0x90
.LBB12_77:
	mov rdi, r10
	imul rdi, qword ptr [rsp + 64]
	add rdi, qword ptr [rsp + 112]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp rdi, qword ptr [rsp + 32]
	jae .LBB12_93

	inc r10

	mov rcx, r11
	mov r12, rsi

	.p2align	4, 0x90
.LBB12_79:
	lea rsi, [r9 + r12]
	cmp rsi, rbx
	jae .LBB12_92

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	cmp rcx, qword ptr [rsp + 184]
	jae .LBB12_96

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 57
		*C.get_ref_mut(i + ic, j + jc) += Ac.get(i, pr) * Bc.get(pr, j);
	mov esi, dword ptr [rax + 4*r12]
	imul esi, dword ptr [r14 + 4*rdi]

	inc r12

	mov rbp, qword ptr [rsp + 336]

	add dword ptr [rbp + 4*rcx], esi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	inc rcx
	cmp r12, r15

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jb .LBB12_79

	add r11, qword ptr [rsp + 168]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp r10, qword ptr [rsp + 120]
	mov r12, qword ptr [rsp + 176]
	mov rsi, qword ptr [rsp + 104]
	mov cl, 1

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jb .LBB12_77

	add r9, r15
	add rax, qword ptr [rsp + 240]
	mov rdi, qword ptr [rsp + 288]
	mov r10, rdi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rdi, qword ptr [rsp + 128]
	mov r10, qword ptr [rsp + 232]
	mov r11, qword ptr [rsp + 224]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	jne .LBB12_76

	mov r11, qword ptr [rsp + 24]
	mov r9, qword ptr [rsp + 48]
	mov rdi, qword ptr [rsp + 56]
	mov rax, qword ptr [rsp + 192]
	jmp .LBB12_70

	.p2align	4, 0x90
.LBB12_64:
	mov ecx, 1

	.p2align	4, 0x90
.LBB12_65:
		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	mov rsi, rcx

	add rcx, r15
	mov al, 1

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rsi, rdx

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	jb .LBB12_66

	cmp rsi, r13
	jb .LBB12_65

	mov r10, qword ptr [rsp + 40]
	jmp .LBB12_56

	.p2align	4, 0x90
.LBB12_66:
	mov r10, qword ptr [rsp + 40]
	jmp .LBB12_56

.LBB12_72:
	mov al, 1
	mov r10, qword ptr [rsp + 40]
	jmp .LBB12_56

	.p2align	4, 0x90
.LBB12_85:
	xor eax, eax
	xor ecx, ecx

	.p2align	4, 0x90
.LBB12_86:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test cl, 1
	je .LBB12_88

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rax, qword ptr [rsp + 152]

	setb cl
	cmp rax, r9
	setae sil

	or sil, cl

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 632
		if let Some(plus_n) = Step::forward_checked(self.start.clone(), n) {
	lea rax, [rax + 1]

	cmovne rax, r9

	je .LBB12_89
	jmp .LBB12_58

	.p2align	4, 0x90
.LBB12_88:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rax, r9

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/range.rs : 621
		if self.start < self.end {
	mov rcx, rax
	adc rcx, 0

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/cmp.rs : 1363
		fn lt(&self, other: &$t) -> bool { (*self) < (*other) }
	cmp rax, r9
	mov rax, rcx

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 49
		for jr in (0..param.nc).step_by(Bc.col /* nr */) {
	jae .LBB12_58

.LBB12_89:
	mov esi, 1

	.p2align	4, 0x90
.LBB12_90:
		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	mov rdi, rsi

	add rsi, r15
	mov cl, 1

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 1505
		let (a, b) = intrinsics::add_with_overflow(self as $ActualT, rhs as $ActualT);
	add rdi, rdx

		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 50
		for ir in (0..param.mc).step_by(Ac.row /* mr */) {
	jb .LBB12_86

	cmp rdi, r13
	jb .LBB12_90
	jmp .LBB12_86

	.p2align	4, 0x90
.LBB12_58:
	mov r15b, 1

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	test rbx, rbx

	mov rdx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 296]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	je .LBB12_29

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	shl rbx, 2

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov edx, 4
	mov rdi, r8
	mov rbp, rsi
	mov rsi, rbx
	call qword ptr [rip + __rust_dealloc@GOTPCREL]
	mov rsi, rbp
	mov rdx, qword ptr [rsp + 16]
	mov r11, qword ptr [rsp + 24]
	jmp .LBB12_29

	.p2align	4, 0x90
.LBB12_41:
	mov r8, rsi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 187
		let ptr = match result {
	test r8, r8
	jne .LBB12_44
	jmp .LBB12_100

	.p2align	4, 0x90
.LBB12_16:
	mov r14, r15

	test r14, r14
	jne .LBB12_19
	jmp .LBB12_99

.LBB12_37:
	mov bl, 1
	mov rsi, qword ptr [rsp + 32]
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 170
		if T::IS_ZST || capacity == 0 {
	test rsi, rsi

	mov r12, qword ptr [rsp + 208]
	mov r13, qword ptr [rsp + 200]
	mov r15, qword ptr [rsp + 256]
	mov rdx, qword ptr [rsp + 80]
	mov rcx, qword ptr [rsp + 264]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 240
		if T::IS_ZST || self.cap == 0 {
	je .LBB12_8

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/num/uint_macros.rs : 604
		unsafe { intrinsics::unchecked_mul(self, rhs) }
	shl rsi, 2

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/alloc.rs : 111
		unsafe { __rust_dealloc(ptr, layout.size(), layout.align()) }
	mov edx, 4
	mov rdi, r14
	mov r14, rcx
	call qword ptr [rip + __rust_dealloc@GOTPCREL]

	mov rcx, r14
	mov rdx, qword ptr [rsp + 80]
	mov r11, qword ptr [rsp + 24]
	jmp .LBB12_8

.LBB12_10:
	mov al, 1
	mov rcx, qword ptr [rsp + 72]
	mov qword ptr [rsp + 8], rcx
	mov rdx, qword ptr [rsp + 400]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/iter/adapters/step_by.rs : 35
		if self.first_take {
	test al, 1
	je .LBB12_5
	jmp .LBB12_3

.LBB12_96:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.13]

	mov rdi, rcx
	mov rsi, qword ptr [rsp + 184]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_60:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.12]
	mov rsi, r12

	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_61:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.13]
	mov rdi, rcx

	mov rsi, rbx

	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_33:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.12]

	mov rsi, rbx

	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_35:
		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 264
		&mut (*slice)[self]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.13]
	mov rdi, rax
	mov rsi, qword ptr [rsp + 32]

	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_4:
		// /homes/iws/kmatsui/496/fast-matmul/src/fast.rs : 66
		}
	add rsp, 344
	.cfi_def_cfa_offset 56
	pop rbx
	.cfi_def_cfa_offset 48
	pop r12
	.cfi_def_cfa_offset 40
	pop r13
	.cfi_def_cfa_offset 32
	pop r14
	.cfi_def_cfa_offset 24
	pop r15
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	ret

.LBB12_93:
	.cfi_def_cfa_offset 400
		// /homes/iws/kmatsui/496/fast-matmul/src/matrix.rs : 54
		self.inner[j * self.row + i]
	add rsi, qword ptr [rsp + 216]

	mov rax, rsi

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/core/src/slice/index.rs : 258
		&(*slice)[self]
	cmp rsi, rbx
	jae .LBB12_92

	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.12]

	mov rsi, qword ptr [rsp + 32]

	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]

	ud2

.LBB12_92:
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.12]

	mov rdi, rsi

	mov rsi, rbx
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
	ud2

.LBB12_97:
	lea rdi, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.2]
	lea rdx, [rip + .Lanon.741579436d30e2ba7b149fa035f1c35f.4]
	mov esi, 27
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
	ud2

.LBB12_98:
	call qword ptr [rip + alloc::raw_vec::capacity_overflow@GOTPCREL]
	ud2

.LBB12_100:
	mov rdi, qword ptr [rsp + 112]
	mov rsi, qword ptr [rsp + 104]

		// /rustc/c4190f2d3a46a59f435f7b42f58bc22b2f4d6917/library/alloc/src/raw_vec.rs : 189
		Err(_) => handle_alloc_error(layout),
	call qword ptr [rip + alloc::alloc::handle_alloc_error@GOTPCREL]

	ud2

.LBB12_99:
	mov rdi, r15
	mov rsi, rbp
	call qword ptr [rip + alloc::alloc::handle_alloc_error@GOTPCREL]
	ud2

