.arm
.align
.data

.global notesOct2_Dmaj
.global notesOct3_Dmaj
.global notesOct4_Dmaj
.global notesOct5_Dmaj
.global notesOct6_Dmaj

#include "../src/defines.h"

.ltorg

notesOct2_Dmaj:
  .word   263   @ D2
  .word   458   @ E2
  .word   631   @ Fs2
  .word   711   @ G2
  .word   856   @ A2
  .word   986   @ B2
  .word   1102   @ Cs3
  .word   1155    @ D3
notesOct3_Dmaj:
  .word   1155    @ D3
  .word   1253    @ E3
  .word   1340    @ F#3
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1517    @ B3
  .word   1575    @ C#4
  .word   0x642    @ D4
notesOct4_Dmaj:
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1812     @ C#5
  .word   1825    @ D5
notesOct5_Dmaj:
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1930    @ C#6
  .word   1936    @ D6
notesOct6_Dmaj:
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1959    @ F#6
  .word   1964    @ G6
  .word   1974    @ A6
  .word   1982    @ B6
  .word   1989    @ C#7
  .word   1992    @ D7
