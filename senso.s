	.file	"senso.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	state
	.section	.sbss,"aw",@nobits
	.align	2
	.type	state, @object
	.size	state, 4
state:
	.zero	4
	.globl	n
	.section	.sdata,"aw"
	.align	2
	.type	n, @object
	.size	n, 4
n:
	.word	3
	.globl	t
	.align	2
	.type	t, @object
	.size	t, 4
t:
	.word	1000
	.globl	level
	.align	2
	.type	level, @object
	.size	level, 4
level:
	.word	1
	.comm	targets,40,4
	.globl	i
	.section	.sbss
	.align	2
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	success
	.type	success, @object
	.size	success, 1
success:
	.zero	1
	.globl	failure
	.type	failure, @object
	.size	failure, 1
failure:
	.zero	1
	.text
	.align	1
	.globl	senso
	.type	senso, @function
senso:
.LFB3:
	.file 1 "src/senso.c"
	.loc 1 12 27
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 1 13 5
	lui	a5,%hi(state)
	lw	a5,%lo(state)(a5)
	li	a4,9
	bgtu	a5,a4,.L47
	slli	a4,a5,2
	lui	a5,%hi(.L4)
	addi	a5,a5,%lo(.L4)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L4:
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
	.text
.L13:
	.loc 1 15 16
	lw	a5,-20(s0)
	bne	a5,zero,.L14
	.loc 1 16 17
	call	toggle_all_led
	.loc 1 17 17
	li	a0,500
	call	ms_sleep
	.loc 1 18 23
	lui	a5,%hi(state)
	li	a4,1
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L14:
	.loc 1 19 23
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L16
	.loc 1 20 17
	li	a0,0
	call	toggle_led
	.loc 1 21 17
	li	a0,500
	call	ms_sleep
	.loc 1 22 23
	lui	a5,%hi(state)
	li	a4,7
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L16:
	.loc 1 23 23
	lw	a4,-20(s0)
	li	a5,2
	bne	a4,a5,.L17
	.loc 1 24 17
	li	a0,3
	call	toggle_led
	.loc 1 25 17
	li	a0,500
	call	ms_sleep
	.loc 1 26 23
	lui	a5,%hi(state)
	li	a4,9
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L17:
	.loc 1 27 23
	lw	a4,-20(s0)
	li	a5,3
	bne	a4,a5,.L18
	.loc 1 28 17
	li	a0,2
	call	toggle_led
	.loc 1 29 17
	li	a0,500
	call	ms_sleep
	.loc 1 30 23
	lui	a5,%hi(state)
	li	a4,8
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L18:
	.loc 1 31 23
	lw	a4,-20(s0)
	li	a5,4
	bne	a4,a5,.L19
	.loc 1 32 17
	li	a0,1
	call	toggle_led
	.loc 1 33 17
	li	a0,500
	call	ms_sleep
	.loc 1 34 23
	lui	a5,%hi(state)
	li	a4,6
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L19:
	.loc 1 35 23
	lw	a4,-20(s0)
	li	a5,5
	bne	a4,a5,.L20
	.loc 1 36 17
	call	toggle_all_led
	.loc 1 37 17
	li	a0,500
	call	ms_sleep
	.loc 1 38 23
	lui	a5,%hi(state)
	li	a4,1
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L20:
	.loc 1 39 23
	lw	a4,-20(s0)
	li	a5,6
	bne	a4,a5,.L21
	.loc 1 40 25
	call	add_target_led
	mv	a4,a0
	.loc 1 40 23
	lui	a5,%hi(state)
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L21:
	.loc 1 41 23
	lw	a4,-20(s0)
	li	a5,7
	bne	a4,a5,.L22
	.loc 1 42 21
	call	match_next_button
	mv	a5,a0
	.loc 1 42 20
	beq	a5,zero,.L23
	.loc 1 43 21
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a0,a5
	call	toggle_led
	.loc 1 44 21
	li	a0,500
	call	ms_sleep
	.loc 1 45 21
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a0,a5
	call	toggle_led
	j	.L24
.L23:
	.loc 1 47 29
	lui	a5,%hi(failure)
	li	a4,1
	sb	a4,%lo(failure)(a5)
.L24:
	.loc 1 49 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L22:
	.loc 1 51 23
	lw	a4,-20(s0)
	li	a5,8
	bne	a4,a5,.L25
	.loc 1 52 17
	li	a0,1
	call	toggle_led
	.loc 1 53 17
	li	a0,3
	call	toggle_led
	.loc 1 54 17
	li	a0,500
	call	ms_sleep
	.loc 1 55 23
	lui	a5,%hi(state)
	li	a4,4
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L25:
	.loc 1 56 23
	lw	a4,-20(s0)
	li	a5,10
	bne	a4,a5,.L26
	.loc 1 57 17
	li	a0,0
	call	toggle_led
	.loc 1 58 17
	li	a0,500
	call	ms_sleep
	.loc 1 59 23
	lui	a5,%hi(state)
	li	a4,7
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L26:
	.loc 1 60 23
	lw	a4,-20(s0)
	li	a5,11
	bne	a4,a5,.L27
	.loc 1 61 17
	call	toggle_all_led
	.loc 1 62 17
	li	a0,500
	call	ms_sleep
	.loc 1 63 23
	lui	a5,%hi(state)
	li	a4,1
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L27:
	.loc 1 64 23
	lw	a4,-20(s0)
	li	a5,12
	bne	a4,a5,.L48
	.loc 1 65 17
	call	toggle_all_led
	.loc 1 66 17
	li	a0,1000
	call	ms_sleep
	.loc 1 67 23
	lui	a5,%hi(state)
	li	a4,1
	sw	a4,%lo(state)(a5)
	.loc 1 69 13
	j	.L48
.L12:
	.loc 1 71 16
	lw	a5,-20(s0)
	bne	a5,zero,.L29
	.loc 1 72 17
	call	toggle_all_led
	.loc 1 73 17
	li	a0,500
	call	ms_sleep
	.loc 1 74 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 87 13
	j	.L49
.L29:
	.loc 1 75 23
	lw	a4,-20(s0)
	li	a5,5
	bne	a4,a5,.L31
	.loc 1 76 17
	li	a0,0
	call	toggle_led
	.loc 1 77 17
	li	a0,500
	call	ms_sleep
	.loc 1 78 23
	lui	a5,%hi(state)
	li	a4,2
	sw	a4,%lo(state)(a5)
	.loc 1 87 13
	j	.L49
.L31:
	.loc 1 79 23
	lw	a4,-20(s0)
	li	a5,7
	bne	a4,a5,.L32
	.loc 1 80 17
	call	toggle_all_led
	.loc 1 81 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 87 13
	j	.L49
.L32:
	.loc 1 82 23
	lw	a4,-20(s0)
	li	a5,11
	bne	a4,a5,.L49
	.loc 1 83 17
	call	toggle_all_led
	.loc 1 84 17
	li	a0,1000
	call	ms_sleep
	.loc 1 85 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 87 13
	j	.L49
.L11:
	.loc 1 89 16
	lw	a4,-20(s0)
	li	a5,5
	bne	a4,a5,.L50
	.loc 1 90 17
	li	a0,3
	call	toggle_led
	.loc 1 91 17
	li	a0,500
	call	ms_sleep
	.loc 1 92 23
	lui	a5,%hi(state)
	li	a4,3
	sw	a4,%lo(state)(a5)
	.loc 1 94 13
	j	.L50
