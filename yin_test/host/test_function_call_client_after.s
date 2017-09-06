	.text
	.file	"test_function_call_client_after.bc"
	.globl	myCriticalFunction
	.p2align	4, 0x90
	.type	myCriticalFunction,@function
myCriticalFunction:                     # @myCriticalFunction
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -16(%rbp)
	movl	$0, vGlobal(%rip)
	movl	$1, vGlobal(%rip)
	callq	myprint
	movl	vGlobal(%rip), %esi
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-4(%rbp), %eax
	addl	vGlobal(%rip), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	myCriticalFunction, .Lfunc_end0-myCriticalFunction
	.cfi_endproc

	.globl	myprint
	.p2align	4, 0x90
	.type	myprint,@function
myprint:                                # @myprint
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	myprint, .Lfunc_end1-myprint
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi6:
	.cfi_def_cfa_offset 16
.Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -40(%rbp)
	movl	%edi, -12(%rbp)
	movq	%rsi, -32(%rbp)
	cmpl	$2, -12(%rbp)
	jne	.LBB2_2
# BB#1:                                 # %if.end
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	callq	atoi
	movl	%eax, -8(%rbp)
	movabsq	$4621875412584313651, %rax # imm = 0x4024333333333333
	movq	%rax, -24(%rbp)
	movl	$1120418005, -4(%rbp)   # imm = 0x42C838D5
	movq	$.L.str.7, -48(%rbp)
	movl	-8(%rbp), %edi
	leaq	-24(%rbp), %rsi
	leaq	-4(%rbp), %rdx
	movl	$.L.str.7, %ecx
	callq	RPC_myCriticalFunction
	movl	%eax, %ecx
	movl	%ecx, -36(%rbp)
	movl	$.L.str.8, %edi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.LBB2_2:                                # %if.then
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	exit
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	vGlobal,@object         # @vGlobal
	.comm	vGlobal,4,4
	.type	.L.str.4,@object        # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"myCriticalFunction incremented vGlobal to %d"
	.size	.L.str.4, 45

	.type	.L.str,@object          # @.str
.L.str:
	.asciz	"this is my print function!!!"
	.size	.L.str, 29

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"usage: test_function_call_client intParam\n"
	.size	.L.str.6, 43

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"test the result!!!"
	.size	.L.str.7, 19

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"\n myCriticalFunction returned %d\n"
	.size	.L.str.8, 34


	.ident	"clang version 4.0.0 (tags/RELEASE_400/final)"
	.section	".note.GNU-stack","",@progbits
