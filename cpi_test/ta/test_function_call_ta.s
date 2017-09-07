	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.eabi_attribute	6, 6	@ Tag_CPU_arch
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.eabi_attribute	68, 1	@ Tag_Virtualization_use
	.file	"test_function_call_ta.bc"
	.globl	TA_CreateEntryPoint
	.p2align	2
	.type	TA_CreateEntryPoint,%function
	.code	32                      @ @TA_CreateEntryPoint
TA_CreateEntryPoint:
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#8
	sub	sp, sp, #8
	ldr	r0, .LCPI0_0
	mov	r1, #14
	mov	r2, #3
	str	r0, [sp]
	adr	r0, .LCPI0_1
	mov	r3, #1
	bl	trace_printf
	mov	r0, #0
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI0_0:
	.long	.L.str
.LCPI0_1:
.L__func__.TA_CreateEntryPoint:
	.asciz	"TA_CreateEntryPoint"
.Lfunc_end0:
	.size	TA_CreateEntryPoint, .Lfunc_end0-TA_CreateEntryPoint
	.cantunwind
	.fnend

	.globl	TA_DestroyEntryPoint
	.p2align	2
	.type	TA_DestroyEntryPoint,%function
	.code	32                      @ @TA_DestroyEntryPoint
TA_DestroyEntryPoint:
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#8
	sub	sp, sp, #8
	ldr	r0, .LCPI1_0
	mov	r1, #24
	mov	r2, #3
	str	r0, [sp]
	adr	r0, .LCPI1_1
	mov	r3, #1
	bl	trace_printf
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI1_0:
	.long	.L.str
.LCPI1_1:
.L__func__.TA_DestroyEntryPoint:
	.asciz	"TA_DestroyEntryPoint\000\000\000"
.Lfunc_end1:
	.size	TA_DestroyEntryPoint, .Lfunc_end1-TA_DestroyEntryPoint
	.cantunwind
	.fnend

	.globl	TA_OpenSessionEntryPoint
	.p2align	2
	.type	TA_OpenSessionEntryPoint,%function
	.code	32                      @ @TA_OpenSessionEntryPoint
TA_OpenSessionEntryPoint:
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.pad	#24
	sub	sp, sp, #24
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	mov	r4, #0
	str	r1, [sp, #12]
	cmp	r0, #0
	str	r2, [sp, #8]
	str	r4, [sp, #4]
	beq	.LBB2_2
@ BB#1:
	ldr	r0, .LCPI2_2
	str	r0, [r11, #-12]
	b	.LBB2_3
.LBB2_2:
	adr	r0, .LCPI2_0
	str	r0, [sp]
	adr	r0, .LCPI2_1
	mov	r1, #52
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	str	r4, [r11, #-12]
.LBB2_3:
	ldr	r0, [r11, #-12]
	sub	sp, r11, #8
	pop	{r4, r10, r11, pc}
	.p2align	2
@ BB#4:
.LCPI2_0:
.L.str.1:
	.asciz	"Hello World!\n\000\000"
.LCPI2_1:
.L__func__.TA_OpenSessionEntryPoint:
	.asciz	"TA_OpenSessionEntryPoint\000\000\000"
.LCPI2_2:
	.long	4294901766              @ 0xffff0006
.Lfunc_end2:
	.size	TA_OpenSessionEntryPoint, .Lfunc_end2-TA_OpenSessionEntryPoint
	.cantunwind
	.fnend

	.globl	TA_CloseSessionEntryPoint
	.p2align	2
	.type	TA_CloseSessionEntryPoint,%function
	.code	32                      @ @TA_CloseSessionEntryPoint
TA_CloseSessionEntryPoint:
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#8
	sub	sp, sp, #8
	str	r0, [sp, #4]
	adr	r0, .LCPI3_0
	str	r0, [sp]
	adr	r0, .LCPI3_1
	mov	r1, #65
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI3_0:
.L.str.2:
	.asciz	"Goodbye!\n\000\000"
.LCPI3_1:
.L__func__.TA_CloseSessionEntryPoint:
	.asciz	"TA_CloseSessionEntryPoint\000\000"
.Lfunc_end3:
	.size	TA_CloseSessionEntryPoint, .Lfunc_end3-TA_CloseSessionEntryPoint
	.cantunwind
	.fnend

	.globl	TA_InvokeCommandEntryPoint
	.p2align	2
	.type	TA_InvokeCommandEntryPoint,%function
	.code	32                      @ @TA_InvokeCommandEntryPoint
TA_InvokeCommandEntryPoint:
	.fnstart
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#24
	sub	sp, sp, #24
	str	r1, [sp, #12]
	str	r0, [r11, #-8]
	ldr	r0, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	cmp	r0, #0
	beq	.LBB4_2
@ BB#1:
	ldr	r0, .LCPI4_0
	b	.LBB4_3
.LBB4_2:
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #8]
	bl	inc_value
.LBB4_3:
	str	r0, [r11, #-4]
	ldr	r0, [r11, #-4]
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#4:
.LCPI4_0:
	.long	4294901766              @ 0xffff0006
.Lfunc_end4:
	.size	TA_InvokeCommandEntryPoint, .Lfunc_end4-TA_InvokeCommandEntryPoint
	.cantunwind
	.fnend

	.p2align	2
	.type	inc_value,%function
	.code	32                      @ @inc_value
inc_value:
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.pad	#24
	sub	sp, sp, #24
	ldr	r2, .LCPI5_0
	str	r0, [sp, #16]
	mov	r0, #3
	str	r1, [sp, #12]
	str	r2, [sp]
	str	r0, [sp, #8]
	adr	r0, .LCPI5_1
	mov	r1, #76
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #16]
	cmp	r1, r0
	beq	.LBB5_2
@ BB#1:
	ldr	r0, .LCPI5_4
	b	.LBB5_3
.LBB5_2:
	ldr	r0, [sp, #12]
	mov	r1, #80
	mov	r2, #3
	mov	r3, #1
	ldr	r0, [r0]
	str	r0, [sp, #4]
	adr	r0, .LCPI5_2
	str	r0, [sp]
	adr	r4, .LCPI5_1
	mov	r0, r4
	bl	trace_printf
	ldr	r0, [sp, #12]
	mov	r2, #3
	mov	r3, #1
	ldr	r1, [r0]
	add	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [sp, #12]
	mov	r1, #82
	ldr	r0, [r0]
	str	r0, [sp, #4]
	adr	r0, .LCPI5_3
	str	r0, [sp]
	mov	r0, r4
	bl	trace_printf
	mov	r0, #0
.LBB5_3:
	str	r0, [r11, #-12]
	ldr	r0, [r11, #-12]
	sub	sp, r11, #8
	pop	{r4, r10, r11, pc}
	.p2align	2
@ BB#4:
.LCPI5_0:
	.long	.L.str
.LCPI5_1:
.L__func__.inc_value:
	.asciz	"inc_value\000\000"
.LCPI5_2:
.L.str.3:
	.asciz	"Got value: %u from NW\000\000"
.LCPI5_3:
.L.str.4:
	.asciz	"Increase value to: %u\000\000"
.LCPI5_4:
	.long	4294901766              @ 0xffff0006
.Lfunc_end5:
	.size	inc_value, .Lfunc_end5-inc_value
	.cantunwind
	.fnend

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"has been called"
	.size	.L.str, 16


	.ident	"clang version 3.9.1-4ubuntu3~14.04.2 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
