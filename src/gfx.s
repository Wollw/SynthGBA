.arm
.align
.text
.global showText
.global updateSetup
#include  "defines.h"

@@
@ r11 = map flag
@@
showText:
  push  {r0-r12,lr}
	mov r0, #PAL_RAM                              @ palette ram base
  ldr r1, =fontPAL                              @ load palette base address
  mov r2, #1                                    @ setup counter
fontPALLoop:                                    @ load actual palette
  ldmia r1!, { r3,r4,r5,r6,r7,r8,r9,r10 }
  stmia r0!, { r3,r4,r5,r6,r7,r8,r9,r10 }
  subs r2, r2, #1
  bne fontPALLoop
  ldr r0, =VRAM                                 @ vram base
  ldr r1, =fontBMP                              @ load picture base address
  mov r2, #0x82                                 @ setup counter
fontBMPLoop:                                    @ load actual tiles
  ldmia r1!, { r3,r4,r5,r6,r7,r8,r9,r10 }
  stmia r0!, { r3,r4,r5,r6,r7,r8,r9,r10 }
  subs r2, r2, #1
  bne fontBMPLoop
textLoad:
  ldr r0, =BG2CNT                   @ point to Background 0 Control
  ldr r1, =0b000001000000000000     @ Map location bit set
  strh  r1, [r0]                    @ store it so it displays
textMap:
  ldr r0, =0x06008000               @ BG2 Map Location we will write to set in textLoad
  cmp r11, #0                       @ Check map flag
  ldreq r1, =setupText              @ Load a map
  ldrne r1, =synthText              @ Load a map
  mov r12,  #1024
textMapLoop:
  ldrh  r3, [r1],#2
  strh  r3, [r0],#2
  subs  r12, r12,#1
  bne textMapLoop
  pop {r0-r12,lr}
  bx lr
  
binaryLocate:                       @ returns address of b in r5
  push  {r0-r4,r6-r12,lr}
  ldr r5, =setupText                @ Load setup bg map
binaryLocateLoop:
  ldrh r0,[r5],#2
  cmp  r0,#98
  bne binaryLocateLoop
  sub r5, r5, #2
  pop   {r0-r4,r6-r12,lr}
  bx  lr

updateSetup:          @ updates the bg map to show the correct bits on the screen
  push  {r0-r12,lr}
  ldr  r0, =notesettings
  ldrh  r2,[r0]
  eor   r1, r1, r1
  bl    binaryLocate
  add   r5, r5, #32     @ r5 is bit 0, sub 2 to move down a bit
updateLoop:

  and   r3, r2, #1      @ get bit to test
  mov   r2, r2, ROR #1  @ move r2 to next bit we will need
  tst   r3, #1
  movne r4, #49         @ 49 is the code for "1"
  moveq r4, #48         @ 48 is the code for "0"
  strh  r4, [r5]        @ update the bg map

  sub   r5, r5, #2      @ next entry to update
  add   r1, #1
  cmp   r1, #16
  
  bne updateLoop

  bl displayLengthFlag
  pop   {r0-r12,lr}
  bx  lr
