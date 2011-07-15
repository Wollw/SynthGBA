#include "defines.h"
.arm
.align
.text

.global main
.global setupLoop
.global synth
.global setup

@ We start by enabling the needed features of the system
main:
	@ Enable Interrupt Handler (used for VBlank)
	bl	isrInit
	@ Enable VBlank Interrupt
	ldr r0,	=DISPSTAT
	ldr r1, =0b1000
	str r1, [r0]
	ldr r0, =IE	
	ldr r1, [r0]
	orr r1, #0b1
	str r1, [r0]
	ldr r0, =IME
	mov r1, #0b10
	str r1, [r0]

	@ Enable Background 2.  This is where everything will be shown.
	ldr r0,	=DISPCNT
	ldr r1,	=BG_2_BUFF
	str r1, [r0]

	@ Enable Programmable Sound Generator (PSG)
	ldr r0,=REG_SOUNDCNT_X	
	ldr r1,=0b10000000
	str r1,[r0]
	@ Turn on channels 1 and 2 at full volume on left and right channels
	ldr r0,=REG_SOUNDCNT_L
	ldrh r1,=0b0011001101110111
	strh r1,[r0]

@ This displays the setup screen where the user can change
@ the sort of sound generated
setup:
	@ Load any saved settings from SRAM
	@ into notesettings variable
	bl	loadSettings
setupLoop:
	@ Update the sound registers in real time
	ldr r1,=REG_SOUND1CNT_H	
	ldr r2,=REG_SOUND2CNT_L	
	ldr r0,=notesettings
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r2]
	
	@ r11 holds the Background map to use
	@ 0 holds the tile data for the setup screen
	mov r11, #0
	bl	updateSetup					 @ Update the visual of the register based on notesettings	

	@ Wait for VBlank Interrupt before we draw
	swi 0x50000

	bl showText
	bl	keyCheckSetup
	
	b setupLoop
	

synth:
	bl	saveSettings
	mov r11,	#1		@ BG map Flag
synthLoop:
	swi 0x50000	 @ wait for vblank software interrupt		
	bl showText
	bl keyCheckSynth
	bl displayData
	b synthLoop

@ vim: syntax=armasm
