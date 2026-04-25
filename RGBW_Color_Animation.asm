; Red Green Blue White color animation by Ryan Cannon aka ReneWand. For use on Nick Morgan's Easy 6502 assembler.

; Started around 2014-2017(I can't quite remember). Resumed and completed on 04/24/2026.

; To assemble this program:
; 1. Go to: https://skilldrick.github.io/easy6502/#snake
; 2. Copy the code below, , then .
; 3. Paste it in one of the boxes
; 4. Click "Assemble" followed by "Run"
; To see the underlying workings of this program in the form of a memory map:
; 1. Check the monitor box
; 2. Enter 0 at the start: $ numerical box
; 3. Enter 06a8 at length: $ numerical box

; Code starts here
define black       $00
define red         $02
define green       $05
define blue        $06
define white       $01


LDA #$01
store:

STA $01,X   ; Store all available colors in a row
ADC #$01
INX
CPX #$0f    
BNE store   ; Loop until last color is at $000f
LDX #$00    ; Reset x so that color won't start at $0f
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
LDX #$00 ; Reset X counter to avoid erasing $02ff

erase_red:
LDA black
STA $0200,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_red
STA $02ff
LDX #$00 ; Reset X counter to avoid erasing $02ff

LDA green
fill_green:
STA $0300,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_green
STA $03ff
LDX #$00 ; Reset X counter to avoid erasing $03ff

erase_green:
LDA black
STA $0300,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_green
STA $03ff
LDX #$00 ; Reset X counter to avoid erasing $03ff

LDA blue
fill_blue:
STA $0400,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_blue
STA $04ff
LDX #$00 ; Reset X counter to avoid erasing $04ff

erase_blue:
LDA black
STA $0400,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_blue
STA $04ff
LDX #$00 ; Reset X counter to avoid erasing $04ff

LDA white
fill_white:
STA $0500,X
INX
JSR pause_cpu
CPX #$ff
BNE fill_white
STA $05ff
LDX #$00 ; Reset X counter to avoid erasing $05ff

erase_white:
LDA black
STA $0500,X
INX
JSR pause_cpu
CPX #$ff
BNE erase_white
STA $05ff
LDX #$00 ; Reset X counter to avoid erasing $05ff

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
;End program
