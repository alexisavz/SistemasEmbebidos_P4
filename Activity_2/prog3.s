@ prog3.s
@   Sum two numbers
@	
@ ---------------------------------------
@   Data Section
@ ---------------------------------------
	
.data
string1: .asciz "\nEnter the first operand:\n"
string2: .asciz "\nEnter the second operand:\n"
string3: .asciz "\nThe result of %d + %d  is: %d\n"
@								R1    R2      R3
format:	.asciz	"%d"
n:	.int	0	
m:  .int    0
x:  .int    0

@ ---------------------------------------
@   Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf

main:
@ PRIMER PROMPT
	push 	{ip, lr}	@ push return address + dummy register
						@ for alignment

	ldr	r0, =string1	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =n			@ string and address of n in r0, and r1,			
	bl	scanf			@ respectively.


@ SEGUNDO PROMPT 

	ldr	r0, =string2	@ print the prompt
	bl	printf

	ldr r0, =format		@ call scanf, and pass address of format
	ldr	r1, =m   		@ string and address of n in r0, and r1,
	bl	scanf			@ respectively.

@ SUMA 
	Ldr r1, =n        @ print num formatted by output string.
    Ldr r1, [r1]
    Ldr r2, =m        @ print num formatted by output string.
    Ldr r2, [r2]
	add	r3, r1, r2      @ r4 = r2+r3

@ TERCER PROMPT CON RESULTADO
    ldr r0, =string3
    bl  printf    

    pop {ip, pc}

