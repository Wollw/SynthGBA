.arm
.align
.data

.global notesOct2_Dsharpmin
.global notesOct3_Dsharpmin
.global notesOct4_Dsharpmin
.global notesOct5_Dsharpmin
.global notesOct6_Dsharpmin

#include "../src/defines.h"

.ltorg


notesOct2_Dsharpmin:
  .word   363   @ Ds2
  .word   547   @ Es2
  .word   631   @ F#2
  .word   786   @ G#2
  .word   923   @ A#2
  .word   986   @ B2
  .word   1102   @ C#3
  .word   1205   @ D#3
notesOct3_Dsharpmin:
  .word   1205   @ D#3
  .word   1297   @ E#3
  .word   1340    @ F#3
  .word   1417   @ G#3
  .word   1486   @ A#3
  .word   1517   @ B3
  .word   1575   @ C#4
  .word   1627   @ D#4
notesOct4_Dsharpmin:
  .word   1627   @ D#4
  .word   1673   @ E#4
  .word   1694     @ F#4
  .word   1732   @ G#4
  .word   1767   @ A#4
  .word   0x6F7    @ B4
  .word   1812     @ C#5
  .word   1837   @ D#5
notesOct5_Dsharpmin:
  .word   1837   @ D#5
  .word   1860   @ E#5
  .word   1871    @ F#5
  .word   1890   @ G#5
  .word   1907   @ A#5
  .word   1915    @ B5
  .word   1930    @ C#6
  .word   1943   @ D#6
notesOct6_Dsharpmin:
  .word   1943   @ D#6
  .word   1954   @ E#6
  .word   1959   @ F#6
  .word   1969   @ Gs6
  .word   1978   @ As6
  .word   1982   @ B6
  .word   1989   @ Cs7
  .word   1995   @ Ds7
@ vim: syntax=armasm
