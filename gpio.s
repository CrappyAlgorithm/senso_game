	.file	"gpio.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	LEDS
	.data
	.align	2
	.type	LEDS, @object
	.size	LEDS, 48
LEDS:
	.word	0
	.word	3
	.zero	4
	.word	1
	.word	18
	.zero	4
	.word	2
	.word	21
	.zero	4
	.word	3
	.word	0
	.zero	4
	.globl	BUTTON
	.align	2
	.type	BUTTON, @object
	.size	BUTTON, 48
BUTTON:
	.word	0
	.word	2
	.zero	4
	.word	1
	.word	19
	.zero	4
	.word	2
	.word	20
	.zero	4
	.word	3
	.word	1
	.zero	4
	.text
	.align	1
	.globl	init_gpio
	.type	init_gpio, @function
init_gpio:
.LFB3:
	.file 1 "src/gpio.c"
	.loc 1 21 22
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 22 14
	sw	zero,-20(s0)
	.loc 1 22 5
	j	.L2
.L3:
	.loc 1 23 51 discriminator 3
	li	a5,268509184
	addi	a5,a5,56
	lw	a3,0(a5)
	.loc 1 23 68 discriminator 3
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 23 58 discriminator 3
	li	a4,1
	sll	a5,a4,a5
	.loc 1 23 54 discriminator 3
	not	a5,a5
	mv	a4,a5
	.loc 1 23 51 discriminator 3
	li	a5,268509184
	addi	a5,a5,56
	and	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 24 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,4
	lw	a3,0(a5)
	.loc 1 24 67 discriminator 3
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 24 57 discriminator 3
	li	a4,1
	sll	a5,a4,a5
	.loc 1 24 53 discriminator 3
	not	a5,a5
	mv	a4,a5
	.loc 1 24 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,4
	and	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 25 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,8
	lw	a3,0(a5)
	.loc 1 25 65 discriminator 3
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 25 55 discriminator 3
	li	a4,1
	sll	a5,a4,a5
	mv	a4,a5
	.loc 1 25 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,8
	or	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 26 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,12
	lw	a3,0(a5)
	.loc 1 26 67 discriminator 3
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 26 57 discriminator 3
	li	a4,1
	sll	a5,a4,a5
	.loc 1 26 53 discriminator 3
	not	a5,a5
	mv	a4,a5
	.loc 1 26 50 discriminator 3
	li	a5,268509184
	addi	a5,a5,12
	and	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 27 24 discriminator 3
	lui	a5,%hi(LEDS)
	addi	a3,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sb	zero,8(a5)
	.loc 1 22 29 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 22 5 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L3
.LBE2:
	.loc 1 29 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	init_gpio, .-init_gpio
	.section	.rodata
	.align	2
.LC0:
	.string	"%d"
	.text
	.align	1
	.globl	get_input
	.type	get_input, @function
get_input:
.LFB4:
	.loc 1 31 30
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	.loc 1 33 5
	addi	a5,s0,-20
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	scanf
	.loc 1 34 15
	lw	a5,-20(s0)
	.loc 1 34 8
	blt	a5,zero,.L6
	.loc 1 34 29 discriminator 1
	lw	a4,-20(s0)
	.loc 1 34 20 discriminator 1
	li	a5,3
	bgt	a4,a5,.L6
	.loc 1 35 16
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	.loc 1 35 24
	li	a4,1
	sb	a4,0(a5)
.L6:
	.loc 1 37 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	get_input, .-get_input
	.align	1
	.globl	toggle_led
	.type	toggle_led, @function
toggle_led:
.LFB5:
	.loc 1 39 26
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 1 40 8
	lw	a4,-20(s0)
	li	a5,3
	bgtu	a4,a5,.L11
	.loc 1 43 16
	lui	a5,%hi(LEDS)
	addi	a3,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lbu	a5,8(a5)
	.loc 1 43 8
	beq	a5,zero,.L10
	.loc 1 44 53
	li	a5,268509184
	addi	a5,a5,12
	lw	a3,0(a5)
	.loc 1 44 70
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 44 60
	li	a4,1
	sll	a5,a4,a5
	.loc 1 44 56
	not	a5,a5
	mv	a4,a5
	.loc 1 44 53
	li	a5,268509184
	addi	a5,a5,12
	and	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 45 24
	lui	a5,%hi(LEDS)
	addi	a3,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	sb	zero,8(a5)
	j	.L7