.L10:
	.loc 1 96 16
	lw	a4,-20(s0)
	li	a5,5
	bne	a4,a5,.L51
	.loc 1 97 17
	li	a0,2
	call	toggle_led
	.loc 1 98 17
	li	a0,500
	call	ms_sleep
	.loc 1 99 23
	lui	a5,%hi(state)
	li	a4,6
	sw	a4,%lo(state)(a5)
	.loc 1 101 13
	j	.L51
.L9:
	.loc 1 103 16
	lw	a4,-20(s0)
	li	a5,8
	bne	a4,a5,.L52
	.loc 1 104 17
	call	toggle_all_led
	.loc 1 105 17
	li	a0,500
	call	ms_sleep
	.loc 1 106 23
	lui	a5,%hi(state)
	li	a4,5
	sw	a4,%lo(state)(a5)
	.loc 1 108 13
	j	.L52
.L8:
	.loc 1 110 16
	lw	a4,-20(s0)
	li	a5,8
	bne	a4,a5,.L36
	.loc 1 111 17
	call	toggle_all_led
	.loc 1 112 17
	li	a0,500
	call	ms_sleep
	.loc 1 113 23
	lui	a5,%hi(state)
	li	a4,4
	sw	a4,%lo(state)(a5)
	j	.L6
.L36:
	.loc 1 114 23
	lw	a4,-20(s0)
	li	a5,9
	bne	a4,a5,.L6
	.loc 1 115 17
	li	a0,0
	call	toggle_led
	.loc 1 116 17
	li	a0,2
	call	toggle_led
	.loc 1 117 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
.L6:
	.loc 1 120 16
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L37
	.loc 1 121 17
	li	a0,0
	call	toggle_led
	.loc 1 122 17
	li	a0,500
	call	ms_sleep
	.loc 1 123 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 133 13
	j	.L53
.L37:
	.loc 1 124 23
	lw	a4,-20(s0)
	li	a5,6
	bne	a4,a5,.L39
	.loc 1 125 17
	li	a0,0
	call	toggle_led
	.loc 1 126 17
	li	a0,500
	call	ms_sleep
	.loc 1 127 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 133 13
	j	.L53
.L39:
	.loc 1 128 23
	lw	a4,-20(s0)
	li	a5,10
	bne	a4,a5,.L53
	.loc 1 129 17
	li	a0,0
	call	toggle_led
	.loc 1 130 17
	li	a0,500
	call	ms_sleep
	.loc 1 131 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 133 13
	j	.L53
.L7:
	.loc 1 135 16
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L40
	.loc 1 136 17
	li	a0,1
	call	toggle_led
	.loc 1 137 17
	li	a0,500
	call	ms_sleep
	.loc 1 138 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 148 13
	j	.L54
.L40:
	.loc 1 139 23
	lw	a4,-20(s0)
	li	a5,5
	bne	a4,a5,.L42
	.loc 1 140 17
	li	a0,1
	call	toggle_led
	.loc 1 141 17
	li	a0,500
	call	ms_sleep
	.loc 1 142 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 148 13
	j	.L54
.L42:
	.loc 1 143 23
	lw	a4,-20(s0)
	li	a5,6
	bne	a4,a5,.L54
	.loc 1 144 17
	li	a0,1
	call	toggle_led
	.loc 1 145 17
	li	a0,500
	call	ms_sleep
	.loc 1 146 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 148 13
	j	.L54
.L5:
	.loc 1 150 16
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L43
	.loc 1 151 17
	li	a0,2
	call	toggle_led
	.loc 1 152 17
	li	a0,500
	call	ms_sleep
	.loc 1 153 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 159 13
	j	.L55
.L43:
	.loc 1 154 23
	lw	a4,-20(s0)
	li	a5,6
	bne	a4,a5,.L55
	.loc 1 155 17
	li	a0,2
	call	toggle_led
	.loc 1 156 17
	li	a0,500
	call	ms_sleep
	.loc 1 157 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 159 13
	j	.L55
.L3:
	.loc 1 161 16
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L45
	.loc 1 162 17
	li	a0,3
	call	toggle_led
	.loc 1 163 17
	li	a0,500
	call	ms_sleep
	.loc 1 164 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 170 13
	j	.L56
.L45:
	.loc 1 165 23
	lw	a4,-20(s0)
	li	a5,6
	bne	a4,a5,.L56
	.loc 1 166 17
	li	a0,3
	call	toggle_led
	.loc 1 167 17
	li	a0,500
	call	ms_sleep
	.loc 1 168 23
	lui	a5,%hi(state)
	sw	zero,%lo(state)(a5)
	.loc 1 170 13
	j	.L56
.L47:
	.loc 1 173 13
	nop
	j	.L28
.L48:
	.loc 1 69 13
	nop
	j	.L28
.L49:
	.loc 1 87 13
	nop
	j	.L28
.L50:
	.loc 1 94 13
	nop
	j	.L28
.L51:
	.loc 1 101 13
	nop
	j	.L28
.L52:
	.loc 1 108 13
	nop
	j	.L28
.L53:
	.loc 1 133 13
	nop
	j	.L28
.L54:
	.loc 1 148 13
	nop
	j	.L28
.L55:
	.loc 1 159 13
	nop
	j	.L28
.L56:
	.loc 1 170 13
	nop
.L28:
	.loc 1 176 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	senso, .-senso
	.align	1
	.globl	add_target_led
	.type	add_target_led, @function
add_target_led:
.LFB4:
	.loc 1 178 30
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 179 12
	lui	a5,%hi(i)
	lw	s1,%lo(i)(a5)
	.loc 1 179 18
	call	get_random_led
	mv	a3,a0
	.loc 1 179 16
	lui	a5,%hi(targets)
	addi	a4,a5,%lo(targets)
	slli	a5,s1,2
	add	a5,a4,a5
	sw	a3,0(a5)
	.loc 1 180 5
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a0,a5
	call	toggle_led
	.loc 1 181 5
	lui	a5,%hi(t)
	lw	a5,%lo(t)(a5)
	mv	a0,a5
	call	ms_sleep
	.loc 1 183 16
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 1 183 8
	bne	a5,zero,.L58
	.loc 1 184 16
	li	a5,7
	j	.L59
.L58:
	.loc 1 186 16
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 186 8
	li	a5,1
	bne	a4,a5,.L60
	.loc 1 187 16
	li	a5,6
	j	.L59
.L60:
	.loc 1 189 16
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 189 8
	li	a5,2
	bne	a4,a5,.L61
	.loc 1 190 16
	li	a5,8
	j	.L59
.L61:
	.loc 1 192 12
	li	a5,9
.L59:
	.loc 1 193 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	add_target_led, .-add_target_led
	.align	1
	.globl	match_next_button
	.type	match_next_button, @function
match_next_button:
.LFB5:
	.loc 1 195 29
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 196 19
	lui	a5,%hi(t)
	lw	a5,%lo(t)(a5)
	mv	a0,a5
	call	duration_in_clocks
	mv	s1,a0
	.loc 1 196 43
	call	clock
	mv	a5,a0
	.loc 1 196 13
	add	a5,s1,a5
	sw	a5,-28(s0)
	.loc 1 197 11
	j	.L63
.L71:
.LBB2:
	.loc 1 198 13
	sb	zero,-17(s0)
	.loc 1 199 13
	sw	zero,-32(s0)
	.loc 1 200 9
	addi	a5,s0,-32
	mv	a0,a5
	call	get_input
.LBB3:
	.loc 1 201 18
	sw	zero,-24(s0)
	.loc 1 201 9
	j	.L64
.L68:
	.loc 1 202 24
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-16(a5)
	.loc 1 202 16
	beq	a5,zero,.L65
	.loc 1 203 41
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	lui	a4,%hi(targets)
	addi	a4,a4,%lo(targets)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 1 203 31
	lw	a5,-24(s0)
	.loc 1 203 20
	bne	a4,a5,.L66
	.loc 1 204 34
	li	a5,1
	sb	a5,-17(s0)
	j	.L65
