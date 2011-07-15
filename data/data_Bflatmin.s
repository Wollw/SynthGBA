.arm
.align
.data

.global notesOct2_Bflatmin
.global notesOct3_Bflatmin
.global notesOct4_Bflatmin
.global notesOct5_Bflatmin
.global notesOct6_Bflatmin

#include "../src/defines.h"

.ltorg

notesOct2_Bflatmin:
  .word   923   @ Bb2
  .word   1046    @ C3
  .word   1102   @ Db3
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1340   @ Gb3
  .word   1417   @ Ab3
  .word   1486   @ Bb3
notesOct3_Bflatmin:
  .word   1486   @ Bb3
  .word   0x60b    @ C4
  .word   1575   @ Db4
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   1694   @ Gb4
  .word   1732   @ Ab4
  .word   1767   @ Bb4
notesOct4_Bflatmin:
  .word   1767   @ Bb4
  .word   1798    @ C5
  .word   1812   @ Db5
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1871   @ Gb5
  .word   1890   @ Ab5
  .word   1907   @ Bb5
notesOct5_Bflatmin:
  .word   1907   @ Bb5
  .word   1923    @ C6
  .word   1930   @ Db6
  .word   1943   @ Eb6
  .word   1954   @ F6
  .word   1959   @ Gb6
  .word   1969   @ Ab6
  .word   1978   @ Bb6
notesOct6_Bflatmin:
  .word   1978   @ Bb6
  .word   1985   @ C7
  .word   1989   @ Db7
  .word   1995   @ Eb7
  .word   2001   @ F7
  .word   2004   @ Gb7
  .word   2009   @ Ab7
  .word   2013   @ Bb7
@ vim: syntax=armasm
