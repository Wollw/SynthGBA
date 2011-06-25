.arm
.align
.text

.global isrInit
.global irqHndlr

#include  "defines.h"

isrInit:
  ldr r0, =ISR_MAIN @What to run as ISR
  adr r1, irqHndlr  @ |
  str r1, [r0]      @ /
  bx  lr

irqHndlr:
  ldr r0, =BIOS_IF  @Interrupt Enable Setup
  ldr r1, [r0]      @ |
  orr r1, #0x1      @ | enable VBlank
  str r1, [r0]      @ /
  ldr r0, =IE       @Interrupt Enable Setup
  ldr r1, [r0]      @ |
  orr r1, #0x1      @ | enable VBlank
  str r1, [r0]      @ /
  bx  lr