.L10:
	.loc 1 47 53
	li	a5,268509184
	addi	a5,a5,12
	lw	a3,0(a5)
	.loc 1 47 69
	lui	a5,%hi(LEDS)
	addi	a2,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	lw	a5,4(a5)
	.loc 1 47 59
	li	a4,1
	sll	a5,a4,a5
	mv	a4,a5
	.loc 1 47 53
	li	a5,268509184
	addi	a5,a5,12
	or	a4,a3,a4
	sw	a4,0(a5)
	.loc 1 48 24
	lui	a5,%hi(LEDS)
	addi	a3,a5,%lo(LEDS)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	li	a4,1
	sb	a4,8(a5)
	j	.L7
.L11:
	.loc 1 41 9
	nop
.L7:
	.loc 1 50 1
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	toggle_led, .-toggle_led
	.align	1
	.globl	toggle_all_led
	.type	toggle_all_led, @function
toggle_all_led:
.LFB6:
	.loc 1 52 27
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 1 53 14
	sw	zero,-20(s0)
	.loc 1 53 5
	j	.L13
.L14:
	.loc 1 54 9 discriminator 3
	lw	a5,-20(s0)
	mv	a0,a5
	call	toggle_led
	.loc 1 53 29 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L13:
	.loc 1 53 5 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L14
.LBE3:
	.loc 1 56 1
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
.LFE6:
	.size	toggle_all_led, .-toggle_all_led
