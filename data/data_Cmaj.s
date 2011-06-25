.arm
.align
.data

.global notesOct2_Cmaj
.global notesOct3_Cmaj
.global notesOct4_Cmaj
.global notesOct5_Cmaj
.global notesOct6_Cmaj

#include "../src/defines.h"

.ltorg

notesOct2_Cmaj:
  .word   44   @ C2
  .word   263   @ D2
  .word   458   @ E2
  .word   547   @ F2
  .word   711   @ G2
  .word   856   @ A2
  .word   986   @ B2
  .word   1046   @ C3
notesOct3_Cmaj:
  .word   1046    @ C3
  .word   1155    @ D3
  .word   1253    @ E3
  .word   1297    @ F3
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1517    @ B3
  .word   0x60b    @ C4
notesOct4_Cmaj:
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   0x688    @ F4
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1798    @ C5
notesOct5_Cmaj:
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1860    @ F5
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1923    @ C6
notesOct6_Cmaj:
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1954    @ F6
  .word   1964    @ G6
  .word   1974    @ A6
  .word   1982    @ B6
  .word   1985    @ C7
