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
	.file	"ta.bc"
	.globl	Java_TestTustedJNI_myNativeFunction
	.p2align	2
	.type	Java_TestTustedJNI_myNativeFunction,%function
	.code	32                      @ @Java_TestTustedJNI_myNativeFunction
Java_TestTustedJNI_myNativeFunction:
	.fnstart
@ BB#0:                                 @ %entry
	.pad	#12
	sub	sp, sp, #12
	str	r0, [sp, #8]
	mov	r0, #0
	str	r2, [sp]
	str	r1, [sp, #4]
	str	r0, [sp, #8]
	str	r0, [sp, #4]
	ldr	r0, [sp]
	add	r0, r0, #1
	add	sp, sp, #12
	bx	lr
.Lfunc_end0:
	.size	Java_TestTustedJNI_myNativeFunction, .Lfunc_end0-Java_TestTustedJNI_myNativeFunction
	.cantunwind
	.fnend

	.globl	TA_CreateEntryPoint
	.p2align	2
	.type	TA_CreateEntryPoint,%function
	.code	32                      @ @TA_CreateEntryPoint
TA_CreateEntryPoint:
	.fnstart
@ BB#0:                                 @ %entry
	mov	r0, #0
	bx	lr
.Lfunc_end1:
	.size	TA_CreateEntryPoint, .Lfunc_end1-TA_CreateEntryPoint
	.cantunwind
	.fnend

	.globl	TA_DestroyEntryPoint
	.p2align	2
	.type	TA_DestroyEntryPoint,%function
	.code	32                      @ @TA_DestroyEntryPoint
TA_DestroyEntryPoint:
	.fnstart
@ BB#0:                                 @ %entry
	bx	lr
.Lfunc_end2:
	.size	TA_DestroyEntryPoint, .Lfunc_end2-TA_DestroyEntryPoint
	.cantunwind
	.fnend

	.globl	TA_OpenSessionEntryPoint
	.p2align	2
	.type	TA_OpenSessionEntryPoint,%function
	.code	32                      @ @TA_OpenSessionEntryPoint
TA_OpenSessionEntryPoint:
	.fnstart
@ BB#0:                                 @ %entry
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
	beq	.LBB3_2
@ BB#1:                                 @ %if.then
	ldr	r0, .LCPI3_2
	str	r0, [r11, #-12]
	b	.LBB3_3
.LBB3_2:                                @ %if.end
	adr	r0, .LCPI3_0
	str	r0, [sp]
	adr	r0, .LCPI3_1
	mov	r1, #18
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	str	r4, [r11, #-12]
.LBB3_3:                                @ %return
	ldr	r0, [r11, #-12]
	sub	sp, r11, #8
	pop	{r4, r10, r11, pc}
	.p2align	2
@ BB#4:
.LCPI3_0:
.L.str:
	.asciz	"Hello World!\n\000\000"
.LCPI3_1:
.L__func__.TA_OpenSessionEntryPoint:
	.asciz	"TA_OpenSessionEntryPoint\000\000\000"
.LCPI3_2:
	.long	4294901766              @ 0xffff0006
.Lfunc_end3:
	.size	TA_OpenSessionEntryPoint, .Lfunc_end3-TA_OpenSessionEntryPoint
	.cantunwind
	.fnend

	.globl	TA_CloseSessionEntryPoint
	.p2align	2
	.type	TA_CloseSessionEntryPoint,%function
	.code	32                      @ @TA_CloseSessionEntryPoint
TA_CloseSessionEntryPoint:
	.fnstart
@ BB#0:                                 @ %entry
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#8
	sub	sp, sp, #8
	str	r0, [sp, #4]
	adr	r0, .LCPI4_0
	str	r0, [sp]
	adr	r0, .LCPI4_1
	mov	r1, #24
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#1:
.LCPI4_0:
.L.str.1:
	.asciz	"Goodbye!\n\000\000"
.LCPI4_1:
.L__func__.TA_CloseSessionEntryPoint:
	.asciz	"TA_CloseSessionEntryPoint\000\000"
.Lfunc_end4:
	.size	TA_CloseSessionEntryPoint, .Lfunc_end4-TA_CloseSessionEntryPoint
	.cantunwind
	.fnend

	.globl	TA_InvokeCommandEntryPoint
	.p2align	2
	.type	TA_InvokeCommandEntryPoint,%function
	.code	32                      @ @TA_InvokeCommandEntryPoint
TA_InvokeCommandEntryPoint:
	.fnstart
@ BB#0:                                 @ %entry
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
	beq	.LBB5_2
@ BB#1:                                 @ %sw.default
	ldr	r0, .LCPI5_0
	b	.LBB5_3
.LBB5_2:                                @ %sw.bb
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #8]
	bl	Java_TestTustedJNI_myNativeFunction_WRAPPER
.LBB5_3:                                @ %return
	str	r0, [r11, #-4]
	ldr	r0, [r11, #-4]
	mov	sp, r11
	pop	{r11, pc}
	.p2align	2
@ BB#4:
.LCPI5_0:
	.long	4294901766              @ 0xffff0006
.Lfunc_end5:
	.size	TA_InvokeCommandEntryPoint, .Lfunc_end5-TA_InvokeCommandEntryPoint
	.cantunwind
	.fnend

	.p2align	2
	.type	Java_TestTustedJNI_myNativeFunction_WRAPPER,%function
	.code	32                      @ @Java_TestTustedJNI_myNativeFunction_WRAPPER
Java_TestTustedJNI_myNativeFunction_WRAPPER:
	.fnstart
@ BB#0:                                 @ %entry
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
	.setfp	r11, sp, #16
	add	r11, sp, #16
	.pad	#40
	sub	sp, sp, #40
	str	r0, [r11, #-24]
	str	r1, [sp, #28]
	ldr	r1, [r11, #-24]
	mov	r0, #115
	orr	r0, r0, #28672
	cmp	r1, r0
	str	r0, [sp, #24]
	beq	.LBB6_2
@ BB#1:                                 @ %if.then
	ldr	r0, .LCPI6_2
	str	r0, [r11, #-20]
	b	.LBB6_3
.LBB6_2:                                @ %if.end
	ldr	r0, [sp, #28]
	add	r5, sp, #16
	add	r4, sp, #20
	mov	r1, r5
	ldr	r0, [r0, #8]
	mov	r2, #4
	mov	r6, #4
	str	r0, [sp, #16]
	mov	r0, r4
	bl	read_basic
	adr	r0, .LCPI6_0
	str	r0, [sp]
	adr	r0, .LCPI6_1
	mov	r1, #36
	mov	r2, #3
	mov	r3, #1
	bl	trace_printf
	ldr	r2, [sp, #20]
	mov	r0, #0
	mov	r1, #0
	mov	r7, #0
	bl	Java_TestTustedJNI_myNativeFunction
	str	r0, [sp, #12]
	ldr	r0, [sp, #28]
	add	r1, sp, #12
	mov	r2, #4
	ldr	r0, [r0, #24]
	str	r6, [sp, #4]
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	bl	memcpy
	ldr	r0, [sp, #28]
	mov	r1, r4
	mov	r2, #4
	ldr	r0, [r0, #8]
	str	r0, [sp, #16]
	mov	r0, r5
	bl	write_basic
	str	r7, [r11, #-20]
.LBB6_3:                                @ %return
	ldr	r0, [r11, #-20]
	sub	sp, r11, #16
	pop	{r4, r5, r6, r7, r11, pc}
	.p2align	2
@ BB#4:
.LCPI6_0:
.L.str.2:
	.asciz	"call client function!!!"
.LCPI6_1:
.L__func__.Java_TestTustedJNI_myNativeFunction_WRAPPER:
	.asciz	"Java_TestTustedJNI_myNativeFunction_WRAPPER"
.LCPI6_2:
	.long	4294901766              @ 0xffff0006
.Lfunc_end6:
	.size	Java_TestTustedJNI_myNativeFunction_WRAPPER, .Lfunc_end6-Java_TestTustedJNI_myNativeFunction_WRAPPER
	.cantunwind
	.fnend

	.p2align	2
	.type	read_basic,%function
	.code	32                      @ @read_basic
read_basic:
	.fnstart
@ BB#0:                                 @ %entry
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#16
	sub	sp, sp, #16
	str	r1, [sp, #8]
	ldr	r1, [sp, #8]
	str	r0, [r11, #-4]
	str	r2, [sp, #4]
	ldr	r0, [r11, #-4]
	ldr	r1, [r1]
	bl	memcpy
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #4]
	ldr	r2, [r0]
	add	r1, r2, r1, lsl #2
	str	r1, [r0]
	mov	sp, r11
	pop	{r11, pc}
.Lfunc_end7:
	.size	read_basic, .Lfunc_end7-read_basic
	.cantunwind
	.fnend

	.p2align	2
	.type	write_basic,%function
	.code	32                      @ @write_basic
write_basic:
	.fnstart
@ BB#0:                                 @ %entry
	.save	{r11, lr}
	push	{r11, lr}
	.setfp	r11, sp
	mov	r11, sp
	.pad	#16
	sub	sp, sp, #16
	str	r0, [r11, #-4]
	ldr	r0, [r11, #-4]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	r1, [sp, #8]
	ldr	r0, [r0]
	bl	memcpy
	ldr	r0, [r11, #-4]
	ldr	r1, [sp, #4]
	ldr	r2, [r0]
	add	r1, r2, r1, lsl #2
	str	r1, [r0]
	mov	sp, r11
	pop	{r11, pc}
.Lfunc_end8:
	.size	write_basic, .Lfunc_end8-write_basic
	.cantunwind
	.fnend


	.ident	"clang version 4.0.0 (tags/RELEASE_400/final)"
	.ident	"clang version 4.0.0 (tags/RELEASE_400/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
