.arm
.align
.data

.global notesOct2_Cmin
.global notesOct3_Cmin
.global notesOct4_Cmin
.global notesOct5_Cmin
.global notesOct6_Cmin

#include "../src/defines.h"

.ltorg

notesOct2_Cmin:
  .word   44   @ C2
  .word   263   @ D2
  .word   363   @ Eb2
  .word   547   @ F2
  .word   711   @ G2
  .word   786   @ Ab2
  .word   923   @ Bb2
  .word   1046    @ C3
notesOct3_Cmin:
  .word   1046    @ C3
  .word   1155    @ D3
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1379    @ G3
  .word   1417   @ Ab3
  .word   1486   @ Bb3
  .word   0x60b    @ C4
notesOct4_Cmin:
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   0x6B2    @ G4
  .word   1732   @ Ab4
  .word   1767   @ Bb4
  .word   1798    @ C5
notesOct5_Cmin:
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1881    @ G5
  .word   1890   @ Ab5
  .word   1907   @ Bb5
  .word   1923    @ C6
notesOct6_Cmin:
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1943   @ Eb6
  .word   1954   @ F6
  .word   1964   @ G6
  .word   1969   @ Ab6
  .word   1978   @ Bb6
  .word   1985   @ C7
@ vim: syntax=armasm