.Letext0:
	.file 2 "include/game_setup.h"
	.file 3 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/machine/_default_types.h"
	.file 4 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/lib/gcc/riscv64-unknown-elf/8.3.0/include/stddef.h"
	.file 5 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/_types.h"
	.file 6 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/reent.h"
	.file 7 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/lock.h"
	.file 8 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/sys/_stdint.h"
	.file 9 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/time.h"
	.file 10 "/home/crappyalgorithm/.platformio/packages/toolchain-riscv/riscv64-unknown-elf/include/stdlib.h"
	.file 11 "include/gpio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xaca
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF140
	.byte	0xc
	.4byte	.LASF141
	.4byte	.LASF142
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
	.4byte	.LASF9
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
	.byte	0x6
	.4byte	.LASF10
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x8e
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.byte	0x10
	.byte	0x4
	.4byte	.LASF14
	.byte	0x8
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x165
	.byte	0x16
	.4byte	0x4c
	.byte	0x6
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2e
	.byte	0xe
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF17
	.byte	0x5
	.byte	0x74
	.byte	0xe
	.4byte	0x7b
	.byte	0x6
	.4byte	.LASF18
	.byte	0x5
	.byte	0x93
	.byte	0x14
	.4byte	0xa3
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.byte	0xa5
	.byte	0x3
	.4byte	0x104
	.byte	0xa
	.4byte	.LASF19
	.byte	0x5
	.byte	0xa7
	.byte	0xc
	.4byte	0xb1
	.byte	0xa
	.4byte	.LASF20
	.byte	0x5
	.byte	0xa8
	.byte	0x13
	.4byte	0x104
	.byte	0
	.byte	0xb
	.4byte	0x66
	.4byte	0x114
	.byte	0xc
	.4byte	0x4c
	.byte	0x3
	.byte	0
	.byte	0xd
	.byte	0x8
	.byte	0x5
	.byte	0xa2
	.byte	0x9
	.4byte	0x138
	.byte	0xe
	.4byte	.LASF21
	.byte	0x5
	.byte	0xa4
	.byte	0x7
	.4byte	0xa3
	.byte	0
	.byte	0xe
	.4byte	.LASF22
	.byte	0x5
	.byte	0xa9
	.byte	0x5
	.4byte	0xe2
	.byte	0x4
	.byte	0
	.byte	0x6
	.4byte	.LASF23
	.byte	0x5
	.byte	0xaa
	.byte	0x3
	.4byte	0x114
	.byte	0xf
	.byte	0x4
	.byte	0x6
	.4byte	.LASF24
	.byte	0x6
	.byte	0x16
	.byte	0x17
	.4byte	0x8e
	.byte	0x6
	.4byte	.LASF25
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.4byte	0xa3
	.byte	0x6
	.4byte	.LASF26
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x152
	.byte	0x10
	.4byte	.LASF31
	.byte	0x18
	.byte	0x6
	.byte	0x34
	.byte	0x8
	.4byte	0x1c4
	.byte	0xe
	.4byte	.LASF27
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	0x1c4
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x6
	.byte	0x37
	.byte	0x7
	.4byte	0xa3
	.byte	0x4
	.byte	0xe
	.4byte	.LASF28
	.byte	0x6
	.byte	0x37
	.byte	0xb
	.4byte	0xa3
	.byte	0x8
	.byte	0xe
	.4byte	.LASF29
	.byte	0x6
	.byte	0x37
	.byte	0x14
	.4byte	0xa3
	.byte	0xc
	.byte	0xe
	.4byte	.LASF30
	.byte	0x6
	.byte	0x37
	.byte	0x1b
	.4byte	0xa3
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x6
	.byte	0x38
	.byte	0xb
	.4byte	0x1ca
	.byte	0x14
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x16a
	.byte	0xb
	.4byte	0x146
	.4byte	0x1da
	.byte	0xc
	.4byte	0x4c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF32
	.byte	0x24
	.byte	0x6
	.byte	0x3c
	.byte	0x8
	.4byte	0x25d
	.byte	0xe
	.4byte	.LASF33
	.byte	0x6
	.byte	0x3e
	.byte	0x7
	.4byte	0xa3
	.byte	0
	.byte	0xe
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3f
	.byte	0x7
	.4byte	0xa3
	.byte	0x4
	.byte	0xe
	.4byte	.LASF35
	.byte	0x6
	.byte	0x40
	.byte	0x7
	.4byte	0xa3
	.byte	0x8
	.byte	0xe
	.4byte	.LASF36
	.byte	0x6
	.byte	0x41
	.byte	0x7
	.4byte	0xa3
	.byte	0xc
	.byte	0xe
	.4byte	.LASF37
	.byte	0x6
	.byte	0x42
	.byte	0x7
	.4byte	0xa3
	.byte	0x10
	.byte	0xe
	.4byte	.LASF38
	.byte	0x6
	.byte	0x43
	.byte	0x7
	.4byte	0xa3
	.byte	0x14
	.byte	0xe
	.4byte	.LASF39
	.byte	0x6
	.byte	0x44
	.byte	0x7
	.4byte	0xa3
	.byte	0x18
	.byte	0xe
	.4byte	.LASF40
	.byte	0x6
	.byte	0x45
	.byte	0x7
	.4byte	0xa3
	.byte	0x1c
	.byte	0xe
	.4byte	.LASF41
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0xa3
	.byte	0x20
	.byte	0
	.byte	0x13
	.4byte	.LASF42
	.2byte	0x108
	.byte	0x6
	.byte	0x4f
	.byte	0x8
	.4byte	0x2a2
	.byte	0xe
	.4byte	.LASF43
	.byte	0x6
	.byte	0x50
	.byte	0x9
	.4byte	0x2a2
	.byte	0
	.byte	0xe
	.4byte	.LASF44
	.byte	0x6
	.byte	0x51
	.byte	0x9
	.4byte	0x2a2
	.byte	0x80
	.byte	0x14
	.4byte	.LASF45
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.4byte	0x146
	.2byte	0x100
	.byte	0x14
	.4byte	.LASF46
	.byte	0x6
	.byte	0x56
	.byte	0xa
	.4byte	0x146
	.2byte	0x104
	.byte	0
	.byte	0xb
	.4byte	0x144
	.4byte	0x2b2
	.byte	0xc
	.4byte	0x4c
	.byte	0x1f
	.byte	0
	.byte	0x13
	.4byte	.LASF47
	.2byte	0x190
	.byte	0x6
	.byte	0x62
	.byte	0x8
	.4byte	0x2f5
	.byte	0xe
	.4byte	.LASF27
	.byte	0x6
	.byte	0x63
	.byte	0x12
	.4byte	0x2f5
	.byte	0
	.byte	0xe
	.4byte	.LASF48
	.byte	0x6
	.byte	0x64
	.byte	0x6
	.4byte	0xa3
	.byte	0x4
	.byte	0xe
	.4byte	.LASF49
	.byte	0x6
	.byte	0x66
	.byte	0x9
	.4byte	0x2fb
	.byte	0x8
	.byte	0xe
	.4byte	.LASF42
	.byte	0x6
	.byte	0x67
	.byte	0x1e
	.4byte	0x25d
	.byte	0x88
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x2b2
	.byte	0xb
	.4byte	0x30b
	.4byte	0x30b
	.byte	0xc
	.4byte	0x4c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x311
	.byte	0x15
	.byte	0x10
	.4byte	.LASF50
	.byte	0x8
	.byte	0x6
	.byte	0x7a
	.byte	0x8
	.4byte	0x33a
	.byte	0xe
	.4byte	.LASF51
	.byte	0x6
	.byte	0x7b
	.byte	0x11
	.4byte	0x33a
	.byte	0
	.byte	0xe
	.4byte	.LASF52
	.byte	0x6
	.byte	0x7c
	.byte	0x6
	.4byte	0xa3
	.byte	0x4
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x66
	.byte	0x10
	.4byte	.LASF53
	.byte	0x68
	.byte	0x6
	.byte	0xba
	.byte	0x8
	.4byte	0x483
	.byte	0x11
	.string	"_p"
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0x33a
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x6
	.byte	0xbc
	.byte	0x7
	.4byte	0xa3
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x6
	.byte	0xbd
	.byte	0x7
	.4byte	0xa3
	.byte	0x8
	.byte	0xe
	.4byte	.LASF54
	.byte	0x6
	.byte	0xbe
	.byte	0x9
	.4byte	0x6d
	.byte	0xc
	.byte	0xe
	.4byte	.LASF55
	.byte	0x6
	.byte	0xbf
	.byte	0x9
	.4byte	0x6d
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x6
	.byte	0xc0
	.byte	0x11
	.4byte	0x312
	.byte	0x10
	.byte	0xe
	.4byte	.LASF56
	.byte	0x6
	.byte	0xc1
	.byte	0x7
	.4byte	0xa3
	.byte	0x18
	.byte	0xe
	.4byte	.LASF57
	.byte	0x6
	.byte	0xc8
	.byte	0xa
	.4byte	0x144
	.byte	0x1c
	.byte	0xe
	.4byte	.LASF58
	.byte	0x6
	.byte	0xca
	.byte	0xe
	.4byte	0x607
	.byte	0x20
	.byte	0xe
	.4byte	.LASF59
	.byte	0x6
	.byte	0xcc
	.byte	0xe
	.4byte	0x631
	.byte	0x24
	.byte	0xe
	.4byte	.LASF60
	.byte	0x6
	.byte	0xcf
	.byte	0xd
	.4byte	0x655
	.byte	0x28
	.byte	0xe
	.4byte	.LASF61
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x66f
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x312
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x6
	.byte	0xd4
	.byte	0x12
	.4byte	0x33a
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x6
	.byte	0xd5
	.byte	0x7
	.4byte	0xa3
	.byte	0x3c
	.byte	0xe
	.4byte	.LASF62
	.byte	0x6
	.byte	0xd8
	.byte	0x11
	.4byte	0x675
	.byte	0x40
	.byte	0xe
	.4byte	.LASF63
	.byte	0x6
	.byte	0xd9
	.byte	0x11
	.4byte	0x685
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x6
	.byte	0xdc
	.byte	0x11
	.4byte	0x312
	.byte	0x44
	.byte	0xe
	.4byte	.LASF64
	.byte	0x6
	.byte	0xdf
	.byte	0x7
	.4byte	0xa3
	.byte	0x4c
	.byte	0xe
	.4byte	.LASF65
	.byte	0x6
	.byte	0xe0
	.byte	0xa
	.4byte	0xbe
	.byte	0x50
	.byte	0xe
	.4byte	.LASF66
	.byte	0x6
	.byte	0xe3
	.byte	0x12
	.4byte	0x4a1
	.byte	0x54
	.byte	0xe
	.4byte	.LASF67
	.byte	0x6
	.byte	0xe7
	.byte	0xc
	.4byte	0x15e
	.byte	0x58
	.byte	0xe
	.4byte	.LASF68
	.byte	0x6
	.byte	0xe9
	.byte	0xe
	.4byte	0x138
	.byte	0x5c
	.byte	0xe
	.4byte	.LASF69
	.byte	0x6
	.byte	0xea
	.byte	0x7
	.4byte	0xa3
	.byte	0x64
	.byte	0
	.byte	0x16
	.4byte	0xd6
	.4byte	0x4a1
	.byte	0x17
	.4byte	0x4a1
	.byte	0x17
	.4byte	0x144
	.byte	0x17
	.4byte	0x5f5
	.byte	0x17
	.4byte	0xa3
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x4ac
	.byte	0x18
	.4byte	0x4a1
	.byte	0x19
	.4byte	.LASF70
	.2byte	0x428
	.byte	0x6
	.2byte	0x265
	.byte	0x8
	.4byte	0x5f5
	.byte	0x1a
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x267
	.byte	0x7
	.4byte	0xa3
	.byte	0
	.byte	0x1a
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6e1
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6e1
	.byte	0x8
	.byte	0x1a
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6e1
	.byte	0xc
	.byte	0x1a
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x26e
	.byte	0x7
	.4byte	0xa3
	.byte	0x10
	.byte	0x1a
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8e1
	.byte	0x14
	.byte	0x1a
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x272
	.byte	0x7
	.4byte	0xa3
	.byte	0x30
	.byte	0x1a
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x273
	.byte	0x16
	.4byte	0x8f6
	.byte	0x34
	.byte	0x1a
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x275
	.byte	0x7
	.4byte	0xa3
	.byte	0x38
	.byte	0x1a
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x277
	.byte	0xa
	.4byte	0x907
	.byte	0x3c
	.byte	0x1a
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1c4
	.byte	0x40
	.byte	0x1a
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0xa3
	.byte	0x44
	.byte	0x1a
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1c4
	.byte	0x48
	.byte	0x1a
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x27d
	.byte	0x14
	.4byte	0x90d
	.byte	0x4c
	.byte	0x1a
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0xa3
	.byte	0x50
	.byte	0x1a
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x281
	.byte	0x9
	.4byte	0x5f5
	.byte	0x54
	.byte	0x1a
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8bc
	.byte	0x58
	.byte	0x1b
	.4byte	.LASF47
	.byte	0x6
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x2f5
	.2byte	0x148
	.byte	0x1b
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2b2
	.2byte	0x14c
	.byte	0x1b
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x91e
	.2byte	0x2dc
	.byte	0x1b
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x6a2
	.2byte	0x2e0
	.byte	0x1b
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x92a
	.2byte	0x2ec
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x5fb
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF92
	.byte	0x18
	.4byte	0x5fb
	.byte	0x12
	.byte	0x4
	.4byte	0x483
	.byte	0x16
	.4byte	0xd6
	.4byte	0x62b
	.byte	0x17
	.4byte	0x4a1
	.byte	0x17
	.4byte	0x144
	.byte	0x17
	.4byte	0x62b
	.byte	0x17
	.4byte	0xa3
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x602
	.byte	0x12
	.byte	0x4
	.4byte	0x60d
	.byte	0x16
	.4byte	0xca
	.4byte	0x655
	.byte	0x17
	.4byte	0x4a1
	.byte	0x17
	.4byte	0x144
	.byte	0x17
	.4byte	0xca
	.byte	0x17
	.4byte	0xa3
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x637
	.byte	0x16
	.4byte	0xa3
	.4byte	0x66f
	.byte	0x17
	.4byte	0x4a1
	.byte	0x17
	.4byte	0x144
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x65b
	.byte	0xb
	.4byte	0x66
	.4byte	0x685
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0xb
	.4byte	0x66
	.4byte	0x695
	.byte	0xc
	.4byte	0x4c
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x124
	.byte	0x18
	.4byte	0x340
	.byte	0x1c
	.4byte	.LASF94
	.byte	0xc
	.byte	0x6
	.2byte	0x128
	.byte	0x8
	.4byte	0x6db
	.byte	0x1a
	.4byte	.LASF27
	.byte	0x6
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6db
	.byte	0
	.byte	0x1a
	.4byte	.LASF95
	.byte	0x6
	.2byte	0x12b
	.byte	0x7
	.4byte	0xa3
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6e1
	.byte	0x8
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x6a2
	.byte	0x12
	.byte	0x4
	.4byte	0x695
	.byte	0x1c
	.4byte	.LASF97
	.byte	0xe
	.byte	0x6
	.2byte	0x144
	.byte	0x8
	.4byte	0x720
	.byte	0x1a
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x145
	.byte	0x12
	.4byte	0x720
	.byte	0
	.byte	0x1a
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x146
	.byte	0x12
	.4byte	0x720
	.byte	0x6
	.byte	0x1a
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x147
	.byte	0x12
	.4byte	0x74
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x74
	.4byte	0x730
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0x1d
	.byte	0xd0
	.byte	0x6
	.2byte	0x285
	.byte	0x7
	.4byte	0x845
	.byte	0x1a
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x287
	.byte	0x18
	.4byte	0x4c
	.byte	0
	.byte	0x1a
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x288
	.byte	0x12
	.4byte	0x5f5
	.byte	0x4
	.byte	0x1a
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x289
	.byte	0x10
	.4byte	0x845
	.byte	0x8
	.byte	0x1a
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x28a
	.byte	0x17
	.4byte	0x1da
	.byte	0x24
	.byte	0x1a
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x28b
	.byte	0xf
	.4byte	0xa3
	.byte	0x48
	.byte	0x1a
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x28c
	.byte	0x2c
	.4byte	0x9c
	.byte	0x50
	.byte	0x1a
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x6e7
	.byte	0x58
	.byte	0x1a
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x28e
	.byte	0x16
	.4byte	0x138
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x138
	.byte	0x70
	.byte	0x1a
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x138
	.byte	0x78
	.byte	0x1a
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x291
	.byte	0x10
	.4byte	0x855
	.byte	0x80
	.byte	0x1a
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x292
	.byte	0x10
	.4byte	0x865
	.byte	0x88
	.byte	0x1a
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x293
	.byte	0xf
	.4byte	0xa3
	.byte	0xa0
	.byte	0x1a
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x294
	.byte	0x16
	.4byte	0x138
	.byte	0xa4
	.byte	0x1a
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x295
	.byte	0x16
	.4byte	0x138
	.byte	0xac
	.byte	0x1a
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x296
	.byte	0x16
	.4byte	0x138
	.byte	0xb4
	.byte	0x1a
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x297
	.byte	0x16
	.4byte	0x138
	.byte	0xbc
	.byte	0x1a
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x298
	.byte	0x16
	.4byte	0x138
	.byte	0xc4
	.byte	0x1a
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x299
	.byte	0x8
	.4byte	0xa3
	.byte	0xcc
	.byte	0
	.byte	0xb
	.4byte	0x5fb
	.4byte	0x855
	.byte	0xc
	.4byte	0x4c
	.byte	0x19
	.byte	0
	.byte	0xb
	.4byte	0x5fb
	.4byte	0x865
	.byte	0xc
	.4byte	0x4c
	.byte	0x7
	.byte	0
	.byte	0xb
	.4byte	0x5fb
	.4byte	0x875
	.byte	0xc
	.4byte	0x4c
	.byte	0x17
	.byte	0
	.byte	0x1d
	.byte	0xf0
	.byte	0x6
	.2byte	0x29e
	.byte	0x7
	.4byte	0x89c
	.byte	0x1a
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x89c
	.byte	0
	.byte	0x1a
	.4byte	.LASF121
	.byte	0x6
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8ac
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	0x33a
	.4byte	0x8ac
	.byte	0xc
	.4byte	0x4c
	.byte	0x1d
	.byte	0
	.byte	0xb
	.4byte	0x4c
	.4byte	0x8bc
	.byte	0xc
	.4byte	0x4c
	.byte	0x1d
	.byte	0
	.byte	0x1e
	.byte	0xf0
	.byte	0x6
	.2byte	0x283
	.byte	0x3
	.4byte	0x8e1
	.byte	0x1f
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x29a
	.byte	0xb
	.4byte	0x730
	.byte	0x1f
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x875
	.byte	0
	.byte	0xb
	.4byte	0x5fb
	.4byte	0x8f1
	.byte	0xc
	.4byte	0x4c
	.byte	0x18
	.byte	0
	.byte	0x20
	.4byte	.LASF143
	.byte	0x12
	.byte	0x4
	.4byte	0x8f1
	.byte	0x21
	.4byte	0x907
	.byte	0x17
	.4byte	0x4a1
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x8fc
	.byte	0x12
	.byte	0x4
	.4byte	0x1c4
	.byte	0x21
	.4byte	0x91e
	.byte	0x17
	.4byte	0xa3
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x924
	.byte	0x12
	.byte	0x4
	.4byte	0x913
	.byte	0xb
	.4byte	0x695
	.4byte	0x93a
	.byte	0xc
	.4byte	0x4c
	.byte	0x2
	.byte	0
	.byte	0x22
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x333
	.byte	0x17
	.4byte	0x4a1
	.byte	0x22
	.4byte	.LASF124
	.byte	0x6
	.2byte	0x334
	.byte	0x1d
	.4byte	0x4a7
	.byte	0x6
	.4byte	.LASF125
	.byte	0x8
	.byte	0x30
	.byte	0x14
	.4byte	0x82
	.byte	0x23
	.4byte	.LASF126
	.byte	0x9
	.byte	0x9a
	.byte	0xd
	.4byte	0x7b
	.byte	0x23
	.4byte	.LASF127
	.byte	0x9
	.byte	0x9b
	.byte	0xc
	.4byte	0xa3
	.byte	0xb
	.4byte	0x5f5
	.4byte	0x988
	.byte	0xc
	.4byte	0x4c
	.byte	0x1
	.byte	0
	.byte	0x23
	.4byte	.LASF128
	.byte	0x9
	.byte	0x9e
	.byte	0xe
	.4byte	0x978
	.byte	0x23
	.4byte	.LASF129
	.byte	0xa
	.byte	0x67
	.byte	0xe
	.4byte	0x5f5
	.byte	0xd
	.byte	0xc
	.byte	0xb
	.byte	0x16
	.byte	0x9
	.4byte	0x9cf
	.byte	0x11
	.string	"c"
	.byte	0xb
	.byte	0x17
	.byte	0xb
	.4byte	0x53
	.byte	0
	.byte	0x11
	.string	"pin"
	.byte	0xb
	.byte	0x18
	.byte	0x9
	.4byte	0xa3
	.byte	0x4
	.byte	0xe
	.4byte	.LASF130
	.byte	0xb
	.byte	0x19
	.byte	0x9
	.4byte	0x9cf
	.byte	0x8
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x2
	.4byte	.LASF131
	.byte	0x6
	.4byte	.LASF132
	.byte	0xb
	.byte	0x1a
	.byte	0x3
	.4byte	0x9a0
	.byte	0xb
	.4byte	0x9d6
	.4byte	0x9f2
	.byte	0xc
	.4byte	0x4c
	.byte	0x3
	.byte	0
	.byte	0x24
	.4byte	.LASF133
	.byte	0x1
	.byte	0xa
	.byte	0xd
	.4byte	0x9e2
	.byte	0x5
	.byte	0x3
	.4byte	LEDS
	.byte	0x24
	.4byte	.LASF134
	.byte	0x1
	.byte	0x12
	.byte	0xd
	.4byte	0x9e2
	.byte	0x5
	.byte	0x3
	.4byte	BUTTON
	.byte	0x25
	.4byte	.LASF135
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0xa44
	.byte	0x26
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x27
	.string	"i"
	.byte	0x1
	.byte	0x35
	.byte	0xe
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LASF136
	.byte	0x1
	.byte	0x27
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xa68
	.byte	0x29
	.string	"c"
	.byte	0x1
	.byte	0x27
	.byte	0x17
	.4byte	0x53
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x25
	.4byte	.LASF137
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xa9d
	.byte	0x2a
	.4byte	.LASF138
	.byte	0x1
	.byte	0x1f
	.byte	0x15
	.4byte	0xa9d
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x2b
	.4byte	.LASF139
	.byte	0x1
	.byte	0x20
	.byte	0x9
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x12
	.byte	0x4
	.4byte	0x9cf
	.byte	0x2c
	.4byte	.LASF144
	.byte	0x1
	.byte	0x15
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.byte	0x26
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x27
	.string	"i"
	.byte	0x1
	.byte	0x16
	.byte	0xe
	.4byte	0xa3
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
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
	.byte	0x25
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x27
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x5
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2c
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
	.byte	0x97,0x42
	.byte	0x19
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
.LASF44:
	.string	"_dso_handle"
