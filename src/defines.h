#define   SRAM          0x0E000000
#define   DISPCNT       0x04000000
#define   DISPSTAT      0x04000004
#define   BG_0_BUFF     0x0100
#define   BG_1_BUFF     0x0200
#define   BG_2_BUFF     0x0400
#define   BG_3_BUFF     0x0800
#define   GFX_MODE_0    0x00
#define   OAM_ENABLE    0x1000
#define   OAM_1D        0x0040
#define   PAL_RAM       0x05000000
#define   OAM_PAL_BUFF  0x0200
#define   VRAM          0x06000000
#define   OAM_VRAM_BUFF 0x00010000
#define   OAM_VRAM      0x06010000
#define   OAM           0x07000000
#define   KEYINPUT      0x04000130
#define   KEYCNT        0x04000132
#define   IME           0x04000208
#define   IE            0x04000200
#define   IF            0x04000202
#define   BIOS_IF       0x03007FF8
#define   BG0CNT        0x04000008
#define   BG1CNT        0x0400000A
#define   BG2CNT        0x0400000C
#define   BG3CNT        0x0400000E
#define   ISR_MAIN      0x03007FFC
#define REG_SOUNDCNT_L  0x04000080
#define REG_SOUNDCNT_H  0x04000082
#define REG_SOUNDCNT_X  0x04000084 
#define REG_SOUND1CNT_H 0x04000062
#define REG_SOUND1CNT_X 0x04000064
#define REG_SOUND2CNT_L 0x04000068
#define REG_SOUND2CNT_H 0x0400006C
#define   BIT(n)        (1<<(n))
#define   IRQ_KEYPAD    BIT(12)

#define OBJ_ATTRIBUTE0(n)			(((n)*0x8) + 0x07000000)
#define OBJ_ATTRIBUTE1(n)			(((n)*0x8) + 0x07000002)
#define OBJ_ATTRIBUTE2(n)			(((n)*0x8) + 0x07000004)

@@  main.s
.extern main
.extern setupLoop
.extern synthLoop
.extern setup

@  sram.s
.extern loadSettings
.extern saveSettings

