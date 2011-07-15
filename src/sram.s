@ Code that reads from SRAM should be stored in Work RAM
.section .iwram, "ax", %progbits
#include  "defines.h"
.arm
.align
.text

.global saveSettings
.global loadSettings

@ Save program settings to SRAM byte by byte
saveSettings:
  push  {r0-r12,lr}
  mov   r0, #SRAM
  ldr   r1, =notesettings	@ note setting save
  ldrb  r2, [r1]
  strb  r2, [r0]
  ldrb  r2, [r1, #1]
  strb  r2, [r0, #1]
  ldrb  r2, [r1,#4]
  strb  r2, [r0,#2]
  ldr 	r1, =octave		@ octave save
  ldrb  r2, [r1]
  strb  r2, [r0,#3]
  ldr	r1, =key		@ key save
  ldrb  r2, [r1]
  strb  r2, [r0,#4]
  pop   {r0-r12,lr}
  bx  lr
  
@ Load the program settings from SRAM byte by byte
loadSettings:
  push  {r0-r12,lr}
  mov   r1, #SRAM
  ldr   r0, =notesettings  @ load note settings
  ldrb  r2, [r1]
  strb  r2, [r0]
  ldrb  r2, [r1, #1]
  strb  r2, [r0, #1]
  ldrb  r2, [r1, #2]
  strb  r2, [r0,#4]
 
  ldr	r0, =octave		@ load octave
  ldrb	r2, [r1,#3]
  cmp   r2, #2			@ range check on octave
  movlo r2, #4			@ 
  cmp   r2, #6			@
  movhi r2, #4			@
  strb  r2, [r0]

  ldr	r0, =key		@load key
  ldrb	r2, [r1,#4]
  cmp	r2,#0			@	range check
  movlo r2,#0			@
  cmp	r2,#11			@
  movhi r2,#0			@
  strb 	r2, [r0]
 
  pop   {r0-r12,lr}
  bx  lr

@ vim: syntax=armasm