.LASF52:
	.string	"_size"
.LASF134:
	.string	"BUTTON"
.LASF97:
	.string	"_rand48"
.LASF76:
	.string	"_emergency"
.LASF127:
	.string	"_daylight"
.LASF66:
	.string	"_data"
.LASF132:
	.string	"pin_mapping"
.LASF117:
	.string	"_wcrtomb_state"
.LASF118:
	.string	"_wcsrtombs_state"
.LASF13:
	.string	"long long unsigned int"
.LASF56:
	.string	"_lbfsize"
.LASF143:
	.string	"__locale_t"
.LASF115:
	.string	"_mbrtowc_state"
.LASF128:
	.string	"_tzname"
.LASF110:
	.string	"_wctomb_state"
.LASF33:
	.string	"__tm_sec"
.LASF12:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF62:
	.string	"_ubuf"
.LASF51:
	.string	"_base"
.LASF35:
	.string	"__tm_hour"
.LASF91:
	.string	"__sf"
.LASF42:
	.string	"_on_exit_args"
.LASF57:
	.string	"_cookie"
.LASF90:
	.string	"__sglue"
.LASF8:
	.string	"long int"
.LASF54:
	.string	"_flags"
.LASF46:
	.string	"_is_cxa"
.LASF72:
	.string	"_stdin"
