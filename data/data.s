.arm
.align
.data

.global notesettings
.global octave
.global key
.global keystates
.global soundRegUsage
.global setupBit
.global synthText
.global setupText
.global fontBMP
.global fontPAL


#include "../src/defines.h"

.ltorg

octave:
  .word 4     @ current octave

key:
  .word 0	@ 0=C    1=G
  .word 0	@ 0=maj  1=min
  
keystates:
  .word  0 @L
  .word  0 @Left
  .word  0 @Down
  .word  0 @Right
  .word  0 @B
  .word  0 @A
  .word  0 @R
  .word  0 @Select
  .word  0 @Start
  

fontBMP:
  .incbin "../gfx/8x8font.img.bin"
fontPAL:
  .incbin "../gfx/8x8font.pal.bin"

.align 1
synthText:    @@ Map 1
	.ascii	"@@@@@@@ SynthGBA Play @@@@@@@@--"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"Select + Start = maj <-> min  --"
	.ascii	"    Select + L + R = Setup    --"
	.ascii	"Select + <- or -> = Key Change--"
	.ascii	"Select + ^ or v = Octv Change --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
notesettings:
  .hword  0b1111010011111111 @Note Settings 1
  .hword  0b1000000000000000 @Note Settings 2
  .hword  0      	     @ length flag

setupText:    @ Map 0
	.ascii	"@@@@@@@ SynthGBA Setup @@@@@@@--"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"        IIIIMTTTDDLLLLLL      --"
	.ascii	"                              --"
	.ascii	"      0b0000000000000000      --"
	.ascii	"                       ^      --"
	.ascii	"                              --"
	.ascii	"  L = Sound Length            --"
	.ascii	"  D = Wave Duty Cycle         --"
	.ascii	"  T = Envelope Step Time      --"
	.ascii	"  M = Envelope Mode           --"
	.ascii	"  I = Initial Envelope Value  --"
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"   Press Start to begin.      --" 
	.ascii	"                              --"
	.ascii	"                              --"
	.ascii	"L<= Press B to toggle len flag--"
  
setupBit:
  .hword  0b0000000000000001 @ Don't change unless you want the cursor to be offset wrong
soundRegUsage:
  .hword  0
@ vim: syntax=armasm
