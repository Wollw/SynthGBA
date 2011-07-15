.arm
.align
.data

.global notesOct2_Aflatmin
.global notesOct3_Aflatmin
.global notesOct4_Aflatmin
.global notesOct5_Aflatmin
.global notesOct6_Aflatmin

#include "../src/defines.h"

.ltorg

notesOct2_Aflatmin:
  .word   786   @ Ab2
  .word   923   @ Bb2
  .word   986   @ Cb3
  .word   986   @ Cb3
  .word   1102   @ Db3
  .word   1205   @ Eb3
  .word   1253   @ Fb3
  .word   1340   @ Gb3
  .word   1417   @ Ab3
notesOct3_Aflatmin:
  .word   1417   @ Ab3
  .word   1486   @ Bb3
  .word   1517   @ Cb4
  .word   1575   @ Db4
  .word   1627   @ Eb4
  .word   1650   @ Fb4
  .word   1694   @ Gb4
  .word   1732   @ Ab4
notesOct4_Aflatmin:
  .word   1732   @ Ab4
  .word   1767   @ Bb4
  .word   1783   @ Cb5
  .word   1812   @ Db5
  .word   1837   @ Eb5
  .word   1849   @ Fb5
  .word   1871   @ Gb5
  .word   1890   @ Ab5
notesOct5_Aflatmin:
  .word   1890   @ Ab5
  .word   1907   @ Bb5
  .word   1915   @ Cb6
  .word   1930   @ Db6
  .word   1943   @ Eb6
  .word   1949   @ Fb6
  .word   1959   @ Gb6
  .word   1969   @ Ab6
notesOct6_Aflatmin:
  .word   1969   @ Ab6
  .word   1978   @ Bb6
  .word   1982   @ Cb7
  .word   1989   @ Db7
  .word   1995   @ Eb7
  .word   1998   @ Fb7
  .word   2004   @ Gb7
  .word   2009   @ Ab7
@ vim: syntax=armasm