.LASF139:
	.string	"input"
.LASF64:
	.string	"_blksize"
.LASF2:
	.string	"YELLOW"
.LASF86:
	.string	"_cvtbuf"
.LASF65:
	.string	"_offset"
.LASF116:
	.string	"_mbsrtowcs_state"
.LASF114:
	.string	"_mbrlen_state"
.LASF43:
	.string	"_fnargs"
.LASF49:
	.string	"_fns"
.LASF10:
	.string	"__uint32_t"
.LASF29:
	.string	"_sign"
.LASF26:
	.string	"_flock_t"
.LASF74:
	.string	"_stderr"
.LASF31:
	.string	"_Bigint"
.LASF105:
	.string	"_gamma_signgam"
.LASF142:
	.string	"/home/crappyalgorithm/embedded/workspace/senso_game"
.LASF58:
	.string	"_read"
.LASF82:
	.string	"_result_k"
.LASF32:
	.string	"__tm"
.LASF3:
	.string	"unsigned int"
.LASF20:
	.string	"__wchb"
.LASF130:
	.string	"active"
.LASF73:
	.string	"_stdout"
.LASF85:
	.string	"_cvtlen"
.LASF11:
	.string	"long unsigned int"
.LASF55:
	.string	"_file"
.LASF95:
	.string	"_niobs"
