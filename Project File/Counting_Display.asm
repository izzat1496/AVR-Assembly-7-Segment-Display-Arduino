
; Created: 10/11/2020 5:05:47 AM
; In this project, we will create program to display from 9 to 0 by using 7-segment display by using AVR Assembly Languages.


main:

ldi r16, low(RAMEND)   ; set up the stack
out SPL, r16
ldi r16, high(RAMEND)
out SPH, r16

ldi r17, 0xFF          ; load register 16 with 0xFF (all bits 1)
out DDRD, r17          ; set port D as output

call disp_9 ;call subroutine to display 9
call disp_8 ;call subroutine to display 8
call disp_7 ;call subroutine to display 7
call disp_6 ;call subroutine to display 6
call disp_5 ;call subroutine to display 5
call disp_4 ;call subroutine to display 4
call disp_3 ;call subroutine to display 3
call disp_2 ;call subroutine to display 2
call disp_1 ;call subroutine to display 1
call disp_0 ;call subroutine to display 0

rjmp main ;jump back to main

disp_9:                ;subrountine to display 9

sbi PORTD, PIND1
cbi PORTD, PIND2
cbi PORTD, PIND3
sbi PORTD, PIND4

call DELAY_05

ret

disp_8:                ;subrountine to display 8

cbi PORTD, PIND1
cbi PORTD, PIND2
cbi PORTD, PIND3
sbi PORTD, PIND4

call DELAY_05

ret

disp_7:                ;subrountine to display 7

sbi PORTD, PIND1
sbi PORTD, PIND2
sbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret                    ;subrountine to display 6

disp_6:
cbi PORTD, PIND1
sbi PORTD, PIND2
sbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_5:                ;subrountine to display 5
sbi PORTD, PIND1
cbi PORTD, PIND2
sbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_4:                ;subrountine to display 4

cbi PORTD, PIND1
cbi PORTD, PIND2
sbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_3:                ;subrountine to display 3
sbi PORTD, PIND1
sbi PORTD, PIND2
cbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_2:                ;subrountine to display 2

cbi PORTD, PIND1
sbi PORTD, PIND2
cbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_1:                ;subrountine to display 1
sbi PORTD, PIND1
cbi PORTD, PIND2
cbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

disp_0:                ;subrountine to display 0
cbi PORTD, PIND1
cbi PORTD, PIND2
cbi PORTD, PIND3
cbi PORTD, PIND4

call DELAY_05

ret

DELAY_05:              ; delay 500ms subroutine
ldi r16, 31          ; load r16 with 31

OUTER_LOOP:            ; outer loop label
ldi r24, low(1021)   ; load registers r24:r25 with 1021, our new
                       ; init value
ldi r25, high(1021)  ; the loop label

DELAY_LOOP:            ; "add immediate to word": r24:r25 are
                       ; incremented
adiw r24, 1          ; if no overflow ("branch if not equal"), go

                       ; back to "delay_loop"
brne DELAY_LOOP
dec r16              ; decrement r16
brne OUTER_LOOP      ; and loop if outer loop not finished

ret                  ; return from subroutine
