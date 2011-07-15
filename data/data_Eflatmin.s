.arm
.align
.data

.global notesOct2_Eflatmin
.global notesOct3_Eflatmin
.global notesOct4_Eflatmin
.global notesOct5_Eflatmin
.global notesOct6_Eflatmin

#include "../src/defines.h"

.ltorg

notesOct2_Eflatmin:
  .word   363   @ Eb2
  .word   547   @ F2
  .word   631   @ Gb2
  .word   786   @ Ab2
  .word   923   @ Bb2
  .word   986   @ Cb3
  .word   1102   @ Db3
  .word   1205   @ Eb3
notesOct3_Eflatmin:
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1340   @ Gb3
  .word   1417   @ Ab3
  .word   1486   @ Bb3
  .word   1517   @ Cb4
  .word   1575   @ Db4
  .word   1627   @ Eb4
notesOct4_Eflatmin:
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   1694   @ Gb4
  .word   1732   @ Ab4
  .word   1767   @ Bb4
  .word   1783   @ Cb5
  .word   1812   @ Db5
  .word   1837   @ Eb5
notesOct5_Eflatmin:
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1871   @ Gb5
  .word   1890   @ Ab5
  .word   1907   @ Bb5
  .word   1915   @ Cb6
  .word   1930   @ Db6
  .word   1943   @ Eb6
notesOct6_Eflatmin:
  .word   1943   @ Eb6
  .word   1954   @ F6
  .word   1959   @ Gb6
  .word   1969   @ Ab6
  .word   1978   @ Bb6
  .word   1982   @ Cb6
  .word   1989   @ Db7
  .word   1995   @ Eb7
@ vim: syntax=armasm
