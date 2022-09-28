@--------------------------------------
	.data
	.balign 4
y: .word
a: .word 0xAAAAAAAA
b: .word 0xBBBBBBBB
c: .word 0xCCCCCCCC
string: .asciz "\n VALOR %d en REGISTRO %x\n"

.text
.global main
.extern printf

main:	push {ip, lr}

@ First Method ---------------------------------------------------------------------

	ldr r0 =y
	ldr r1 =a
	ldr r0 [r0]
	ldr r0 [r1]
	ldr r0 =string
	ldr r2 =y
	ldr r1 [r2]
	bl printf

@----------------------------------------------------------------------------------
@ Second Method--------------------------------------------------------------------

	ldr r1 =c
	ldr r0 =y
	ldr r1 [r1]
	str r1 [r0]
	ldr r0 =string
	ldr r2 =y
	ldr r1 [r2]
	bl printf

@-----------------------------------------------------------------------------------
@ Third Method----------------------------------------------------------------------

	ldr r1 =b
	ldr r1 [r1]
	ldr r0 =y
	str r0 [r1]
	ldr r0 =string
	ldr r2 =y
	ldr r1 [r2]
	bl printf
	
	pop {ip, pc}










