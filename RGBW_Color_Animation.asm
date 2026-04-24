; Red Green Blue White color animation by Ryan Cannon aka ReneWand. For use on Nick Morgan's Easy 6502 assembly tutorial program.
; Started around 2014-2017(I can't remember). Resumed and completed in 2026.

; To assemble this program, go to: https://skilldrick.github.io/easy6502/#snake
; copy the code below, paste it in one of the boxes, then click assemble followed by run.

define black       $00
define white       $01
define red         $02
define cyan        $03
define purple      $04
define green       $05
define blue        $06
define yellow      $07
define orange      $08
define brown       $09
define light_red   $0a
define dark_grey   $0b
define grey        $0c
define light_green $0d
define light_blue  $0e
define light_grey  $0f
define random      $fe

LDA #$01
store:

STA $01,X   ;Store all available colors in a row
ADC #$01
INX
CPX #$0f    
BNE store   ;Loop until last color is at $000f
LDX #$00    ;reset x so that color won't start at $0f
JMP draw


draw:
LDA red
fill_red:
STA $0200,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_red
STA $02ff
LDX #$00 ;reset x counter to avoid erasing $02ff

erase_red:
LDA black
STA $0200,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_red
STA $02ff
LDX #$00 ;reset x counter to avoid erasing $02ff

LDA green
fill_green:
STA $0300,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_green
STA $03ff
LDX #$00 ;reset x counter to avoid erasing $03ff

erase_green:
LDA black
STA $0300,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_green
STA $03ff
LDX #$00 ;reset x counter to avoid erasing $03ff

LDA blue
fill_blue:
STA $0400,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_blue
STA $04ff
LDX #$00 ;reset x counter to avoid erasing $04ff

erase_blue:
LDA black
STA $0400,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_blue
STA $04ff
LDX #$00 ;reset x counter to avoid erasing $04ff

LDA white
fill_white:
STA $0500,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_white
STA $05ff
LDX #$00 ;reset x counter to avoid erasing $05ff

erase_white:
LDA black
STA $0500,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_white
STA $05ff
LDX #$00 ;reset x counter to avoid erasing $05ff

; Prevent program from running too fast for animation purposes
pause_cpu:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    RTS


end:
BRK
