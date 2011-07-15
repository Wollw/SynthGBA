#include  "defines.h"
.arm
.align
.text

.global isrInit
.global irqHndlr

@ This lets the system know what to call
@ when an interrupt is encountered
isrInit:
  ldr r0, =ISR_MAIN
  adr r1, irqHandler
  str r1, [r0]
  bx  lr

@ The actual routine called to handle all interrupts
@ the only interrupt in use is the VBlank so we will just handle
@ it and assume that is what is what was triggered
@ I think all this does is re-enable the interrupt.
irqHandler:
  ldr r0, =BIOS_IF  @Interrupt Enable Setup
  ldr r1, [r0]      @ |
  orr r1, #0x1      @ | enable VBlank
  str r1, [r0]      @ /
  ldr r0, =IE       @Interrupt Enable Setup
  ldr r1, [r0]      @ |
  orr r1, #0x1      @ | enable VBlank
  str r1, [r0]      @ /
  bx  lr

@ vim: syntax=armasm