.L66:
	.loc 1 206 27
	li	a5,0
	j	.L70
.L65:
	.loc 1 201 33 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L64:
	.loc 1 201 9 discriminator 1
	lw	a4,-24(s0)
	li	a5,3
	ble	a4,a5,.L68
.LBE3:
	.loc 1 210 12
	lbu	a5,-17(s0)
	beq	a5,zero,.L63
	.loc 1 211 19
	li	a5,1
	j	.L70
.L63:
.LBE2:
	.loc 1 197 12
	call	clock
	mv	a4,a0
	.loc 1 197 11
	lw	a5,-28(s0)
	bgtu	a5,a4,.L71
	.loc 1 214 11
	li	a5,0
.L70:
	.loc 1 215 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	match_next_button, .-match_next_button
	.align	1
	.globl	raise_level
	.type	raise_level, @function
raise_level:
.LFB6:
	.loc 1 217 24
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 218 10
	lui	a5,%hi(level)
	lw	a5,%lo(level)(a5)
	addi	a4,a5,1
	lui	a5,%hi(level)
	sw	a4,%lo(level)(a5)
	.loc 1 219 15
	lui	a5,%hi(level)
	lw	a4,%lo(level)(a5)
	.loc 1 219 8
	li	a5,4
	ble	a4,a5,.L73
	.loc 1 219 30 discriminator 1
	lui	a5,%hi(level)
	lw	a4,%lo(level)(a5)
	.loc 1 219 20 discriminator 1
	li	a5,8
	ble	a4,a5,.L74
	.loc 1 219 44 discriminator 2
	lui	a5,%hi(level)
	lw	a4,%lo(level)(a5)
	.loc 1 219 35 discriminator 2
	li	a5,12
	bgt	a4,a5,.L74
.L73:
	.loc 1 220 10
	lui	a5,%hi(n)
	lw	a5,%lo(n)(a5)
	addi	a4,a5,1
	lui	a5,%hi(n)
	sw	a4,%lo(n)(a5)
	j	.L75
.L74:
	.loc 1 222 19
	lui	a5,%hi(t)
	lw	a4,%lo(t)(a5)
	li	a5,-10
	div	a4,a4,a5
	.loc 1 222 15
	lui	a5,%hi(t)
	lw	a5,%lo(t)(a5)
	add	a4,a4,a5
	.loc 1 222 11
	lui	a5,%hi(t)
	sw	a4,%lo(t)(a5)
.L75:
	.loc 1 224 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	raise_level, .-raise_level
	.align	1
	.globl	reset_game
	.type	reset_game, @function
reset_game:
.LFB7:
	.loc 1 226 23
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 227 7
	lui	a5,%hi(n)
	li	a4,3
	sw	a4,%lo(n)(a5)
	.loc 1 228 7
	lui	a5,%hi(t)
	li	a4,1000
	sw	a4,%lo(t)(a5)
	.loc 1 229 11
	lui	a5,%hi(level)
	li	a4,1
	sw	a4,%lo(level)(a5)
	.loc 1 230 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	reset_game, .-reset_game
	.align	1
	.globl	play_init_sequence
	.type	play_init_sequence, @function
play_init_sequence:
.LFB8:
	.loc 1 232 31
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 233 5
	li	a0,0
	call	senso
	.loc 1 234 5
	li	a0,0
	call	senso
	.loc 1 235 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	play_init_sequence, .-play_init_sequence
	.align	1
	.globl	play_standby_sequence
	.type	play_standby_sequence, @function
play_standby_sequence:
.LFB9:
	.loc 1 237 34
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 238 5
	li	a0,1
	call	senso
	.loc 1 239 5
	li	a0,1
	call	senso
	.loc 1 240 5
	li	a0,2
	call	senso
	.loc 1 241 5
	li	a0,1
	call	senso
	.loc 1 242 5
	li	a0,3
	call	senso
	.loc 1 243 5
	li	a0,1
	call	senso
	.loc 1 244 5
	li	a0,4
	call	senso
	.loc 1 245 5
	li	a0,1
	call	senso
	.loc 1 246 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	play_standby_sequence, .-play_standby_sequence
	.align	1
	.globl	play_demo_sequence
	.type	play_demo_sequence, @function
play_demo_sequence:
.LFB10:
	.loc 1 248 31
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 249 5
	li	a0,5
	call	senso
	.loc 1 250 5
	li	a0,5
	call	senso
	.loc 1 251 5
	li	a0,5
	call	senso
	.loc 1 252 5
	li	a0,5
	call	senso
	.loc 1 253 5
	li	a0,5
	call	senso
	.loc 1 254 12
	lui	a5,%hi(i)
	sw	zero,%lo(i)(a5)
	.loc 1 254 5
	j	.L80
.L81:
	.loc 1 255 9 discriminator 3
	li	a0,6
	call	senso
	.loc 1 256 9 discriminator 3
	li	a0,6
	call	senso
	.loc 1 254 25 discriminator 3
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	addi	a4,a5,1
	lui	a5,%hi(i)
	sw	a4,%lo(i)(a5)
.L80:
	.loc 1 254 19 discriminator 1
	lui	a5,%hi(i)
	lw	a4,%lo(i)(a5)
	lui	a5,%hi(n)
	lw	a5,%lo(n)(a5)
	.loc 1 254 5 discriminator 1
	blt	a4,a5,.L81
	.loc 1 258 5
	li	a0,0
	call	senso
	.loc 1 259 5
	li	a0,7
	call	senso
	.loc 1 260 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	play_demo_sequence, .-play_demo_sequence
	.align	1
	.globl	play_imitation_sequence
	.type	play_imitation_sequence, @function
play_imitation_sequence:
.LFB11:
	.loc 1 262 36
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 263 7
	lui	a5,%hi(i)
	sw	zero,%lo(i)(a5)
	.loc 1 264 11
	j	.L83
.L85:
	.loc 1 265 9
	li	a0,7
	call	senso
	.loc 1 266 10
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	addi	a4,a5,1
	lui	a5,%hi(i)
	sw	a4,%lo(i)(a5)
.L83:
	.loc 1 264 14
	lui	a5,%hi(i)
	lw	a4,%lo(i)(a5)
	lui	a5,%hi(n)
	lw	a5,%lo(n)(a5)
	.loc 1 264 11
	bge	a4,a5,.L86
	.loc 1 264 21 discriminator 1
	lui	a5,%hi(failure)
	lbu	a5,%lo(failure)(a5)
	xori	a5,a5,1
	andi	a5,a5,0xff
	.loc 1 264 18 discriminator 1
	bne	a5,zero,.L85
.L86:
	.loc 1 268 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	play_imitation_sequence, .-play_imitation_sequence
	.align	1
	.globl	play_break_sequence
	.type	play_break_sequence, @function
play_break_sequence:
.LFB12:
	.loc 1 270 32
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 271 12
	lui	a5,%hi(i)
	sw	zero,%lo(i)(a5)
	.loc 1 271 5
	j	.L88
.L89:
	.loc 1 272 9 discriminator 3
	li	a0,8
	call	senso
	.loc 1 271 26 discriminator 3
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	addi	a4,a5,1
	lui	a5,%hi(i)
	sw	a4,%lo(i)(a5)
.L88:
	.loc 1 271 19 discriminator 1
	lui	a5,%hi(i)
	lw	a4,%lo(i)(a5)
	.loc 1 271 5 discriminator 1
	li	a5,5
	ble	a4,a5,.L89
	.loc 1 274 5
	li	a0,9
	call	senso
	.loc 1 275 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	play_break_sequence, .-play_break_sequence
	.align	1
	.globl	play_lose_sequence
	.type	play_lose_sequence, @function
