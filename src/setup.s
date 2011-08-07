.arm
.align
.text

.global keyCheckSetup
.global displayLengthFlag

#include  "defines.h"

cursorLocate:                       @ returns address of ^ in r5
  push  {r0-r4,r6-r12,lr}
  ldr r5, =setupText                @ Load setup bg map
cursorLocateLoop:
  ldrb r0,[r5],#1
  cmp  r0,#94
  bne cursorLocateLoop
  sub r5, r5, #1
  pop   {r0-r4,r6-r12,lr}
  bx  lr

cursorJump:
  push	{r0-r12}
  
  mov	r0,#14
  strb  r0,[r5]	@ erase cursor
  
  cmp	r4,#4
  addeq	r5,r5,#15 @redraw in proper place
  moveq r2,#0x0001
  subne r5,r5,#15
  movne r2,#0x8000
  mov	r0,#94
  strb	r0,[r5]
  strh  r2,[r1]


  pop	{r0-r12}
  b	cursorMoveExit

cursorMove:
  push  {r0-r12,lr}
	
  bl  keySet          @ marks key as down
  cmp r7, #1
  beq  cursorMoveExit   @ branch if down keeping cursor in place if key is held
  
  @@@ Do cursor processes to move if tests are passed
  bl  cursorLocate    @ returns cursor address in r5

  ldr   r1, =setupBit @ Load setupBit so se can keep track of what bit we're editing
  ldrh  r2, [r1]      @ | and make sure we aren't exceeding bounds
  cmp   r4, #4        @ |
  cmpeq r2, #0x8000   @ |
  beq cursorJump      @ |
  cmp   r4, #12       @ |
  cmpeq r2, #0x0001   @ |
  beq cursorJump      @ /
  
  mov   r0, #16        @ erase current location of ^
  strb  r0, [r5]       @ /
  cmp   r4, #4         @ Draw new position of ^ and keep track of current bit
  subeq r5, r5, #1     @ |
  moveq r2, r2, LSL #1 @ |
  addne r5, r5, #1     @ |
  movne r2, r2, LSR #1 @ |
  mov   r0, #94        @ |
  strb  r0, [r5]       @ |
  strh  r2, [r1]       @ /

  
cursorMoveExit:
	pop {r0-r12,lr}
  bx  lr


flipBit:                 @ changes a 1 to a 0 and a 0 to a 1
  push   {r0-r12,lr}
  
  bl  keySet          @ marks key as down
  cmp r7, #1
  beq  flipBitExit   @ branch if down keeping cursor in place if key is held

  
  ldr   r0, =setupBit     
  ldrh  r0, [r0]         
  ldr   r1, =notesettings
  ldrh  r2, [r1]
  
  eor   r2, r2, r0      @ isolate the bit to flip
  strh  r2, [r1]        @ store it
flipBitExit:
  pop  {r0-r12,lr}
  bx  lr
  
keyClear:
  push  {r0-r12,lr}
  ldr r6,=keystates
  mov r0,#0
  str r0,[r6,r4]
  pop   {r0-r12,lr}
  bx  lr

keySet:      @ marks key as down
  push  {r0-r6,r8-r12,lr}
  ldr r6,=keystates
  ldr r0,[r6,r4]    @@ set key used flag
	cmp r0,#1
	moveq r7,#1
	mov r0,#1
	str r0,[r6,r4]
  pop   {r0-r6,r8-r12,lr}
  bx  lr

@@@@@@@@
@
@ r4=offset for keystates and notes
@
@@@@@@@@
keyCheckSetup:             @ Load keycheck routine and also call respective handlers
  push  {r0-r12,lr}           @ Save link reg
  ldr r0, =KEYINPUT 
  ldrh r1, [r0]

@@@ Change Settings / Move Cursor
  mov r4, #4                    @ keystates offset for key
  ands r0, r1, #0b100000        @ AND key left
  blne  keyClear
  bleq  cursorMove

  mov r4, #12                   @ keystates offset for key 
  ands r0, r1, #0b10000         @ AND key right
  blne  keyClear
  bleq  cursorMove

  mov r4, #24                   @ keystates offset for key 
  ands r0, r1, #0b1             @ AND key A
  blne  keyClear
  bleq  flipBit

@@@ Start 
  mov r4, #36
  ands r0, r1, #0b1000          @ key start
  blne  keyClear
  bleq  keySet
  beq  synth

@@@ Length Flag
  mov r4, #20
  ands r0, r1, #0b10         @ AND key select
  blne  keyClear
  bleq  flipLengthFlag

  
  pop {r0-r12,lr}               @ Recover link reg
  bx  lr

flipLengthFlag:
	push {r0-r12,lr}
	bleq  keySet
	cmp r7,#1
	beq flipLengthFlagExit

	ldr r0,=notesettings  @ Toggle bit
	ldrh r1,[r0,#4]
	cmp r1,#0
	moveq r3,#1
	movne r3,#0
	strh r3,[r0,#4]

	ldr r0,=REG_SOUND1CNT_X
	ldr r2,=REG_SOUND2CNT_H
	ldrh r1,[r0]
	orreq  r1,r1,#0b100000000000000
	eorne  r1,r1,#0b100000000000000
	strh   r1,[r0]
	strh   r1,[r2]
	
	bl displayLengthFlag

flipLengthFlagExit:
	pop  {r0-r12,lr}
	bx lr

displayLengthFlag:
	push {r0-r12,lr}
	ldr r3,=notesettings
	ldrh r3,[r3,#4]
	cmp r3,#0
	ldr r0,=setupText
	ldr r1,=608	@ magic number for length status character in tile map
	ldrneb r2,=76
	ldreqb r2,=32
	strb r2,[r0,r1]
	
	pop  {r0-r12,lr}
	bx lr

@ vim: syntax=armasm
