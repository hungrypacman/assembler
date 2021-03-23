; laba 2 v5
org 100h

 mov ah, 9h
 mov dx, greetings_str
 int 21h

 mov ah, 0ah
 mov dx, input_str
 int 21h

 mov ah, 9h
 mov dx, new_line
 int 21h

 mov bp, input_str+2
 mov bl, [bp-1]
 mov di, bx
 mov cl, [bp+4]
 mov ch, [bp+6]
 xchg ch, cl
 mov [bp+6], ch
 mov [bp+4], cl

 mov ch, [bp+8]
 mov cl, [bp+7]
 sub ch, cl
 mov cl, [bp+3]
 add cl, ch
 mov [bp+1], cl

 mov ah,9h
 mov dx, bp
 int 21h

 mov ah,8h
 int 21h

ret

 greetings_str db "Input string (max. 10 elements)",$0d,$0a,"$"
 input_str db 11,0,11 dup('$')
 new_line db $0d,$0a,"$"