.arm
.align
.text
#include "defines.h"
.global main
.global setupLoop
.global synth
.global setup
main:
   
  bl  isrInit                @ setup isr process
  mov r0,#DISPCNT
  mov r1,#BG_2_BUFF     @ Enable BG2
  str r1, [r0]               @ / send settings to REG_DISPCNT
  add r0, r0, #0x4          @DISPSTAT Setup
  mov r1, #0x8              @ |
  str r1, [r0]              @ /
  ldr r0, =IE               @Interrupt Enable Setup
  ldr r1, [r0]              @ |
  orr r1, #0x1              @ | VBlank
  str r1, [r0]              @ /
  ldr r0, =IME              @Interrupt Master Enable Setup
  mov r1, #0x1              @ | 
  str r1, [r0]              @ /
  ldr r0,=REG_SOUNDCNT_X    @ Enable Sound 
  ldr r1,=0b10000000	    @ |
  str r1,[r0]		    @ /
  ldr r0,=REG_SOUNDCNT_L      @ Enable Sound Channels 1 and 2
  ldrh r1,=0b0011001101110111 @ | left and right plus max vol on left and right
  strh r1,[r0]		      @ |
  ldr r0,=REG_SOUNDCNT_H      @ |
  ldrh r1,=0b10	   	      @ | output ratio 100%
  strh r1,[r0]		      @ /

setup:
  bl  loadSettings
setupLoop:
	ldr r1,=REG_SOUND1CNT_H	  @ Keep the registers up to date
	ldr r2,=REG_SOUND2CNT_L   @ |
	ldr r0,=notesettings      @ |
	ldrh r0, [r0]             @ |
	strh r0, [r1]             @ |
	strh r0, [r2]             @ /
	
  swi 0x50000   @ wait for vblank software interrupt	
  mov r11,  #0  @ BG map Flag
  bl  updateSetup           @ Update the visual of the register based on notesettings	
  bl showText
  bl  keyCheckSetup
	
  b setupLoop
	

synth:
  bl  saveSettings
  mov r11,  #1    @ BG map Flag
synthLoop:
  swi 0x50000   @ wait for vblank software interrupt		
  bl showText
  bl keyCheckSynth
  bl displayData
  b synthLoop
