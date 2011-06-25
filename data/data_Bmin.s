.arm
.align
.data

.global notesOct2_Bmin
.global notesOct3_Bmin
.global notesOct4_Bmin
.global notesOct5_Bmin
.global notesOct6_Bmin

#include "../src/defines.h"

.ltorg

notesOct2_Bmin:
  .word   986   @ B2
  .word   1102   @ Cs3
  .word   1155    @ D3
  .word   1253    @ E3
  .word   1340    @ F#3
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1517    @ B3
notesOct3_Bmin:
  .word   1517    @ B3
  .word   1575    @ C#4
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
notesOct4_Bmin:
  .word   0x6F7    @ B4
  .word   1812     @ C#5
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1915    @ B5
notesOct5_Bmin:
  .word   1915    @ B5
  .word   1930    @ C#6
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1959    @ F#6
  .word   1964    @ G6
  .word   1974    @ A6
  .word   1982    @ B6
notesOct6_Bmin:
  .word   1982    @ B6
  .word   1989    @ C#7
  .word   1992    @ D7
  .word   1998   @ E7
  .word   2004   @ Fs7
  .word   2006   @ G7
  .word   2011   @ A7
  .word   2015   @ B7
