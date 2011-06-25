.arm
.align
.data

.global notesOct2_Emin
.global notesOct3_Emin
.global notesOct4_Emin
.global notesOct5_Emin
.global notesOct6_Emin

#include "../src/defines.h"

.ltorg

notesOct2_Emin:
  .word   458   @ E2
  .word   631   @ Fs2
  .word   711   @ G2
  .word   856   @ A2
  .word   986   @ B2
  .word   1046   @ C3
  .word   1155   @ D3
  .word   1253   @ E3
notesOct3_Emin:
  .word   1253   @ E3
  .word   1340   @ Fs3
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1517    @ B3
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   0x672    @ E4
notesOct4_Emin:
  .word   0x672    @ E4
  .word   1694     @ F#4
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1849    @ E5
notesOct5_Emin:
  .word   1849    @ E5
  .word   1871    @ F#5
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1949    @ E6
notesOct6_Emin:
  .word   1949    @ E6
  .word   1959    @ F#6
  .word   1964    @ G6
  .word   1974    @ A6
  .word   1982    @ B6
  .word   1985    @ C7
  .word   1992    @ D7
  .word   1998    @ E7