.LASF137:
	.string	"get_input"
.LASF7:
	.string	"short unsigned int"
.LASF88:
	.string	"_atexit0"
.LASF112:
	.string	"_signal_buf"
.LASF103:
	.string	"_asctime_buf"
.LASF71:
	.string	"_errno"
.LASF81:
	.string	"_result"
.LASF19:
	.string	"__wch"
.LASF15:
	.string	"wint_t"
.LASF67:
	.string	"_lock"
.LASF69:
	.string	"_flags2"
.LASF59:
	.string	"_write"
.LASF38:
	.string	"__tm_year"
.LASF121:
	.string	"_nmalloc"
.LASF136:
	.string	"toggle_led"
.LASF14:
	.string	"long double"
.LASF120:
	.string	"_nextf"
.LASF37:
	.string	"__tm_mon"
.LASF47:
	.string	"_atexit"
.LASF129:
	.string	"suboptarg"
.LASF79:
	.string	"__sdidinit"
.LASF16:
	.string	"_off_t"
.LASF84:
	.string	"_freelist"
.LASF126:
	.string	"_timezone"
.LASF25:
	.string	"_LOCK_RECURSIVE_T"
.LASF131:
	.string	"_Bool"
.LASF5:
	.string	"unsigned char"
.LASF140:
	.string	"GNU C17 8.3.0 -march=rv32imac -mabi=ilp32 -mcmodel=medlow -g -Os -O0 -fno-builtin-printf"