play_lose_sequence:
.LFB13:
	.loc 1 277 31
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 278 12
	lui	a5,%hi(i)
	sw	zero,%lo(i)(a5)
	.loc 1 278 5
	j	.L91
.L92:
	.loc 1 279 9 discriminator 3
	li	a0,10
	call	senso
	.loc 1 278 26 discriminator 3
	lui	a5,%hi(i)
	lw	a5,%lo(i)(a5)
	addi	a4,a5,1
	lui	a5,%hi(i)
	sw	a4,%lo(i)(a5)
.L91:
	.loc 1 278 19 discriminator 1
	lui	a5,%hi(i)
	lw	a4,%lo(i)(a5)
	.loc 1 278 5 discriminator 1
	li	a5,5
	ble	a4,a5,.L92
	.loc 1 281 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	play_lose_sequence, .-play_lose_sequence
	.align	1
	.globl	play_end_sequence
	.type	play_end_sequence, @function
play_end_sequence:
.LFB14:
	.loc 1 283 30
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB4:
	.loc 1 284 14
	sw	zero,-20(s0)
	.loc 1 284 5
	j	.L94
.L97:
	.loc 1 285 19
	lw	a5,-20(s0)
	andi	a5,a5,1
	.loc 1 285 12
	bne	a5,zero,.L95
	.loc 1 286 13
	li	a0,12
	call	senso
	j	.L96
.L95:
	.loc 1 288 13
	li	a0,11
	call	senso
.L96:
	.loc 1 290 9 discriminator 2
	li	a0,11
	call	senso
	.loc 1 284 29 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L94:
	.loc 1 284 5 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L97
.LBE4:
	.loc 1 292 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	play_end_sequence, .-play_end_sequence
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB15:
	.loc 1 294 16
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 295 5
	call	init_gpio
	.loc 1 296 5
	li	a0,1000
	call	ms_sleep
	.loc 1 297 5
	call	play_init_sequence
	.loc 1 298 5
	li	a0,1000
	call	ms_sleep
.L99:
	.loc 1 300 9 discriminator 1
	call	play_standby_sequence
	.loc 1 301 9 discriminator 1
	li	a0,1000
	call	ms_sleep
	.loc 1 300 9 discriminator 1
	j	.L99
	.cfi_endproc
.LFE15:
	.size	main, .-main
