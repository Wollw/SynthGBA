.arm
.align
.data

.global notesOct2_Aflatmaj
.global notesOct3_Aflatmaj
.global notesOct4_Aflatmaj
.global notesOct5_Aflatmaj
.global notesOct6_Aflatmaj

#include "../src/defines.h"

.ltorg

notesOct2_Aflatmaj:
  .word   786   @ Ab2
  .word   923   @ Bb2
  .word   1046    @ C3
  .word   1102   @ Db3
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1379    @ G3
  .word   1417   @ Ab3
notesOct3_Aflatmaj:
  .word   1417   @ Ab3
  .word   1486   @ Bb3
  .word   0x60b    @ C4
  .word   1575   @ Db4
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   0x6B2    @ G4
  .word   1732   @ Ab4
notesOct4_Aflatmaj:
  .word   1732   @ Ab4
  .word   1767   @ Bb4
  .word   1798    @ C5
  .word   1812   @ Db5
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1881    @ G5
  .word   1890   @ Ab5
notesOct5_Aflatmaj:
  .word   1890   @ Ab5
  .word   1907   @ Bb5
  .word   1923    @ C6
  .word   1930   @ Db6
  .word   1943   @ Eb6
  .word   1954   @ F6
  .word   1964   @ G6
  .word   1969   @ Ab6
notesOct6_Aflatmaj:
  .word   1969   @ Ab6
  .word   1978   @ Bb6
  .word   1985   @ C7
  .word   1989   @ Db7
  .word   1995   @ Eb7
  .word   2001   @ F7
  .word   2006   @ G7
  .word   2009   @ Ab7
@ vim: syntax=armasm
