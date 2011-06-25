.arm
.align
.data

.global notesOct2_Dflatmaj
.global notesOct3_Dflatmaj
.global notesOct4_Dflatmaj
.global notesOct5_Dflatmaj
.global notesOct6_Dflatmaj

#include "../src/defines.h"

.ltorg

notesOct2_Dflatmaj:
  .word   157   @ Db2
  .word   363   @ Eb2
  .word   547   @ F2
  .word   631   @ Gb2
  .word   786   @ Ab2
  .word   923   @ Bb2
  .word   1046    @ C3
  .word   1102   @ Db3
notesOct3_Dflatmaj:
  .word   1102   @ Db3
  .word   1205   @ Eb3
  .word   1297    @ F3
  .word   1340   @ Gb3
  .word   1417   @ Ab3
  .word   1486   @ Bb3
  .word   0x60b    @ C4
  .word   1575   @ Db4
notesOct4_Dflatmaj:
  .word   1575   @ Db4
  .word   1627   @ Eb4
  .word   0x688    @ F4
  .word   1694   @ Gb4
  .word   1732   @ Ab4
  .word   1767   @ Bb4
  .word   1798    @ C5
  .word   1812   @ Db5
notesOct5_Dflatmaj:
  .word   1812   @ Db5
  .word   1837   @ Eb5
  .word   1860    @ F5
  .word   1871   @ Gb5
  .word   1890   @ Ab5
  .word   1907   @ Bb5
  .word   1923    @ C6
  .word   1930   @ Db6
notesOct6_Dflatmaj:
  .word   1930   @ Db6
  .word   1943   @ Eb6
  .word   1954   @ F6
  .word   1959   @ Gb6
  .word   1969   @ Ab6
  .word   1978   @ Bb6
  .word   1985   @ C7
  .word   1989   @ Db7