.Letext0:
	.file 2 "include/game_setup.h"
	.file 3 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/lib/gcc/riscv64-unknown-elf/8.3.0/include/stddef.h"
	.file 4 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/_types.h"
	.file 5 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/reent.h"
	.file 6 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/lock.h"
	.file 7 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/types.h"
	.file 8 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/time.h"
	.file 9 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/stdlib.h"
	.file 10 "include/senso.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc77
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF163
	.byte	0xc
	.4byte	.LASF164
	.4byte	.LASF165
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x4c
	.byte	0x2
	.byte	0x16
	.byte	0xe
	.4byte	0x4c
	.byte	0x3
	.string	"RED"
	.byte	0
	.byte	0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x4
	.4byte	.LASF2
	.byte	0x3
	.byte	0
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0x16
	.byte	0x29
	.4byte	0x25
	.byte	0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.byte	0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.byte	0x8
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x165
	.byte	0x16
	.4byte	0x4c
	.byte	0x6
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2e
	.byte	0xe
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF16
	.byte	0x4
	.byte	0x74
	.byte	0xe
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF17
	.byte	0x4
	.byte	0x93
	.byte	0x14
	.4byte	0x97
	.byte	0x9
	.byte	0x4
	.byte	0x4
	.byte	0xa5
	.byte	0x3
	.4byte	0xf8
	.byte	0xa
	.4byte	.LASF18
	.byte	0x4
	.byte	0xa7
	.byte	0xc
	.4byte	0xa5
	.byte	0xa
	.4byte	.LASF19
	.byte	0x4
	.byte	0xa8
	.byte	0x13
	.4byte	0xf8
	.byte	0
	.byte	0xb
	.4byte	0x66
	.4byte	0x108
	.byte	0xc
	.4byte	0x4c
	.byte	0x3
	.byte	0
	.byte	0xd
	.byte	0x8
	.byte	0x4
	.byte	0xa2
	.byte	0x9
	.4byte	0x12c
	.byte	0xe
	.4byte	.LASF20
	.byte	0x4
	.byte	0xa4
	.byte	0x7
	.4byte	0x97
	.byte	0
	.byte	0xe
	.4byte	.LASF21
	.byte	0x4
	.byte	0xa9
	.byte	0x5
	.4byte	0xd6
	.byte	0x4
	.byte	0
	.byte	0x6
	.4byte	.LASF22
	.byte	0x4
	.byte	0xaa
	.byte	0x3
	.4byte	0x108
	.byte	0xf
	.byte	0x4
	.byte	0x6
	.4byte	.LASF23
	.byte	0x5
	.byte	0x16
	.byte	0x17
	.4byte	0x82
	.byte	0x6
	.4byte	.LASF24
	.byte	0x6
	.byte	0xc
	.byte	0xd
	.4byte	0x97
	.byte	0x6
	.4byte	.LASF25
	.byte	0x5
	.byte	0x23
	.byte	0x1b
	.4byte	0x146
	.byte	0x10
	.4byte	.LASF30
	.byte	0x18
	.byte	0x5
	.byte	0x34
	.byte	0x8
	.4byte	0x1b8
	.byte	0xe
	.4byte	.LASF26
	.byte	0x5
	.byte	0x36
	.byte	0x13
	.4byte	0x1b8
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x5
	.byte	0x37
	.byte	0x7
	.4byte	0x97
	.byte	0x4
	.byte	0xe
	.4byte	.LASF27
	.byte	0x5
	.byte	0x37
	.byte	0xb
	.4byte	0x97
	.byte	0x8
	.byte	0xe
	.4byte	.LASF28
	.byte	0x5
	.byte	0x37
	.byte	0x14
	.4byte	0x97
	.byte	0xc
	.byte	0xe
	.4byte	.LASF29
	.byte	0x5
	.byte	0x37
	.byte	0x1b
	.4byte	0x97
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x5
	.byte	0x38
	.byte	0xb
	.4byte	0x1be
	.byte	0x14
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x15e
	.byte	0xb
	.4byte	0x13a
	.4byte	0x1ce
	.byte	0xc
	.4byte	0x4c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF31
	.byte	0x24
	.byte	0x5
	.byte	0x3c
	.byte	0x8
	.4byte	0x251
	.byte	0xe
	.4byte	.LASF32
	.byte	0x5
	.byte	0x3e
	.byte	0x7
	.4byte	0x97
	.byte	0
	.byte	0xe
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3f
	.byte	0x7
	.4byte	0x97
	.byte	0x4
	.byte	0xe
	.4byte	.LASF34
	.byte	0x5
	.byte	0x40
	.byte	0x7
	.4byte	0x97
	.byte	0x8
	.byte	0xe
	.4byte	.LASF35
	.byte	0x5
	.byte	0x41
	.byte	0x7
	.4byte	0x97
	.byte	0xc
	.byte	0xe
	.4byte	.LASF36
	.byte	0x5
	.byte	0x42
	.byte	0x7
	.4byte	0x97
	.byte	0x10
	.byte	0xe
	.4byte	.LASF37
	.byte	0x5
	.byte	0x43
	.byte	0x7
	.4byte	0x97
	.byte	0x14
	.byte	0xe
	.4byte	.LASF38
	.byte	0x5
	.byte	0x44
	.byte	0x7
	.4byte	0x97
	.byte	0x18
	.byte	0xe
	.4byte	.LASF39
	.byte	0x5
	.byte	0x45
	.byte	0x7
	.4byte	0x97
	.byte	0x1c
	.byte	0xe
	.4byte	.LASF40
	.byte	0x5
	.byte	0x46
	.byte	0x7
	.4byte	0x97
	.byte	0x20
	.byte	0
	.byte	0x13
	.4byte	.LASF41
	.2byte	0x108
	.byte	0x5
	.byte	0x4f
	.byte	0x8
	.4byte	0x296
	.byte	0xe
	.4byte	.LASF42
	.byte	0x5
	.byte	0x50
	.byte	0x9
	.4byte	0x296
	.byte	0
	.byte	0xe
	.4byte	.LASF43
	.byte	0x5
	.byte	0x51
	.byte	0x9
	.4byte	0x296
	.byte	0x80
	.byte	0x14
	.4byte	.LASF44
	.byte	0x5
	.byte	0x53
	.byte	0xa
	.4byte	0x13a
	.2byte	0x100
	.byte	0x14
	.4byte	.LASF45
	.byte	0x5
	.byte	0x56
	.byte	0xa
	.4byte	0x13a
	.2byte	0x104
	.byte	0
	.byte	0xb
	.4byte	0x138
	.4byte	0x2a6
	.byte	0xc
	.4byte	0x4c
	.byte	0x1f
	.byte	0
	.byte	0x13
	.4byte	.LASF46
	.2byte	0x190
	.byte	0x5
	.byte	0x62
	.byte	0x8
	.4byte	0x2e9
	.byte	0xe
	.4byte	.LASF26
	.byte	0x5
	.byte	0x63
	.byte	0x12
	.4byte	0x2e9
	.byte	0
	.byte	0xe
	.4byte	.LASF47
	.byte	0x5
	.byte	0x64
	.byte	0x6
	.4byte	0x97
	.byte	0x4
	.byte	0xe
	.4byte	.LASF48
	.byte	0x5
	.byte	0x66
	.byte	0x9
	.4byte	0x2ef
	.byte	0x8
	.byte	0xe
	.4byte	.LASF41
	.byte	0x5
	.byte	0x67
	.byte	0x1e
	.4byte	0x251
	.byte	0x88
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x2a6
	.byte	0xb
	.4byte	0x2ff
	.4byte	0x2ff
	.byte	0xc
	.4byte	0x4c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x305
	.byte	0x15
	.byte	0x10
	.4byte	.LASF49
	.byte	0x8
	.byte	0x5
	.byte	0x7a
	.byte	0x8
	.4byte	0x32e
	.byte	0xe
	.4byte	.LASF50
	.byte	0x5
	.byte	0x7b
	.byte	0x11
	.4byte	0x32e
	.byte	0
	.byte	0xe
	.4byte	.LASF51
	.byte	0x5
	.byte	0x7c
	.byte	0x6
	.4byte	0x97
	.byte	0x4
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x66
	.byte	0x10
	.4byte	.LASF52
	.byte	0x68
	.byte	0x5
	.byte	0xba
	.byte	0x8
	.4byte	0x477
	.byte	0x11
	.string	"_p"
	.byte	0x5
	.byte	0xbb
	.byte	0x12
	.4byte	0x32e
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x5
	.byte	0xbc
	.byte	0x7
	.4byte	0x97
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x5
	.byte	0xbd
	.byte	0x7
	.4byte	0x97
	.byte	0x8
	.byte	0xe
	.4byte	.LASF53
	.byte	0x5
	.byte	0xbe
	.byte	0x9
	.4byte	0x6d
	.byte	0xc
	.byte	0xe
	.4byte	.LASF54
	.byte	0x5
	.byte	0xbf
	.byte	0x9
	.4byte	0x6d
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x5
	.byte	0xc0
	.byte	0x11
	.4byte	0x306
	.byte	0x10
	.byte	0xe
	.4byte	.LASF55
	.byte	0x5
	.byte	0xc1
	.byte	0x7
	.4byte	0x97
	.byte	0x18
	.byte	0xe
	.4byte	.LASF56
	.byte	0x5
	.byte	0xc8
	.byte	0xa
	.4byte	0x138
	.byte	0x1c
	.byte	0xe
	.4byte	.LASF57
	.byte	0x5
	.byte	0xca
	.byte	0xe
	.4byte	0x5fb
	.byte	0x20
	.byte	0xe
	.4byte	.LASF58
	.byte	0x5
	.byte	0xcc
	.byte	0xe
	.4byte	0x625
	.byte	0x24
	.byte	0xe
	.4byte	.LASF59
	.byte	0x5
	.byte	0xcf
	.byte	0xd
	.4byte	0x649
	.byte	0x28
	.byte	0xe
	.4byte	.LASF60
	.byte	0x5
	.byte	0xd0
	.byte	0x9
	.4byte	0x663
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x5
	.byte	0xd3
	.byte	0x11
	.4byte	0x306
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x5
	.byte	0xd4
	.byte	0x12
	.4byte	0x32e
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x5
	.byte	0xd5
	.byte	0x7
	.4byte	0x97
	.byte	0x3c
	.byte	0xe
	.4byte	.LASF61
	.byte	0x5
	.byte	0xd8
	.byte	0x11
	.4byte	0x669
	.byte	0x40
	.byte	0xe
	.4byte	.LASF62
	.byte	0x5
	.byte	0xd9
	.byte	0x11
	.4byte	0x679
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x5
	.byte	0xdc
	.byte	0x11
	.4byte	0x306
	.byte	0x44
	.byte	0xe
	.4byte	.LASF63
	.byte	0x5
	.byte	0xdf
	.byte	0x7
	.4byte	0x97
	.byte	0x4c
	.byte	0xe
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe0
	.byte	0xa
	.4byte	0xb2
	.byte	0x50
	.byte	0xe
	.4byte	.LASF65
	.byte	0x5
	.byte	0xe3
	.byte	0x12
	.4byte	0x495
	.byte	0x54
	.byte	0xe
	.4byte	.LASF66
	.byte	0x5
	.byte	0xe7
	.byte	0xc
	.4byte	0x152
	.byte	0x58
	.byte	0xe
	.4byte	.LASF67
	.byte	0x5
	.byte	0xe9
	.byte	0xe
	.4byte	0x12c
	.byte	0x5c
	.byte	0xe
	.4byte	.LASF68
	.byte	0x5
	.byte	0xea
	.byte	0x7
	.4byte	0x97
	.byte	0x64
	.byte	0
	.byte	0x16
	.4byte	0xca
	.4byte	0x495
	.byte	0x17
	.4byte	0x495
	.byte	0x17
	.4byte	0x138
	.byte	0x17
	.4byte	0x5e9
	.byte	0x17
	.4byte	0x97
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x4a0
	.byte	0x18
	.4byte	0x495
	.byte	0x19
	.4byte	.LASF69
	.2byte	0x428
	.byte	0x5
	.2byte	0x265
	.byte	0x8
	.4byte	0x5e9
	.byte	0x1a
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x267
	.byte	0x7
	.4byte	0x97
	.byte	0
	.byte	0x1a
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6d5
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6d5
	.byte	0x8
	.byte	0x1a
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6d5
	.byte	0xc
	.byte	0x1a
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x26e
	.byte	0x7
	.4byte	0x97
	.byte	0x10
	.byte	0x1a
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8d5
	.byte	0x14
	.byte	0x1a
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x272
	.byte	0x7
	.4byte	0x97
	.byte	0x30
	.byte	0x1a
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x273
	.byte	0x16
	.4byte	0x8ea
	.byte	0x34
	.byte	0x1a
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x275
	.byte	0x7
	.4byte	0x97
	.byte	0x38
	.byte	0x1a
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x277
	.byte	0xa
	.4byte	0x8fb
	.byte	0x3c
	.byte	0x1a
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1b8
	.byte	0x40
	.byte	0x1a
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x27b
	.byte	0x7
	.4byte	0x97
	.byte	0x44
	.byte	0x1a
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1b8
	.byte	0x48
	.byte	0x1a
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x27d
	.byte	0x14
	.4byte	0x901
	.byte	0x4c
	.byte	0x1a
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x280
	.byte	0x7
	.4byte	0x97
	.byte	0x50
	.byte	0x1a
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x281
	.byte	0x9
	.4byte	0x5e9
	.byte	0x54
	.byte	0x1a
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8b0
	.byte	0x58
	.byte	0x1b
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x2e9
	.2byte	0x148
	.byte	0x1b
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2a6
	.2byte	0x14c
	.byte	0x1b
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x912
	.2byte	0x2dc
	.byte	0x1b
	.4byte	.LASF89
	.byte	0x5
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x696
	.2byte	0x2e0
	.byte	0x1b
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x91e
	.2byte	0x2ec
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x5ef
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF91
	.byte	0x18
	.4byte	0x5ef
	.byte	0x12
	.byte	0x4
	.4byte	0x477
	.byte	0x16
	.4byte	0xca
	.4byte	0x61f
	.byte	0x17
	.4byte	0x495
	.byte	0x17
	.4byte	0x138
	.byte	0x17
	.4byte	0x61f
	.byte	0x17
	.4byte	0x97
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x5f6
	.byte	0x12
	.byte	0x4
	.4byte	0x601
	.byte	0x16
	.4byte	0xbe
	.4byte	0x649
	.byte	0x17
	.4byte	0x495
	.byte	0x17
	.4byte	0x138
	.byte	0x17
	.4byte	0xbe
	.byte	0x17
	.4byte	0x97
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x62b
	.byte	0x16
	.4byte	0x97
	.4byte	0x663
	.byte	0x17
	.4byte	0x495
	.byte	0x17
	.4byte	0x138
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x64f
	.byte	0xb
	.4byte	0x66
	.4byte	0x679
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0xb
	.4byte	0x66
	.4byte	0x689
	.byte	0xc
	.4byte	0x4c
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF92
	.byte	0x5
	.2byte	0x124
	.byte	0x18
	.4byte	0x334
	.byte	0x1c
	.4byte	.LASF93
	.byte	0xc
	.byte	0x5
	.2byte	0x128
	.byte	0x8
	.4byte	0x6cf
	.byte	0x1a
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6cf
	.byte	0
	.byte	0x1a
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x12b
	.byte	0x7
	.4byte	0x97
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6d5
	.byte	0x8
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x696
	.byte	0x12
	.byte	0x4
	.4byte	0x689
	.byte	0x1c
	.4byte	.LASF96
	.byte	0xe
	.byte	0x5
	.2byte	0x144
	.byte	0x8
	.4byte	0x714
	.byte	0x1a
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x145
	.byte	0x12
	.4byte	0x714
	.byte	0
	.byte	0x1a
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x146
	.byte	0x12
	.4byte	0x714
	.byte	0x6
	.byte	0x1a
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x147
	.byte	0x12
	.4byte	0x74
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x74
	.4byte	0x724
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0x1d
	.byte	0xd0
	.byte	0x5
	.2byte	0x285
	.byte	0x7
	.4byte	0x839
	.byte	0x1a
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x287
	.byte	0x18
	.4byte	0x4c
	.byte	0
	.byte	0x1a
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x288
	.byte	0x12
	.4byte	0x5e9
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x289
	.byte	0x10
	.4byte	0x839
	.byte	0x8
	.byte	0x1a
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x28a
	.byte	0x17
	.4byte	0x1ce
	.byte	0x24
	.byte	0x1a
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x28b
	.byte	0xf
	.4byte	0x97
	.byte	0x48
	.byte	0x1a
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x28c
	.byte	0x2c
	.4byte	0x90
	.byte	0x50
	.byte	0x1a
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x6db
	.byte	0x58
	.byte	0x1a
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x28e
	.byte	0x16
	.4byte	0x12c
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x28f
	.byte	0x16
	.4byte	0x12c
	.byte	0x70
	.byte	0x1a
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x290
	.byte	0x16
	.4byte	0x12c
	.byte	0x78
	.byte	0x1a
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x291
	.byte	0x10
	.4byte	0x849
	.byte	0x80
	.byte	0x1a
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x292
	.byte	0x10
	.4byte	0x859
	.byte	0x88
	.byte	0x1a
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x293
	.byte	0xf
	.4byte	0x97
	.byte	0xa0
	.byte	0x1a
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x294
	.byte	0x16
	.4byte	0x12c
	.byte	0xa4
	.byte	0x1a
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x295
	.byte	0x16
	.4byte	0x12c
	.byte	0xac
	.byte	0x1a
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x296
	.byte	0x16
	.4byte	0x12c
	.byte	0xb4
	.byte	0x1a
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x297
	.byte	0x16
	.4byte	0x12c
	.byte	0xbc
	.byte	0x1a
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x298
	.byte	0x16
	.4byte	0x12c
	.byte	0xc4
	.byte	0x1a
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x299
	.byte	0x8
	.4byte	0x97
	.byte	0xcc
	.byte	0
	.byte	0xb
	.4byte	0x5ef
	.4byte	0x849
	.byte	0xc
	.4byte	0x4c
	.byte	0x19
	.byte	0
	.byte	0xb
	.4byte	0x5ef
	.4byte	0x859
	.byte	0xc
	.4byte	0x4c
	.byte	0x7
	.byte	0
	.byte	0xb
	.4byte	0x5ef
	.4byte	0x869
	.byte	0xc
	.4byte	0x4c
	.byte	0x17
	.byte	0
	.byte	0x1d
	.byte	0xf0
	.byte	0x5
	.2byte	0x29e
	.byte	0x7
	.4byte	0x890
	.byte	0x1a
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x890
	.byte	0
	.byte	0x1a
	.4byte	.LASF120
	.byte	0x5
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8a0
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	0x32e
	.4byte	0x8a0
	.byte	0xc
	.4byte	0x4c
	.byte	0x1d
	.byte	0
	.byte	0xb
	.4byte	0x4c
	.4byte	0x8b0
	.byte	0xc
	.4byte	0x4c
	.byte	0x1d
	.byte	0
	.byte	0x1e
	.byte	0xf0
	.byte	0x5
	.2byte	0x283
	.byte	0x3
	.4byte	0x8d5
	.byte	0x1f
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x29a
	.byte	0xb
	.4byte	0x724
	.byte	0x1f
	.4byte	.LASF121
	.byte	0x5
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x869
	.byte	0
	.byte	0xb
	.4byte	0x5ef
	.4byte	0x8e5
	.byte	0xc
	.4byte	0x4c
	.byte	0x18
	.byte	0
	.byte	0x20
	.4byte	.LASF166
	.byte	0x12
	.byte	0x4
	.4byte	0x8e5
	.byte	0x21
	.4byte	0x8fb
	.byte	0x17
	.4byte	0x495
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x8f0
	.byte	0x12
	.byte	0x4
	.4byte	0x1b8
	.byte	0x21
	.4byte	0x912
	.byte	0x17
	.4byte	0x97
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x918
	.byte	0x12
	.byte	0x4
	.4byte	0x907
	.byte	0xb
	.4byte	0x689
	.4byte	0x92e
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0x22
	.4byte	.LASF122
	.byte	0x5
	.2byte	0x333
	.byte	0x17
	.4byte	0x495
	.byte	0x22
	.4byte	.LASF123
	.byte	0x5
	.2byte	0x334
	.byte	0x1d
	.4byte	0x49b
	.byte	0x6
	.4byte	.LASF124
	.byte	0x7
	.byte	0x6b
	.byte	0x17
	.4byte	0x82
	.byte	0x23
	.4byte	.LASF125
	.byte	0x8
	.byte	0x9a
	.byte	0xd
	.4byte	0x7b
	.byte	0x23
	.4byte	.LASF126
	.byte	0x8
	.byte	0x9b
	.byte	0xc
	.4byte	0x97
	.byte	0xb
	.4byte	0x5e9
	.4byte	0x97c
	.byte	0xc
	.4byte	0x4c
	.byte	0x1
	.byte	0
	.byte	0x23
	.4byte	.LASF127
	.byte	0x8
	.byte	0x9e
	.byte	0xe
	.4byte	0x96c
	.byte	0x23
	.4byte	.LASF128
	.byte	0x9
	.byte	0x67
	.byte	0xe
	.4byte	0x5e9
	.byte	0x5
	.byte	0x1
	.byte	0x2
	.4byte	.LASF129
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x4c
	.byte	0xa
	.byte	0xa
	.byte	0xe
	.4byte	0x9db
	.byte	0x3
	.string	"OFF"
	.byte	0
	.byte	0x4
	.4byte	.LASF130
	.byte	0x1
	.byte	0x3
	.string	"GBY"
	.byte	0x2
	.byte	0x3
	.string	"GB"
	.byte	0x3
	.byte	0x3
	.string	"GY"
	.byte	0x4
	.byte	0x3
	.string	"RB"
	.byte	0x5
	.byte	0x3
	.string	"G"
	.byte	0x6
	.byte	0x3
	.string	"R"
	.byte	0x7
	.byte	0x3
	.string	"B"
	.byte	0x8
	.byte	0x3
	.string	"Y"
	.byte	0x9
	.byte	0
	.byte	0x6
	.4byte	.LASF131
	.byte	0xa
	.byte	0xa
	.byte	0x37
	.4byte	0x99b
	.byte	0x24
	.4byte	0x9db
	.byte	0x2
	.byte	0x7
	.byte	0x4
	.4byte	0x4c
	.byte	0xa
	.byte	0xb
	.byte	0xe
	.4byte	0xa49
	.byte	0x4
	.4byte	.LASF132
	.byte	0
	.byte	0x4
	.4byte	.LASF133
	.byte	0x1
	.byte	0x4
	.4byte	.LASF134
	.byte	0x2
	.byte	0x4
	.4byte	.LASF135
	.byte	0x3
	.byte	0x4
	.4byte	.LASF136
	.byte	0x4
	.byte	0x4
	.4byte	.LASF137
	.byte	0x5
	.byte	0x4
	.4byte	.LASF138
	.byte	0x6
	.byte	0x4
	.4byte	.LASF139
	.byte	0x7
	.byte	0x4
	.4byte	.LASF140
	.byte	0x8
	.byte	0x4
	.4byte	.LASF141
	.byte	0x9
	.byte	0x4
	.4byte	.LASF142
	.byte	0xa
	.byte	0x4
	.4byte	.LASF143
	.byte	0xb
	.byte	0x4
	.4byte	.LASF144
	.byte	0xc
	.byte	0
	.byte	0x6
	.4byte	.LASF145
	.byte	0xa
	.byte	0xf
	.byte	0x3
	.4byte	0x9ec
	.byte	0x25
	.4byte	.LASF146
	.byte	0x1
	.byte	0x3
	.byte	0x12
	.4byte	0x9e7
	.byte	0x5
	.byte	0x3
	.4byte	state
	.byte	0x26
	.string	"n"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	0x97
	.byte	0x5
	.byte	0x3
	.4byte	n
	.byte	0x26
	.string	"t"
	.byte	0x1
	.byte	0x5
	.byte	0x5
	.4byte	0x97
	.byte	0x5
	.byte	0x3
	.4byte	t
	.byte	0x25
	.4byte	.LASF147
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.4byte	0x97
	.byte	0x5
	.byte	0x3
	.4byte	level
	.byte	0xb
	.4byte	0x53
	.4byte	0xaa9
	.byte	0xc
	.4byte	0x4c
	.byte	0x9
	.byte	0
	.byte	0x25
	.4byte	.LASF148
	.byte	0x1
	.byte	0x7
	.byte	0x7
	.4byte	0xa99
	.byte	0x5
	.byte	0x3
	.4byte	targets
	.byte	0x26
	.string	"i"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	0x97
	.byte	0x5
	.byte	0x3
	.4byte	i
	.byte	0x25
	.4byte	.LASF149
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.4byte	0x994
	.byte	0x5
	.byte	0x3
	.4byte	success
	.byte	0x25
	.4byte	.LASF150
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x994
	.byte	0x5
	.byte	0x3
	.4byte	failure
	.byte	0x27
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x126
	.byte	0x5
	.4byte	0x97
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.byte	0x28
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x11b
	.byte	0x6
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0xb36
	.byte	0x29
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x2a
	.string	"j"
	.byte	0x1
	.2byte	0x11c
	.byte	0xe
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x115
	.byte	0x6
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.byte	0x2b
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x10e
	.byte	0x6
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.byte	0x2b
	.4byte	.LASF153
	.byte	0x1
	.2byte	0x106
	.byte	0x6
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.byte	0x2c
	.4byte	.LASF154
	.byte	0x1
	.byte	0xf8
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.byte	0x2c
	.4byte	.LASF155
	.byte	0x1
	.byte	0xed
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.byte	0x2c
	.4byte	.LASF156
	.byte	0x1
	.byte	0xe8
	.byte	0x6
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.byte	0x2d
	.4byte	.LASF157
	.byte	0x1
	.byte	0xe2
	.byte	0x6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.byte	0x2d
	.4byte	.LASF158
	.byte	0x1
	.byte	0xd9
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.byte	0x2e
	.4byte	.LASF168
	.byte	0x1
	.byte	0xc3
	.byte	0x5
	.4byte	0x994
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xc32
	.byte	0x2f
	.string	"end"
	.byte	0x1
	.byte	0xc4
	.byte	0xd
	.4byte	0x948
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x29
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x30
	.4byte	.LASF159
	.byte	0x1
	.byte	0xc6
	.byte	0xd
	.4byte	0x994
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x30
	.4byte	.LASF160
	.byte	0x1
	.byte	0xc7
	.byte	0xd
	.4byte	0xc32
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x29
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x2f
	.string	"j"
	.byte	0x1
	.byte	0xc9
	.byte	0x12
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x994
	.4byte	0xc42
	.byte	0xc
	.4byte	0x4c
	.byte	0x3
	.byte	0
	.byte	0x31
	.4byte	.LASF162
	.byte	0x1
	.byte	0xb2
	.byte	0x9
	.4byte	0x9db
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0x32
	.4byte	.LASF169
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.byte	0x33
	.4byte	.LASF170
	.byte	0x1
	.byte	0xc
	.byte	0x14
	.4byte	0xa49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x30
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x31
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x32
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x33
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF43:
	.string	"_dso_handle"