.LASF87:
	.string	"_new"
.LASF119:
	.string	"_h_errno"
.LASF6:
	.string	"short int"
.LASF40:
	.string	"__tm_yday"
.LASF50:
	.string	"__sbuf"
.LASF96:
	.string	"_iobs"
.LASF93:
	.string	"__FILE"
.LASF23:
	.string	"_mbstate_t"
.LASF53:
	.string	"__sFILE"
.LASF68:
	.string	"_mbstate"
.LASF106:
	.string	"_rand_next"
.LASF108:
	.string	"_mblen_state"
.LASF75:
	.string	"_inc"
.LASF48:
	.string	"_ind"
.LASF78:
	.string	"_locale"
.LASF80:
	.string	"__cleanup"
.LASF77:
	.string	"_unspecified_locale_info"
.LASF28:
	.string	"_maxwds"
.LASF70:
	.string	"_reent"
.LASF98:
	.string	"_seed"
.LASF21:
	.string	"__count"
.LASF22:
	.string	"__value"
.LASF60:
	.string	"_seek"
.LASF123:
	.string	"_impure_ptr"
.LASF17:
	.string	"_fpos_t"
.LASF9:
	.string	"color"
.LASF92:
	.string	"char"
.LASF34:
	.string	"__tm_min"
.LASF1:
	.string	"BLUE"