@@  data.s
.extern octave
.extern key
.extern keystates
.extern fontBMP
.extern fontPAL
.extern synthText
.extern setupText
.extern notesettings
.extern setupBit
.extern soundRegUsage
@@ data_Cmaj.s
.extern notesOct2_Cmaj
.extern notesOct3_Cmaj
.extern notesOct4_Cmaj
.extern notesOct5_Cmaj
.extern notesOct6_Cmaj
@@ data_Gmaj.s
.extern notesOct2_Gmaj
.extern notesOct3_Gmaj
.extern notesOct4_Gmaj
.extern notesOct5_Gmaj
.extern notesOct6_Gmaj
@@ data_Dmaj.s
.extern notesOct2_Dmaj
.extern notesOct3_Dmaj
.extern notesOct4_Dmaj
.extern notesOct5_Dmaj
.extern notesOct6_Dmaj
@@ data_Amaj.s
.extern notesOct2_Amaj
.extern notesOct3_Amaj
.extern notesOct4_Amaj
.extern notesOct5_Amaj
.extern notesOct6_Amaj
@@ data_Emaj.s
.extern notesOct2_Emaj
.extern notesOct3_Emaj
.extern notesOct4_Emaj
.extern notesOct5_Emaj
.extern notesOct6_Emaj
@@ data_Bmaj.s
.extern notesOct2_Bmaj
.extern notesOct3_Bmaj
.extern notesOct4_Bmaj
.extern notesOct5_Bmaj
.extern notesOct6_Bmaj
@@ data_Fsharpmaj
.extern notesOct2_Fsharpmaj
.extern notesOct3_Fsharpmaj
.extern notesOct4_Fsharpmaj
.extern notesOct5_Fsharpmaj
.extern notesOct6_Fsharpmaj
@@ data_Csharpmaj
.extern notesOct2_Csharpmaj
.extern notesOct3_Csharpmaj
.extern notesOct4_Csharpmaj
.extern notesOct5_Csharpmaj
.extern notesOct6_Csharpmaj
@@ data_Fmaj.s
.extern notesOct2_Fmaj
.extern notesOct3_Fmaj
.extern notesOct4_Fmaj
.extern notesOct5_Fmaj
.extern notesOct6_Fmaj
@@ data_Bflatmaj.s
.extern notesOct2_Bflatmaj
.extern notesOct3_Bflatmaj
.extern notesOct4_Bflatmaj
.extern notesOct5_Bflatmaj
.extern notesOct6_Bflatmaj
@@ data_Eflatmaj.s
.extern notesOct2_Eflatmaj
.extern notesOct3_Eflatmaj
.extern notesOct4_Eflatmaj
.extern notesOct5_Eflatmaj
.extern notesOct6_Eflatmaj
@@ data_Aflatmaj.s
.extern notesOct2_Aflatmaj
.extern notesOct3_Aflatmaj
.extern notesOct4_Aflatmaj
.extern notesOct5_Aflatmaj
.extern notesOct6_Aflatmaj
@@ data_Gflatmaj.s
.extern notesOct2_Gflatmaj
.extern notesOct3_Gflatmaj
.extern notesOct4_Gflatmaj
.extern notesOct5_Gflatmaj
.extern notesOct6_Gflatmaj
@@ data_Cflatmaj.s
.extern notesOct2_Cflatmaj
.extern notesOct3_Cflatmaj
.extern notesOct4_Cflatmaj
.extern notesOct5_Cflatmaj
.extern notesOct6_Cflatmaj
@@ data_Amin.s
.extern notesOct2_Amin
.extern notesOct3_Amin
.extern notesOct4_Amin
.extern notesOct5_Amin
.extern notesOct6_Amin
@@ data_Aflatmin.s
.extern notesOct2_Aflatmin
.extern notesOct3_Aflatmin
.extern notesOct4_Aflatmin
.extern notesOct5_Aflatmin
.extern notesOct6_Aflatmin
@@ data_Asharpmin.s
.extern notesOct2_Asharpmin
.extern notesOct3_Asharpmin
.extern notesOct4_Asharpmin
.extern notesOct5_Asharpmin
.extern notesOct6_Asharpmin
@@ data_Bflatmin.s
.extern notesOct2_Bflatmin
.extern notesOct3_Bflatmin
.extern notesOct4_Bflatmin
.extern notesOct5_Bflatmin
.extern notesOct6_Bflatmin
@@ data_Bmin.s
.extern notesOct2_Bmin
.extern notesOct3_Bmin
.extern notesOct4_Bmin
.extern notesOct5_Bmin
.extern notesOct6_Bmin
@@ data_Cmin.s
.extern notesOct2_Cmin
.extern notesOct3_Cmin
.extern notesOct4_Cmin
.extern notesOct5_Cmin
.extern notesOct6_Cmin
@@ data_Csharpmin.s
.extern notesOct2_Csharpmin
.extern notesOct3_Csharpmin
.extern notesOct4_Csharpmin
.extern notesOct5_Csharpmin
.extern notesOct6_Csharpmin
@@ data_Dmin.s
.extern notesOct2_Dmin
.extern notesOct3_Dmin
.extern notesOct4_Dmin
.extern notesOct5_Dmin
.extern notesOct6_Dmin
@@ data_Dsharpmin.s
.extern notesOct2_Dsharpmin
.extern notesOct3_Dsharpmin
.extern notesOct4_Dsharpmin
.extern notesOct5_Dsharpmin
.extern notesOct6_Dsharpmin
@@ data_Eflatmin.s
.extern notesOct2_Eflatmin
.extern notesOct3_Eflatmin
.extern notesOct4_Eflatmin
.extern notesOct5_Eflatmin
.extern notesOct6_Eflatmin
@@ data_Emin.s
.extern notesOct2_Emin
.extern notesOct3_Emin
.extern notesOct4_Emin
.extern notesOct5_Emin
.extern notesOct6_Emin
@@ data_Fmin.s
.extern notesOct2_Fmin
.extern notesOct3_Fmin
.extern notesOct4_Fmin
.extern notesOct5_Fmin
.extern notesOct6_Fmin
@@ data_Fsharpmin.s
.extern notesOct2_Fsharpmin
.extern notesOct3_Fsharpmin
.extern notesOct4_Fsharpmin
.extern notesOct5_Fsharpmin
.extern notesOct6_Fsharpmin
@@ data_Gmin.s
.extern notesOct2_Gmin
.extern notesOct3_Gmin
.extern notesOct4_Gmin
.extern notesOct5_Gmin
.extern notesOct6_Gmin
@@ data_Gsharpmin.s
.extern notesOct2_Gsharpmin
.extern notesOct3_Gsharpmin
.extern notesOct4_Gsharpmin
.extern notesOct5_Gsharpmin
.extern notesOct6_Gsharpmin

@@ gfx.s
.extern showText
.extern updateSetup

@@  irq.s
.extern isrInit
.extern irqHndlr

@@  setup
.extern keyCheckSetup
.extern displayLengthFlag


@@  synth.s
.extern keyCheckSynth

@@  debug.s
@.extern debug
@ vim: syntax=armasm