.LASF140:
	.string	"play_break"
.LASF51:
	.string	"_size"
.LASF169:
	.string	"senso"
.LASF96:
	.string	"_rand48"
.LASF75:
	.string	"_emergency"
.LASF126:
	.string	"_daylight"
.LASF156:
	.string	"play_init_sequence"
.LASF65:
	.string	"_data"
.LASF132:
	.string	"init"
.LASF116:
	.string	"_wcrtomb_state"
.LASF117:
	.string	"_wcsrtombs_state"
.LASF11:
	.string	"long long unsigned int"
.LASF55:
	.string	"_lbfsize"
.LASF151:
	.string	"play_lose_sequence"
.LASF166:
	.string	"__locale_t"
.LASF114:
	.string	"_mbrtowc_state"
.LASF127:
	.string	"_tzname"
.LASF134:
	.string	"play_standby_y"
.LASF109:
	.string	"_wctomb_state"
.LASF32:
	.string	"__tm_sec"
.LASF10:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF61:
	.string	"_ubuf"
.LASF50:
	.string	"_base"
.LASF34:
	.string	"__tm_hour"
.LASF90:
	.string	"__sf"
.LASF41:
	.string	"_on_exit_args"
.LASF56:
	.string	"_cookie"
.LASF89:
	.string	"__sglue"