.LASF0:
	.string	"GREEN"
.LASF99:
	.string	"_mult"
.LASF27:
	.string	"_next"
.LASF102:
	.string	"_strtok_last"
.LASF45:
	.string	"_fntypes"
.LASF100:
	.string	"_add"
.LASF24:
	.string	"__ULong"
.LASF113:
	.string	"_getdate_err"
.LASF124:
	.string	"_global_impure_ptr"
.LASF125:
	.string	"uint32_t"
.LASF135:
	.string	"toggle_all_led"
.LASF144:
	.string	"init_gpio"
.LASF101:
	.string	"_unused_rand"
.LASF133:
	.string	"LEDS"
.LASF138:
	.string	"pressed"
.LASF30:
	.string	"_wds"
.LASF39:
	.string	"__tm_wday"
.LASF94:
	.string	"_glue"
.LASF18:
	.string	"_ssize_t"
.LASF111:
	.string	"_l64a_buf"
.LASF89:
	.string	"_sig_func"
.LASF63:
	.string	"_nbuf"
.LASF122:
	.string	"_unused"
.LASF41:
	.string	"__tm_isdst"
.LASF104:
	.string	"_localtime_buf"
.LASF141:
	.string	"src/gpio.c"
.LASF61:
	.string	"_close"
.LASF107:
	.string	"_r48"
.LASF109:
	.string	"_mbtowc_state"
.LASF83:
	.string	"_p5s"
.LASF36:
	.string	"__tm_mday"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
