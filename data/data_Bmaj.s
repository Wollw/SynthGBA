.arm
.align
.data

.global notesOct2_Bmaj
.global notesOct3_Bmaj
.global notesOct4_Bmaj
.global notesOct5_Bmaj
.global notesOct6_Bmaj

#include "../src/defines.h"

.ltorg


notesOct2_Bmaj:
  .word   986   @ B2
  .word   1102   @ C#3
  .word   1205   @ D#3
  .word   1253    @ E3
  .word   1340    @ F#3
  .word   1417   @ G#3
  .word   1486   @ A#3
  .word   1517   @ B3
notesOct3_Bmaj:
  .word   1517   @ B3
  .word   1575   @ C#4
  .word   1627   @ D#4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   1732   @ G#4
  .word   1767   @ A#4
  .word   0x6F7    @ B4
notesOct4_Bmaj:
  .word   0x6F7    @ B4
  .word   1812     @ C#5
  .word   1837   @ D#5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1890   @ G#5
  .word   1907   @ A#5
  .word   1915    @ B5
notesOct5_Bmaj:
  .word   1915    @ B5
  .word   1930    @ C#6
  .word   1943   @ D#6
  .word   1949    @ E6
  .word   1959   @ F#6
  .word   1969   @ G#6
  .word   1978   @ A#6
  .word   1982   @ B6
notesOct6_Bmaj:
  .word   1982   @ B6
  .word   1989   @ Cs7
  .word   1995   @ Ds7
  .word   1998   @ E7
  .word   2004   @ Fs7
  .word   2009   @ Gs7
  .word   2013   @ As7
  .word   2015   @ B7
@ vim: syntax=armasm
