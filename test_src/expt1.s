	.file	"expt1.cpp"
	.text
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$5, -4(%rbp)
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	cmpl	$5, -8(%rbp)
	jne	.LBB0_6
# %bb.5:
	jmp	.LBB0_7
.LBB0_6:
	movabsq	$.L.str, %rdi
	movabsq	$.L.str.1, %rsi
	movabsq	$.L__PRETTY_FUNCTION__.main, %rcx
	movl	$12, %edx
	callq	__assert_fail@PLT
.LBB0_7:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"sum == 5"
	.size	.L.str, 9

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"expt1.cpp"
	.size	.L.str.1, 10

	.type	.L__PRETTY_FUNCTION__.main,@object # @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main()"
	.size	.L__PRETTY_FUNCTION__.main, 11

	.ident	"clang version 20.1.8"
	.section	".note.GNU-stack","",@progbits
