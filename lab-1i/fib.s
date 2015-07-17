	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

	@ R4 = R0 - 0 (update flags)
	sub r4, r0, #0

	@ if(R0 <=1 ) goto .L3 (which returns R0)
	cmp r0, #1
	ble .L3

	@ store fibo to r3 and fibo = 1
	mov r3, #1

	@ store fiboPrev to r4 and fiboPrev = 1
	mov r4, #1

	@ for loop, store i to r6 and i = 2
	mov r6, #2

.loop:

	@ r5 = tmp = fibo
	mov r5, r3

	@ fibo += fiboPrev (r3 += r4)
	add r3, r4

	@ fiboPrev = tmp (r4 = r5)
	mov r4, r5

	@ i++
	add r6, #1

	@ if (r6 < r0) goto .loop
	cmp r6, r0
	blt .loop

	@ store result to r0
	mov r0, r3

	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
