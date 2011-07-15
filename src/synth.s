#include  "defines.h"
.arm
.align
.text

.global keyCheckSynth
.global displayData

notePlay:
	push  {r0-r12,lr}
	ldr   r0,[r6,r4]    @@ set key used flag
	cmp   r0,#1
	beq   notePlayExit
	mov   r0,#1
	str   r0,[r6,r4]
	ldr   r7,=soundRegUsage   @@ holds info about what sound registers are used
	ldrh  r0,[r7]
	eors  r0, r0, #1
	strh  r0,[r7]
        ldrh   r5, [r5, r4]        @ Load Note
	
	ldreq r1,=REG_SOUND1CNT_H
	ldrne r1,=REG_SOUND2CNT_L
	ldr   r2,=notesettings
	ldrh  r3,[r2]
	strh  r3,[r1]
	ldreq r1,=REG_SOUND1CNT_X
	ldrne r1,=REG_SOUND2CNT_H
	ldrh  r3, [r2,#2]       @ get note settings
	mov   r0, r5				      
	orr   r0, r3, r5
	ldrh  r3,[r2,#4]
	cmp   r3,#0
	orrne r0,r0,#0b100000000000000
	str   r0,[r1]

notePlayExit:
	pop   {r0-r12,lr}
	bx    lr
  

keyClear:
  push  {r0-r12,lr}
  mov   r0,#0
  str   r0,[r6,r4]
  pop   {r0-r12,lr}
  bx  lr
  
@@@@@@@@
@
@ r4=offset for keystates and notes
@
@@@@@@@@
keyCheckSynth:             @ Load keycheck routine and also call respective handlers
  push  {r0-r12,lr}           @ Save link reg
  ldr r0, =KEYINPUT 
  ldr r1, [r0]
  
  ldr r6,=keystates
  bl  getScale

@@@ setup
  ands r0,r1,#0b100
  beq settingChange

@@@ Play Notes
  mov r4, #0                    @ keystates offset for key
  ands r0, r1, #0b1000000000    @ AND key L
  blne  keyClear
  bleq  notePlay
  mov r4, #4                    @ keystates offset for key
  ands r0, r1, #0b100000        @ AND key left
  blne  keyClear
  bleq  notePlay
  mov r4, #8                    @ keystates offset for key 
  ands r0, r1, #0b10000000      @ AND key down
  blne  keyClear
  bleq  notePlay
  mov r4, #12                   @ keystates offset for key 
  ands r0, r1, #0b10000         @ AND key right
  blne  keyClear
  bleq  notePlay
  mov r4, #16                   @ keystates offset for key 
  ands r0, r1, #0b1000000       @ AND key up
  blne  keyClear
  bleq  notePlay
  mov r4, #20                   @ keystates offset for key 
  ands r0, r1, #0b10            @ AND key B
  blne  keyClear
  bleq  notePlay
  mov r4, #24                   @ keystates offset for key 
  ands r0, r1, #0b1             @ AND key A
  blne  keyClear
  bleq  notePlay
  mov r4, #28                   @ keystates offset for key 
  ands r0, r1, #0b100000000     @ AND key R
  blne  keyClear
  bleq  notePlay
  pop {r0-r12,lr}             @ Recover link reg
  bx  lr

@@ While Select is held settings can be changed
settingChange: 
  ldr r0,=0b1100000100
  ands r0,r1,r0		  @ A+B+start+select = Reset
  swieq 0x00000
 
  mov r4, #36
  ands r0, r1, #0b1		@ A = toggle Major/Minor
  blne keyClear
  bleq toggleMajMin 

  mov r4, #16
  ands r0, r1, #0b1000000           @ AND key up
  blne  keyClear
  bleq  octaveUp
  mov r4, #8
  ands r0, r1, #0b10000000	@  AND key down
  blne  keyClear
  bleq  octaveDown
  mov r4, #12
  ands r0, r1, #0b10000          @ AND key right
  blne  keyClear
  bleq  musicalkeyUp
  mov r4, #4
  ands r0, r1, #0b100000          @ AND key left
  blne  keyClear
  bleq  musicalkeyDown
  pop {r0-r12,lr}             @ Recover link reg
  bx  lr

toggleMajMin:		@ toggle major minor flag
  push {r0-r12,lr}
  ldr r0,[r6,r4]    @ Checks if held
        cmp r0,#1
        bxeq  lr
        mov r0,#1
        str r0,[r6,r4]
  ldr r0,=key
  ldr r1,[r0,#4]
  cmp r1,#0
  moveq r1,#1
  movne r1,#0
  str r1,[r0,#4]
  pop {r0-r12,lr}

getScale:
  push  {r0-r4,r6-r12,lr}
  ldr r0,=key		@ load address of key variable
  ldr r0,[r0,#4]	@ load maj/min flag
  cmp r0,#0		@ 0 = major
  beq getMajScale	@ branch to getMajScale if ==
  bne getMinScale	@ branch to getMinSvale otherwise

getMajScale:
  ldr r0, =key
  ldr r1, [r0]
  cmp r1, #0		@ if r1 = 0 get Cmaj
  bleq getCmaj
  cmp r1, #1		@ if r1 = 1 get Gmaj
  bleq getGmaj
  cmp r1, #2		@ Dmaj
  bleq getDmaj
  cmp r1, #3            @ Amaj
  bleq getAmaj
  cmp r1, #4            @ Emaj
  bleq getEmaj
  cmp r1, #5            @ Bmaj
  bleq getBmaj
  cmp r1, #6            @ F#maj
  bleq getFsharpmaj
  cmp r1, #7            @ C#maj
  bleq getCsharpmaj
  cmp r1, #8            @ Fmaj
  bleq getFmaj
  cmp r1, #9            @ Bflatmaj
  bleq getBflatmaj
  cmp r1, #10           @ Eflatmaj
  bleq getEflatmaj
  cmp r1, #11           @ Aflatmaj
  bleq getAflatmaj
  cmp r1, #12           @ Dflatmaj
  bleq getDflatmaj
  cmp r1, #13           @ Gflatmaj
  bleq getGflatmaj
  cmp r1, #14           @ Cflatmaj
  bleq getCflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr

getMinScale:
  ldr r0, =key
  ldr r1, [r0]
  cmp r1, #0            @ if r1 = 0 get Amin
  bleq getAmin
  cmp r1, #1            @ if r1 = 1 get Emin
  bleq getEmin
  cmp r1, #2            @ Bmin
  bleq getBmin
  cmp r1, #3            @ F#min
  bleq getFsharpmin
  cmp r1, #4            @ C#min
  bleq getCsharpmin
  cmp r1, #5            @ G#min
  bleq getGsharpmin
  cmp r1, #6            @ D#min
  bleq getDsharpmin
  cmp r1, #7            @ A#min
  bleq getAsharpmin
  cmp r1, #8            @ Dmin
  bleq getDmin
  cmp r1, #9            @ Gmin
  bleq getGmin
  cmp r1, #10           @ Cmin
  bleq getCmin
  cmp r1, #11           @ Fmin
  bleq getFmin
  cmp r1, #12           @ Bbmin
  bleq getBflatmin
  cmp r1, #13           @ Eflatmin
  bleq getEflatmin
  cmp r1, #14           @ Abmin
  bleq getAflatmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr

@@ Major Scale Loads
getCmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Cmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Cmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Cmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Cmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Cmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getGmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Gmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Gmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Gmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Gmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Gmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getDmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Dmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Dmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Dmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Dmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Dmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr 
getAmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Amaj
  cmp r1, #3
  ldreq r5, =notesOct3_Amaj
  cmp r1, #4
  ldreq r5, =notesOct4_Amaj
  cmp r1, #5
  ldreq r5, =notesOct5_Amaj
  cmp r1, #6
  ldreq r5, =notesOct6_Amaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getEmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Emaj
  cmp r1, #3
  ldreq r5, =notesOct3_Emaj
  cmp r1, #4
  ldreq r5, =notesOct4_Emaj
  cmp r1, #5
  ldreq r5, =notesOct5_Emaj
  cmp r1, #6
  ldreq r5, =notesOct6_Emaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getBmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Bmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Bmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Bmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Bmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Bmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getFsharpmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Fsharpmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Fsharpmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Fsharpmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Fsharpmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Fsharpmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getCsharpmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Csharpmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Csharpmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Csharpmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Csharpmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Csharpmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getFmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Fmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Fmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Fmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Fmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Fmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getBflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Bflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Bflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Bflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Bflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Bflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getEflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Eflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Eflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Eflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Eflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Eflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getAflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Aflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Aflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Aflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Aflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Aflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getDflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Dflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Dflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Dflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Dflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Dflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getGflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Gflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Gflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Gflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Gflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Gflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getCflatmaj:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Cflatmaj
  cmp r1, #3
  ldreq r5, =notesOct3_Cflatmaj
  cmp r1, #4
  ldreq r5, =notesOct4_Cflatmaj
  cmp r1, #5
  ldreq r5, =notesOct5_Cflatmaj
  cmp r1, #6
  ldreq r5, =notesOct6_Cflatmaj
  pop   {r0-r4,r6-r12,lr}
  bx  lr
@@ Minor Scale Loads
getAmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Amin
  cmp r1, #3
  ldreq r5, =notesOct3_Amin
  cmp r1, #4
  ldreq r5, =notesOct4_Amin
  cmp r1, #5
  ldreq r5, =notesOct5_Amin
  cmp r1, #6
  ldreq r5, =notesOct6_Amin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getEmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Emin
  cmp r1, #3
  ldreq r5, =notesOct3_Emin
  cmp r1, #4
  ldreq r5, =notesOct4_Emin
  cmp r1, #5
  ldreq r5, =notesOct5_Emin
  cmp r1, #6
  ldreq r5, =notesOct6_Emin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getBmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Bmin
  cmp r1, #3
  ldreq r5, =notesOct3_Bmin
  cmp r1, #4
  ldreq r5, =notesOct4_Bmin
  cmp r1, #5
  ldreq r5, =notesOct5_Bmin
  cmp r1, #6
  ldreq r5, =notesOct6_Bmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getFsharpmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Fsharpmin
  cmp r1, #3
  ldreq r5, =notesOct3_Fsharpmin
  cmp r1, #4
  ldreq r5, =notesOct4_Fsharpmin
  cmp r1, #5
  ldreq r5, =notesOct5_Fsharpmin
  cmp r1, #6
  ldreq r5, =notesOct6_Fsharpmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getCsharpmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Csharpmin
  cmp r1, #3
  ldreq r5, =notesOct3_Csharpmin
  cmp r1, #4
  ldreq r5, =notesOct4_Csharpmin
  cmp r1, #5
  ldreq r5, =notesOct5_Csharpmin
  cmp r1, #6
  ldreq r5, =notesOct6_Csharpmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getGsharpmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Gsharpmin
  cmp r1, #3
  ldreq r5, =notesOct3_Gsharpmin
  cmp r1, #4
  ldreq r5, =notesOct4_Gsharpmin
  cmp r1, #5
  ldreq r5, =notesOct5_Gsharpmin
  cmp r1, #6
  ldreq r5, =notesOct6_Gsharpmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getDsharpmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Dsharpmin
  cmp r1, #3
  ldreq r5, =notesOct3_Dsharpmin
  cmp r1, #4
  ldreq r5, =notesOct4_Dsharpmin
  cmp r1, #5
  ldreq r5, =notesOct5_Dsharpmin
  cmp r1, #6
  ldreq r5, =notesOct6_Dsharpmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getAsharpmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Asharpmin
  cmp r1, #3
  ldreq r5, =notesOct3_Asharpmin
  cmp r1, #4
  ldreq r5, =notesOct4_Asharpmin
  cmp r1, #5
  ldreq r5, =notesOct5_Asharpmin
  cmp r1, #6
  ldreq r5, =notesOct6_Asharpmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getDmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Dmin
  cmp r1, #3
  ldreq r5, =notesOct3_Dmin
  cmp r1, #4
  ldreq r5, =notesOct4_Dmin
  cmp r1, #5
  ldreq r5, =notesOct5_Dmin
  cmp r1, #6
  ldreq r5, =notesOct6_Dmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getGmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Gmin
  cmp r1, #3
  ldreq r5, =notesOct3_Gmin
  cmp r1, #4
  ldreq r5, =notesOct4_Gmin
  cmp r1, #5
  ldreq r5, =notesOct5_Gmin
  cmp r1, #6
  ldreq r5, =notesOct6_Gmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getCmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Cmin
  cmp r1, #3
  ldreq r5, =notesOct3_Cmin
  cmp r1, #4
  ldreq r5, =notesOct4_Cmin
  cmp r1, #5
  ldreq r5, =notesOct5_Cmin
  cmp r1, #6
  ldreq r5, =notesOct6_Cmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getFmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Fmin
  cmp r1, #3
  ldreq r5, =notesOct3_Fmin
  cmp r1, #4
  ldreq r5, =notesOct4_Fmin
  cmp r1, #5
  ldreq r5, =notesOct5_Fmin
  cmp r1, #6
  ldreq r5, =notesOct6_Fmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getBflatmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Bflatmin
  cmp r1, #3
  ldreq r5, =notesOct3_Bflatmin
  cmp r1, #4
  ldreq r5, =notesOct4_Bflatmin
  cmp r1, #5
  ldreq r5, =notesOct5_Bflatmin
  cmp r1, #6
  ldreq r5, =notesOct6_Bflatmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getEflatmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Eflatmin
  cmp r1, #3
  ldreq r5, =notesOct3_Eflatmin
  cmp r1, #4
  ldreq r5, =notesOct4_Eflatmin
  cmp r1, #5
  ldreq r5, =notesOct5_Eflatmin
  cmp r1, #6
  ldreq r5, =notesOct6_Eflatmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr
getAflatmin:
  push  {r0-r4,r6-r12,lr}
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #2
  ldreq r5, =notesOct2_Aflatmin
  cmp r1, #3
  ldreq r5, =notesOct3_Aflatmin
  cmp r1, #4
  ldreq r5, =notesOct4_Aflatmin
  cmp r1, #5
  ldreq r5, =notesOct5_Aflatmin
  cmp r1, #6
  ldreq r5, =notesOct6_Aflatmin
  pop   {r0-r4,r6-r12,lr}
  bx  lr

octaveUp:
  push  {r0-r12,lr}
  ldr r0,[r6,r4]    @ Checks if held
	cmp r0,#1
	bxeq  lr
	mov r0,#1
	str r0,[r6,r4]
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #6        @ if it's already at the highest...
  moveq r1, #3      @ go to lowest
  addne r1, r1, #1
  str   r1,[r0]
  mov r9,r1
  bl saveSettings	@ save to sram
  pop   {r0-r12,lr}
  bx  lr
octaveDown:
  push  {r0-r12,lr}
  ldr r0,[r6,r4]    @ Checks if held
        cmp r0,#1
        bxeq  lr
        mov r0,#1
        str r0,[r6,r4]
  ldr r0, =octave
  ldr r1, [r0]
  cmp r1, #3        @ if it's already at the lowest...
  moveq r1, #6      @ go to highest
  subne r1, r1, #1
  str   r1,[r0]
  mov r9,r1
  bl saveSettings       @ save to sram
  pop   {r0-r12,lr}
  bx  lr
musicalkeyUp:
  push  {r0-r12,lr}
  ldr r0,[r6,r4]    @ Checks if held.
	cmp r0,#1
	bxeq  lr
	mov r0,#1
	str r0,[r6,r4]
  ldr r0, =key
  ldr r1, [r0]
  cmp r1, #14       @ if it's already at the highest...
  moveq r1, #0      @ go to lowest
  addne r1, r1, #1
  str   r1,[r0]
  mov r9,r1
  bl saveSettings	@save to sram
  pop   {r0-r12,lr}
  bx  lr
musicalkeyDown:
  push  {r0-r12,lr}
  ldr r0,[r6,r4]    @ Checks if held.
        cmp r0,#1
        bxeq  lr
        mov r0,#1
        str r0,[r6,r4]
  ldr r0, =key
  ldr r1, [r0]
  cmp r1, #0       @ if it's already at the lowest...
  moveq r1, #14      @ go to highest
  subne r1, r1, #1
  str   r1,[r0]
  mov r9,r1
  bl saveSettings       @save to sram
  pop   {r0-r12,lr}
  bx  lr

displayData:			@ edit synthText to show Key and Oct
	push {r0-r12,lr}

	ldr r0,=key	@ get address of key
	ldr r0,[r0,#4]	@ load maj/min flag
	cmp r0,#0	@ is it major?
	bleq displayKeyMaj	@if it is show the key's base note
	cmp r0,#1
	bleq displayKeyMin	@ else show the minor version

	ldr r4,=synthText
		
	add  r6,r6,#2		@ inc location
	ldr  r0,=octave		@ get address of octave
	ldrh r0,[r0]		@ load octave's content
	add  r0,r0,#48		@ add 0's tile number
	strh r0,[r4,r6]		@ store it
	@@ if key is major display maj
	ldr r0,=key
	ldr r0,[r0,#4]
	cmp r0,#0
	blne displayMin		@ display minor
	bleq displayMaj		@ display major

	pop  {r0-r12,lr}
	bx lr

displayMaj:	@ display "maj" r4 must be address of synthText r6 must be current map index
	push {r0-r5,r7-r12,lr}
	add  r6,r6,#2 		@ load location to place tile
	ldrh r0,=109 		@ load index for 'm'
	strh r0,[r4,r6]		@ change tile map
	add r6,r6,#2
	ldrh r0,=97		@ load index for 'a'
	strh r0,[r4,r6] 	@ change tile map
	add r6,r6,#2
	ldrh r0,=106		@ load index for 'j'
	strh r0,[r4,r6]		@ change tile map
	pop {r0-r5,r7-r12,lr}
	bx lr

displayMin:     @ same as displayMaj
        push {r0-r5,r7-r12,lr}
        add  r6,r6,#2           @ load location to place tile
        ldrh r0,=109            @ load index for 'm'
        strh r0,[r4,r6]         @ change tile map
        add  r6,r6,#2           @ inc location
        ldrh r0,=105            @ load index for 'i'
        strh r0,[r4,r6]         @ change tile map
        add  r6,r6,#2           @ inc location
        ldrh r0,=110            @ load index for 'n'
        strh r0,[r4,r6]         @ change tile map
        pop {r0-r5,r7-r12,lr}
        bx lr

displayKeyMaj:
	push {r0-r5,r7-r12,lr}
	ldr r4,=synthText
	ldr r0,=key
	ldr r0,[r0]
	cmp r0,#0
	ldreqh r0,=67		@ C
	@@ Sharp Key Sigs Major @@
	cmp r0,#1
	ldreqh r0,=71		@ G
	cmp r0,#2
	ldreqh r0,=68		@ Dmaj
        cmp r0,#3
        ldreqh r0,=65           @ Amaj
	cmp r0,#4
	ldreqh r0,=69		@ Emaj
	cmp r0,#5
	ldreqh r0,=66		@ Bmaj
	cmp r0,#6
	ldreqh r0,=70		@ F#maj
	moveq r3,#1		@ sharp flag
	cmp r0,#7
	ldreqh r0,=67		@ C#maj
	moveq r3,#1		@ sharp flag
	@@ Flat Key Sigs Major @@
	cmp r0,#8
	ldreqh r0,=70		@ Fmaj
	cmp r0,#9
	ldreqh r0,=66		@ Bbmaj
	moveq	r3,#2		@ flat flag
	cmp r0,#10
	ldreqh r0,=69		@ Ebmaj
	moveq	r3,#2		@ flat flag
	cmp r0,#11
	ldreqh r0,=65		@ Abmaj
	moveq	r3,#2		@ flat flag
	cmp r0,#12
	ldreqh r0,=68		@ Dbmaj
	moveq	r3,#2		@ flat flag
	cmp r0,#13
	ldreqh r0,=71		@ Gbmaj
	moveq	r3,#2		@ flat flag
	cmp r0,#14
	ldreqh r0,=67		@ Cbmaj
	moveq	r3,#2		@ flat flag
	
	ldr  r6,=1216		@ Store the tile id
	strh r0,[r4,r6]
	
	add r6,r6,#2
	ldrh r0,=32
	strh r0,[r4,r6]
			@@ Display # or b if sharp or flat
	cmp r3,#1	
	ldreqh r0,=128	@@ sharp sign
	streqh r0,[r4,r6]
        cmp r3,#2
        ldreqh r0,=129	@@ flat sign
        streqh r0,[r4,r6]
	pop {r0-r5,r7-r12,lr}
	bx lr

displayKeyMin:
        push {r0-r5,r7-r12,lr}
	ldr r4,=synthText
        ldr r0,=key
        ldr r0,[r0]
        cmp r0,#0
        ldreqh r0,=65           @ A
        @@ Sharp Key Sigs Major @@
        cmp r0,#1
        ldreqh r0,=69           @ E
        cmp r0,#2
        ldreqh r0,=66           @ B
        cmp r0,#3
        ldreqh r0,=70           @ F#
        moveq r3,#1             @ sharp flag
        cmp r0,#4
        ldreqh r0,=67           @ C#
        moveq r3,#1             @ sharp flag
        cmp r0,#5
        ldreqh r0,=71           @ G#
        moveq r3,#1             @ sharp flag
        cmp r0,#6
        ldreqh r0,=68           @ D#
        moveq r3,#1             @ sharp flag
        cmp r0,#7
        ldreqh r0,=65           @ A#
        moveq r3,#1             @ sharp flag
        @@ Flat Key Sigs Major @@
        cmp r0,#8
        ldreqh r0,=68           @ D
        cmp r0,#9
        ldreqh r0,=71           @ G
        cmp r0,#10
        ldreqh r0,=67           @ C
        cmp r0,#11
        ldreqh r0,=70           @ F
        cmp r0,#12
        ldreqh r0,=66           @ Bb
        moveq   r3,#2           @ flat flag
        cmp r0,#13
        ldreqh r0,=69           @ Eb
        moveq   r3,#2           @ flat flag
        cmp r0,#14
        ldreqh r0,=65           @ Ab
        moveq   r3,#2           @ flat flag

	ldr  r6,=1216		@ Store the tile id
	strh r0,[r4,r6]
	
	add r6,r6,#2
	ldrh r0,=32
	strh r0,[r4,r6]
			@@ Display # or b if sharp or flat
	cmp r3,#1	
	ldreqh r0,=128	@@ sharp sign
	streqh r0,[r4,r6]
        cmp r3,#2
        ldreqh r0,=129	@@ flat sign
        streqh r0,[r4,r6]
        pop {r0-r5,r7-r12,lr}
        bx lr

@ vim: syntax=armasm
