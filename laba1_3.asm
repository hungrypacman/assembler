; Calculate and print result of y=((a-b)*3+2*c)/(d-1)
; v3
; y should be < 9 or 8, else - result will be a symbol from ASCII, not number
  org 100h;
start:
        mov ah, 09h ; DOS function to write text on the screen
        mov dx, name_prog; Passing function args to registers
        int 21h; DOS interruption to execute functions

        mov ah, 02h; DOS function to write ASCII symbol
        mov dx, 0x0D0A; \n code in ASCII
        int 21h

        mov ah, 09h
        mov dx, str2
        int 21h

        mov ah, 02h
        mov dx, 0x0D0A
        int 21h

        mov ah, 09h
        mov dx, result_is
        int 21h

        mov bx, [b]; gruzim b to BX
        mov ax, [a]; gruzim a to AX
        sub ax, bx; razonst a-b; Result in AX

        mov bx, $03; gruzim 3 to BX
        mul bx ; umn (a-b)*3. Result in AX
        mov bx, ax ;gruzim  result of (a-b)*3 to BX
        mov ax, $02 ; gruzim 2 to AX
        mov cx, [c]; gruzim c to CX
        mul cx; umnozhemie c*2. Result in AX
        add bx, ax;  sum of (a-b)*3 and cx. Result in BX

        mov cx, [d]; gruzim d to CX
        mov ax, $01; gruzim 1 to AX
        sub cx, ax; Raznost of d-1. Result in CX
        mov ax, bx; gruzim sum of (a-b)*3+2*c to BX
        div cx; Divide ax/cx. Result in DX:AX
        add ax, '0'; Convert to ASCII code

        ; <print result>
        mov bx, ax; send result from AX to BX, because AH will be used to print result
        mov ah, 02h
        mov dx, bx
        int 21h

        mov ah, 08h
        int 21h
        ; </print result>
        ret

name_prog db "This program calculates y=((a-b)*3+2*c)/(d-1)$"
str2      db "where a=3, b=2, c=1, d=2$"
result_is db "result is equal to $"
a         dw 3h
d         dw 2h
c         dw 1h
b         dw 2h
res       db 0h


; $03 - is a number 3

