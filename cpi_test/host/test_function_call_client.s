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
	.file	"test_function_call_client.bc"
	.globl	main
	.p2align	2
	.type	main,%function
	.code	32                      @ @main
main:
	.fnstart
@ BB#0:
	.save	{r4, r10, r11, lr}
	push	{r4, r10, r11, lr}
	.setfp	r11, sp, #8
	add	r11, sp, #8
	.pad	#120
	sub	sp, sp, #120
	ldr	r2, .LCPI0_0
	mov	r4, #0
	str	r4, [r11, #-12]
	str	r0, [r11, #-16]
	str	r1, [r11, #-20]
	ldm	r2, {r0, r1, r3}
	ldr	r2, [r2, #12]
	str	r2, [sp, #28]
	add	r2, sp, #16
	stm	r2, {r0, r1, r3}
	sub	r1, r11, #28
	mov	r0, #0
	bl	TEEC_InitializeContext
	cmp	r0, #0
	str	r0, [r11, #-24]
	bne	.LBB0_4
@ BB#1:
	add	r0, sp, #12
	str	r4, [sp]
	str	r4, [sp, #4]
	str	r0, [sp, #8]
	sub	r0, r11, #28
	sub	r1, r11, #36
	add	r2, sp, #16
	mov	r3, #0
	bl	TEEC_OpenSession
	cmp	r0, #0
	str	r0, [r11, #-24]
	bne	.LBB0_5
@ BB#2:
	add	r4, sp, #32
	mov	r0, r4
	mov	r1, #0
	mov	r2, #60
	bl	memset
	mov	r1, #231
	mov	r0, #3
	orr	r1, r1, #768
	str	r0, [sp, #36]
	str	r1, [sp, #40]
	adr	r0, .LCPI0_1
	bl	printf
	sub	r0, r11, #36
	add	r3, sp, #12
	mov	r1, #0
	mov	r2, r4
	bl	TEEC_InvokeCommand
	cmp	r0, #0
	str	r0, [r11, #-24]
	bne	.LBB0_6
@ BB#3:
	ldr	r1, [sp, #40]
	adr	r0, .LCPI0_2
	bl	printf
	sub	r0, r11, #36
	bl	TEEC_CloseSession
	sub	r0, r11, #28
	bl	TEEC_FinalizeContext
	mov	r0, #0
	sub	sp, r11, #8
	pop	{r4, r10, r11, pc}
.LBB0_4:
	ldr	r2, [r11, #-24]
	ldr	r1, .LCPI0_5
	mov	r0, #1
	bl	errx
.LBB0_5:
	ldr	r3, [sp, #12]
	ldr	r2, [r11, #-24]
	ldr	r1, .LCPI0_4
	mov	r0, #1
	bl	errx
.LBB0_6:
	ldr	r3, [sp, #12]
	ldr	r2, [r11, #-24]
	adr	r1, .LCPI0_3
	mov	r0, #1
	bl	errx
	.p2align	2
@ BB#7:
.LCPI0_0:
	.long	.Lmain.uuid
.LCPI0_1:
.L.str.2:
	.asciz	"Invoking TA to increment %d\n\000\000\000"
.LCPI0_2:
.L.str.4:
	.asciz	"TA incremented value to %d\n"
.LCPI0_3:
.L.str.3:
	.asciz	"TEEC_InvokeCommand failed with code 0x%x origin 0x%x\000\000\000"
.LCPI0_4:
	.long	.L.str.1
.LCPI0_5:
	.long	.L.str
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cantunwind
	.fnend

	.type	.Lmain.uuid,%object     @ @main.uuid
	.section	.rodata.cst16,"aM",%progbits,16
	.p2align	3
.Lmain.uuid:
	.long	138610280               @ 0x8430668
	.short	13411                   @ 0x3463
	.short	19587                   @ 0x4c83
	.ascii	"\225\223\241\203P\365KW"
	.size	.Lmain.uuid, 16

	.type	.L.str,%object          @ @.str
	.section	.rodata.str1.1,"aMS",%progbits,1
.L.str:
	.asciz	"TEEC_InitializeContext failed with code 0x%x"
	.size	.L.str, 45

	.type	.L.str.1,%object        @ @.str.1
.L.str.1:
	.asciz	"TEEC_Opensession failed with code 0x%x origin 0x%x"
	.size	.L.str.1, 51


	.ident	"clang version 3.9.1-4ubuntu3~14.04.2 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 1	@ Tag_ABI_optimization_goals
