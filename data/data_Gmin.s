.arm
.align
.data

.global notesOct2_Gmin
.global notesOct3_Gmin
.global notesOct4_Gmin
.global notesOct5_Gmin
.global notesOct6_Gmin

#include "../src/defines.h"

.ltorg

notesOct2_Gmin:
  .word   711   @ G2
  .word   856   @ A2
  .word   923   @ Bb2
  .word   1046    @ C3
  .word   1155    @ D3
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1379    @ G3
notesOct3_Gmin:
  .word   1379    @ G3
  .word   1452    @ A3
  .word   1486   @ Bb3
  .word   0x60b    @ C4
  .word   0x642    @ D4
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   0x6B2    @ G4
notesOct4_Gmin:
  .word   0x6B2    @ G4
  .word   0x6D6    @ A4
  .word   1767   @ Bb4
  .word   1798    @ C5
  .word   1825    @ D5
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1881    @ G5
notesOct5_Gmin:
  .word   1881    @ G5
  .word   1899    @ A5
  .word   1907   @ Bb5
  .word   1923    @ C6
  .word   1936    @ D6
  .word   1943   @ Eb6
  .word   1954    @ F6
  .word   1964   @ G6
notesOct6_Gmin:
  .word   1964   @ G6
  .word   1974   @ A6
  .word   1978   @ Bb6
  .word   1985   @ C7
  .word   1992   @ D7
  .word   1995   @ Eb7
  .word   2001   @ F7
  .word   2006   @ G7
@ vim: syntax=armasm
