.arm
.align
.data

.global notesOct2_Csharpmin
.global notesOct3_Csharpmin
.global notesOct4_Csharpmin
.global notesOct5_Csharpmin
.global notesOct6_Csharpmin

#include "../src/defines.h"

.ltorg


notesOct2_Csharpmin:
  .word   157   @ Cs2
  .word   363   @ Ds2
  .word   458   @ E2
  .word   631   @ F#2
  .word   786   @ G#2
  .word   856   @ A2
  .word   986   @ B2
  .word   1102   @ C#3
notesOct3_Csharpmin:
  .word   1102   @ C#3
  .word   1205   @ D#3
  .word   1253    @ E3
  .word   1340    @ F#3
  .word   1417   @ G#3
  .word   1452    @ A3
  .word   1517   @ B3
  .word   1575   @ C#4
notesOct4_Csharpmin:
  .word   1575   @ C#4
  .word   1627   @ D#4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   1732   @ G#4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1812     @ C#5
notesOct5_Csharpmin:
  .word   1812     @ C#5
  .word   1837   @ D#5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1890   @ G#5
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1930    @ C#6
notesOct6_Csharpmin:
  .word   1930    @ C#6
  .word   1943   @ D#6
  .word   1949    @ E6
  .word   1959   @ Fs6
  .word   1969   @ Gs6
  .word   1974   @ A6
  .word   1982   @ B6
  .word   1989   @ Cs7
@ vim: syntax=armasm