.LASF146:
	.string	"state"
.LASF8:
	.string	"long int"
.LASF154:
	.string	"play_demo_sequence"
.LASF53:
	.string	"_flags"
.LASF45:
	.string	"_is_cxa"
.LASF71:
	.string	"_stdin"
.LASF135:
	.string	"play_standby_b"
.LASF63:
	.string	"_blksize"
.LASF136:
	.string	"play_standby_g"
.LASF2:
	.string	"YELLOW"
.LASF85:
	.string	"_cvtbuf"
.LASF64:
	.string	"_offset"
.LASF115:
	.string	"_mbsrtowcs_state"
.LASF113:
	.string	"_mbrlen_state"
.LASF152:
	.string	"play_break_sequence"
.LASF42:
	.string	"_fnargs"
.LASF48:
	.string	"_fns"
.LASF124:
	.string	"clock_t"
.LASF28:
	.string	"_sign"
.LASF25:
	.string	"_flock_t"
.LASF73:
	.string	"_stderr"
.LASF30:
	.string	"_Bigint"
.LASF104:
	.string	"_gamma_signgam"
.LASF165:
	.string	"/home/crappyalgorithm/embedded/workspace/senso_game"
.LASF57:
	.string	"_read"
.LASF81:
	.string	"_result_k"
