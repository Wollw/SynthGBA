.arm
.align
.data

.global notesOct2_Amin
.global notesOct3_Amin
.global notesOct4_Amin
.global notesOct5_Amin
.global notesOct6_Amin

#include "../src/defines.h"

.ltorg

notesOct2_Amin:
  .word   856   @ A2
  .word   986   @ B2
  .word   1046   @ C3
  .word   1046    @ C3
  .word   1155    @ D3
  .word   1253    @ E3
  .word   1297    @ F3
  .word   1379    @ G3
  .word   1452    @ A3
notesOct3_Amin:
  .word   1452    @ A3
  .word   1517    @ B3
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   0x672    @ E4
  .word   0x688    @ F4
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
notesOct4_Amin:
  .word   0x6D6    @ A4
  .word   0x6F7    @ B4
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1849    @ E5
  .word   1860    @ F5
  .word   1881    @ G5
  .word   1899    @ A5
notesOct5_Amin:
  .word   1899    @ A5
  .word   1915    @ B5
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1949    @ E6
  .word   1954    @ F6
  .word   1964    @ G6
  .word   1974    @ A6
notesOct6_Amin:
  .word   1974    @ A6
  .word   1982    @ B6
  .word   1985    @ C7
  .word   1992   @ D7
  .word   1998   @ E7
  .word   2001   @ F7
  .word   2006   @ G7
  .word   2011   @ A7
