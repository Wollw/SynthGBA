#include	"defines.h"
.arm
.align
.text
.global showText
.global updateSetup

@@
@ r11 = map flag
@@
showText:
	push	{r0-r10,r12,lr}

	@ Wait for VBlank before we continue
	swi 0x50000

	mov		r0, #PAL_RAM
	ldr		r1, =fontPAL
	mov		r2, #1
@ Load the palette
fontPALLoop:
	ldmia r1!, { r3,r4,r5,r6,r7,r8,r9,r10 }
	stmia r0!, { r3,r4,r5,r6,r7,r8,r9,r10 }
	subs r2, r2, #1
	bne fontPALLoop
	ldr r0, =VRAM	
	ldr r1, =fontBMP
	mov r2, #0x82
@ Load the bitmap
fontBMPLoop:
	ldmia r1!, { r3,r4,r5,r6,r7,r8,r9,r10 }
	stmia r0!, { r3,r4,r5,r6,r7,r8,r9,r10 }
	subs r2, r2, #1
	bne fontBMPLoop

@ prepare to load tile map into VRAM
textLoad:
	ldr r0, =BG2CNT	
	ldr r1, =0b000001000000000000
	strh	r1, [r0]
textMap:
	@ Load the appropriate screen into the Background 2 map
	ldr r0, =0x06008000	@ BG2 Map Location
	@ zero means setup, anything else is the synth
	cmp r11, #0		
	ldreq r1, =setupText
	ldrne r1, =synthText
	mov r12,	#1024
@ Load the tile map into VRAM
textMapLoop:
	ldrb	r3, [r1],#1
	strh	r3, [r0],#2
	subs	r12, r12,#1
	bne textMapLoop
	pop {r0-r10,r12,lr}
	bx lr
	
binaryLocate:											 @ returns address of b in r5
	push	{r0-r4,r6-r12,lr}
	ldr r5, =setupText								@ Load setup bg map
binaryLocateLoop:
	ldrb r0,[r5],#1
	cmp	r0,#98
	bne binaryLocateLoop
	sub r5, r5, #1
	pop	 {r0-r4,r6-r12,lr}
	bx	lr

updateSetup:					@ updates the bg map to show the correct bits on the screen
	push	{r0-r12,lr}
	ldr	r0, =notesettings
	ldrh	r2,[r0]
	eor	 r1, r1, r1
	bl		binaryLocate
	add	 r5, r5, #16		 @ r5 is bit 0, sub 2 to move down a bit
updateLoop:

	and	 r3, r2, #1			@ get bit to test
	mov	 r2, r2, ROR #1	@ move r2 to next bit we will need
	tst	 r3, #1
	movne r4, #49				 @ 49 is the code for "1"
	moveq r4, #48				 @ 48 is the code for "0"
	strb	r4, [r5]				@ update the bg map

	sub	 r5, r5, #1			@ next entry to update
	add	 r1, #1
	cmp	 r1, #16

	bne updateLoop

	bl displayLengthFlag
	pop	 {r0-r12,lr}
	bx	lr

@ vim: syntax=armasm