.LASF145:
	.string	"event_t"
.LASF168:
	.string	"match_next_button"
.LASF31:
	.string	"__tm"
.LASF3:
	.string	"unsigned int"
.LASF19:
	.string	"__wchb"
.LASF72:
	.string	"_stdout"
.LASF84:
	.string	"_cvtlen"
.LASF9:
	.string	"long unsigned int"
.LASF54:
	.string	"_file"
.LASF155:
	.string	"play_standby_sequence"
.LASF94:
	.string	"_niobs"
.LASF148:
	.string	"targets"
.LASF147:
	.string	"level"
.LASF162:
	.string	"add_target_led"
.LASF158:
	.string	"raise_level"
.LASF7:
	.string	"short unsigned int"
.LASF87:
	.string	"_atexit0"
.LASF111:
	.string	"_signal_buf"
.LASF102:
	.string	"_asctime_buf"
.LASF70:
	.string	"_errno"
.LASF80:
	.string	"_result"
.LASF18:
	.string	"__wch"
.LASF133:
	.string	"play_standby"
.LASF164:
	.string	"src/senso.c"
.LASF14:
	.string	"wint_t"
.LASF131:
	.string	"state_t"
.LASF66:
	.string	"_lock"
.LASF68:
	.string	"_flags2"
.LASF144:
	.string	"play_end_long"
.LASF130:
	.string	"RGBY"
.LASF58:
	.string	"_write"
.LASF37:
	.string	"__tm_year"
.LASF120:
	.string	"_nmalloc"
.LASF12:
	.string	"long double"
.LASF119:
	.string	"_nextf"
.LASF153:
	.string	"play_imitation_sequence"
.LASF36:
	.string	"__tm_mon"
.LASF46:
	.string	"_atexit"
.LASF128:
	.string	"suboptarg"
.LASF78:
	.string	"__sdidinit"
.LASF15:
	.string	"_off_t"
.LASF159:
	.string	"right_button"
.LASF83:
	.string	"_freelist"
.LASF125:
	.string	"_timezone"
.LASF24:
	.string	"_LOCK_RECURSIVE_T"
.LASF141:
	.string	"end_break"
.LASF129:
	.string	"_Bool"
.LASF5:
	.string	"unsigned char"
.LASF163:
	.string	"GNU C17 8.3.0 -march=rv32imac -mabi=ilp32 -mcmodel=medlow -g -Os -O0 -fno-builtin-printf"
.LASF86:
	.string	"_new"
.LASF118:
	.string	"_h_errno"
.LASF6:
	.string	"short int"
.LASF39:
	.string	"__tm_yday"
.LASF49:
	.string	"__sbuf"
.LASF95:
	.string	"_iobs"
.LASF92:
	.string	"__FILE"
.LASF22:
	.string	"_mbstate_t"
.LASF52:
	.string	"__sFILE"
.LASF67:
	.string	"_mbstate"
.LASF105:
	.string	"_rand_next"
.LASF139:
	.string	"imitate"
.LASF107:
	.string	"_mblen_state"
.LASF74:
	.string	"_inc"
.LASF47:
	.string	"_ind"
.LASF167:
	.string	"play_end_sequence"
.LASF77:
	.string	"_locale"
.LASF79:
	.string	"__cleanup"
.LASF76:
	.string	"_unspecified_locale_info"
.LASF27:
	.string	"_maxwds"
.LASF69:
	.string	"_reent"
.LASF143:
	.string	"play_end"
.LASF97:
	.string	"_seed"
.LASF20:
	.string	"__count"
.LASF21:
	.string	"__value"
.LASF59:
	.string	"_seek"
.LASF122:
	.string	"_impure_ptr"
.LASF16:
	.string	"_fpos_t"
.LASF13:
	.string	"color"
.LASF91:
	.string	"char"
.LASF137:
	.string	"demo"
.LASF33:
	.string	"__tm_min"
.LASF1:
	.string	"BLUE"
.LASF0:
	.string	"GREEN"
.LASF98:
	.string	"_mult"
.LASF26:
	.string	"_next"
.LASF101:
	.string	"_strtok_last"
.LASF44:
	.string	"_fntypes"
.LASF99:
	.string	"_add"
.LASF23:
	.string	"__ULong"
.LASF112:
	.string	"_getdate_err"
.LASF123:
	.string	"_global_impure_ptr"
.LASF100:
	.string	"_unused_rand"
.LASF170:
	.string	"event"
.LASF160:
	.string	"pressed"
.LASF29:
	.string	"_wds"
.LASF38:
	.string	"__tm_wday"
.LASF93:
	.string	"_glue"
.LASF17:
	.string	"_ssize_t"
.LASF110:
	.string	"_l64a_buf"
.LASF88:
	.string	"_sig_func"
.LASF138:
	.string	"create_target"
.LASF157:
	.string	"reset_game"
.LASF62:
	.string	"_nbuf"
.LASF121:
	.string	"_unused"
.LASF142:
	.string	"play_lose"
.LASF40:
	.string	"__tm_isdst"
.LASF103:
	.string	"_localtime_buf"
.LASF60:
	.string	"_close"
.LASF150:
	.string	"failure"
.LASF106:
	.string	"_r48"
.LASF108:
	.string	"_mbtowc_state"
.LASF82:
	.string	"_p5s"
.LASF161:
	.string	"main"
.LASF35:
	.string	"__tm_mday"
.LASF149:
	.string	"success"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
