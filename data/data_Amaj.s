.arm
.align
.data

.global notesOct2_Amaj
.global notesOct3_Amaj
.global notesOct4_Amaj
.global notesOct5_Amaj
.global notesOct6_Amaj

#include "../src/defines.h"

.ltorg


notesOct2_Amaj:
  .word   856   @ A2
  .word   986   @ B2
  .word   1102   @ C#3
  .word   1155    @ D3
  .word   1253    @ E3
  .word   1340    @ F#3
  .word   1417   @ G#3
  .word   1452    @ A3
notesOct3_Amaj:
  .word   1452    @ A3
  .word   1517   @ B3
  .word   1575   @ C#4
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   1732   @ G#4
  .word   0x6D6    @ A4
notesOct4_Amaj:
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1812     @ C#5
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1890   @ G#5
  .word   1899    @ A5
notesOct5_Amaj:
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1930    @ C#6
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1959    @ F#6
  .word   1969   @ G#6
  .word   1974    @ A6
notesOct6_Amaj:
  .word   1974    @ A6
  .word   1982   @ B6
  .word   1989   @ C#7
  .word   1992   @ D7
  .word   1998   @ E7
  .word   2004   @ F#7
  .word   2009   @ G#7
  .word   2011   @ A7

@ vim: syntax=armasm
