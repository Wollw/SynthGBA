.arm
.align
.data

.global notesOct2_Gmaj
.global notesOct3_Gmaj
.global notesOct4_Gmaj
.global notesOct5_Gmaj
.global notesOct6_Gmaj

#include "../src/defines.h"

.ltorg

notesOct2_Gmaj:
  .word   711   @ G2
  .word   856   @ A2
  .word   986   @ B2
  .word   1046   @ C3
  .word   1155   @ D3
  .word   1253   @ E3
  .word   1340   @ Fs3
  .word   1379    @ G3
notesOct3_Gmaj:
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1517    @ B3
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   0x6B2    @ G4
notesOct4_Gmaj:
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1881    @ G5
notesOct5_Gmaj:
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1959    @ F#6
  .word   1964    @ G6
notesOct6_Gmaj:
  .word   1964    @ G6
  .word   1974    @ A6
  .word   1982    @ B6
  .word   1985    @ C7
  .word   1992    @ D7
  .word   1998    @ E7
  .word   2004    @ F#7
  .word   2006    @ G7
