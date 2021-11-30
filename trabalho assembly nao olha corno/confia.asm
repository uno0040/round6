IDEAL

MODEL small

STACK 100h

DATASEG

EnderecoDeRetorno dw 0
EnderecoDeRetorno2 dw 0
EnderecoDeRetorno3 dw 0
EnderecoDeRetorno4 dw 0
EnderecoDeRetorno5 dw 0
EnderecoDeRetorno6 dw 0
EnderecoDeRetorno7 dw 0
EnderecoDeRetorno8 dw 0
EnderecoDeRetorno9 dw 0
EnderecoDeRetorno10 dw 0
EnderecoDeRetorno11 dw 0
EnderecoDeRetorno12 dw 0
EnderecoDeRetorno13 dw 0
EnderecoDeRetorno14 dw 0
EnderecoDeRetorno15 dw 0
EnderecoDeRetorno16 dw 0
EnderecoDeRetorno17 dw 0
EnderecoDeRetorno18 dw 0

poppedin dw 0
cor dw 0

saver dw 0
saver1 dw 0
saver2 dw 0
saver3 dw 0
saver4 dw 0
saver5 dw 0

saverofy dw 0

endx dw 0
endy dw 0

startx dw 0
ImpressaoDeBotoes dw 0
Saida dw 0
UltimaSaida dw 0
PreUltimaSaida dw 0
UltimoUso dw 0
BoleanoAdicao dw 2
BoleanoSubracao dw 2
BoleanoMultiplicacao dw 2
BoleanoDivisao dw 2
PrimeiroDigito dw 1
decimal dw 0
casa dw 0
CODESEG
proc printpixel;gets casa and cor in that order via stack oi
    pop [EnderecoDeRetorno]
    mov bh,0h
    pop bx
    mov cx,bx
    pop bx
    mov dx,bx
    pop bx
    mov ax,bx
    mov bl,0
    mov ah,0ch
    int 10h
    push [EnderecoDeRetorno]
    ret
endp printpixel

proc printRow;gets index of row and cor
    pop[EnderecoDeRetorno2]
    pop cor
    mov cx,319
    printapixel:
    pop bx;has y coordinate of row
    push bx
    mov saver,cx
    push cor
    push bx
    push cx
    call printpixel
    mov cx,saver
    dec cx
    cmp cx,0
    jne printapixel
    push[EnderecoDeRetorno2]
    ret
endp printRow

proc printlinerow;gets start of line y coordinate and end of line
    pop[EnderecoDeRetorno2]
    pop cor
    pop cx
    printapixel2:
    pop bx;has y coordinate of row
    push bx
    mov saver,cx
    push cor
    push bx
    push cx
    call printpixel
    mov cx,saver
    dec cx
    pop bx
    pop dx
    push dx
    push bx
    cmp cx,dx
    jne printapixel2
    push[EnderecoDeRetorno2]
    ret
endp printlinerow

proc printCollumn;gets index of collumn and cor
    pop[EnderecoDeRetorno2]
    pop cor
    mov cx,199
    printapixel3:
    pop bx;has x coordinate of collumn
push bx
    mov saver,cx
    push cor
    push cx
    push bx
    call printpixel
    mov cx,saver
    dec cx
    cmp cx,0
    jne printapixel3
    push[EnderecoDeRetorno2]
    ret
endp printCollumn

proc printlinecollumn;gets start of line x coordinate and end of line and cor
    pop[EnderecoDeRetorno2]
    pop cor
    pop cx
    printapixel4:
    pop bx;has x coordinate of row
    push bx
    mov saver,cx
    push cor
    push cx
    push bx
    call printpixel
    mov cx,saver
    dec cx
    pop bx
    pop dx
    push dx
    push bx
    cmp cx,dx
    jne printapixel4
    push[EnderecoDeRetorno2]
    ret
endp printlinecollumn

proc printRectangle;gets starting position(bottom right corner), width and length and cor
    pop [EnderecoDeRetorno3]
    pop cor
    pop endx
    pop endy
    pop cx
    pop bx
    printrow2:
    mov startx,cx
    mov saverofy, bx
    push endx
    push bx
    push cx
    push cor
    call printlinerow
    mov cx,startx
    mov bx,saverofy
    dec bx
    cmp bx,endy
    jne printRow2


    push [EnderecoDeRetorno3]
    ret
endp printRectangle

proc printOne;prints one gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1,cx
    mov saver2,dx
    sub cx, 6
    sub dx, 1
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 9
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 15
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 11
    sub dx, 15
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push [EnderecoDeRetorno4]
    ret
endp printOne

proc printTwo;prints two gets x and y coordinates and cor
    pop [EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
mov saver2, dx
    sub cx,4
    sub dx,2
    push dx
    push cx
    sub cx,13
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 13
    sub dx, 4
    push dx
    push cx
    sub cx,2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 11
    sub dx, 6
    push dx
    push cx
    sub cx,2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx,saver2
    sub cx, 9
    sub dx, 8
    push dx
    push cx
    sub cx,2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx,saver1
    mov dx,saver2
    sub cx,7
    sub dx,10
    push dx
    push cx
    sub cx,2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 12
    push dx
    push cx
    sub cx,2
    sub dx,5
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx,7
    sub dx,17
    push dx
    push cx
    sub cx,7
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 15
    push dx
    push cx
    sub cx, 2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    push [EnderecoDeRetorno4]
    ret
endp printTwo

proc printThree;prints three to the screen gets x and y coordinates and cor
    pop [EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx,7
    sub dx,1
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 6
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 7
    sub dx, 9
    push dx
    push cx
    sub cx, 5
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 11
    push dx
    push cx
    sub cx, 2
    sub dx, 6
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 7
    sub dx, 17
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 15
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push [EnderecoDeRetorno4]
    ret
endp printThree

proc printFour;prints four to the screen get x and y coordinates and a cor
    pop [EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1,cx
    mov saver2,dx
    sub cx,6
    sub dx,1
    push dx
    push cx
    sub cx,2
    sub dx, 18
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 8
    push dx
    push cx
    sub cx, 15
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 8
    sub dx, 16
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 10
    sub dx, 14
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 12
    sub dx, 12
    push dx
    push cx
    sub cx, 2
sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 14
    sub dx, 10
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push [EnderecoDeRetorno4]
    ret
endp printFour

proc printFive;prints five to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1,cx
    mov saver2,dx
    sub cx, 5
    sub dx, 1
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 6
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 9
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 11
    push dx 
    push cx
    sub cx, 2
    sub dx, 8
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 17
    push dx
    push cx
    sub cx, 12
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printFive

proc printSix;prints six to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2 ,dx
    sub cx, 5
    sub dx, 1
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
sub cx, 3
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 7
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 12
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 10
    push dx
    push cx
    sub cx, 10
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2 
    sub cx, 13
    sub dx, 15
    push dx
    push cx
    sub cx,2
    sub dx,2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 17
    push dx
    push cx
    sub cx, 9
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printSix

proc printSeven;prints seven to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 13
    sub dx, 1
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 12
    sub dx, 4
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 10
    sub dx, 7
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 9
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 8
    sub dx, 11
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 13
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 15
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 17
    push dx
    push cx
    sub cx, 13
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printSeven

proc printEight;prints eight to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 5
    sub dx, 1
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1 
    mov dx, saver2 
    sub cx, 3
    sub dx, 2
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx 
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 2
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 2
    sub dx, 5
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 16
    sub dx, 5
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 8
    push dx
    push cx
    sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 8
    push dx
    push cx
sub cx, 2
    sub dx, 3
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 11
    push dx
    push cx
    sub cx, 12
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 13
    push dx
    push cx
    sub cx, 2
    sub dx, 4
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 13
    push dx
    push cx
    sub cx, 2
    sub dx, 4
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 17
    push dx
    push cx
    sub cx, 12
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printEight

proc printNine;prints nine to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 5
    sub dx, 1
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 14
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 9
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 11
    push dx
    push cx
    sub cx, 2
    sub dx, 6
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
mov dx, saver2
    sub cx, 5
    sub dx, 17
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx 
    push cor 
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printNine

proc printPlusSign;prints plus sign to the screen get x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 6
    sub dx, 9
    push dx
    push cx
    sub cx, 3
    sub dx, 2
    push dx
    push cx 
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 11
    sub dx, 9
    push dx
    push cx
    sub cx, 3
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 9
    sub dx, 6
    push dx
    push cx
    sub cx, 2
    sub dx, 8
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printPlusSign

proc printMinusSign;prints minus sign to the screen get x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    sub cx, 6
    sub dx, 9
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printMinusSign

proc printMultiplicationSign;prints multiplication sign to the screen gets x and y coortdinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 5
    sub dx, 5
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 13
    sub dx, 5
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 7
    sub dx, 7
    push dx
    push cx
    sub cx, 2
    sub dx, 2
push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 11
    sub dx, 7
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 9
    sub dx, 9
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 7
    sub dx, 11
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 11
    sub dx, 11
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 13
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 13
    sub dx, 13
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 6
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 12
    sub dx, 6
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 8
    sub dx, 8
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 10
    sub dx, 8
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 8
    sub dx, 10
push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 10
    sub dx, 10
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 12
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 12
    sub dx, 12
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printMultiplicationSign

proc printDivisionSign;prints division sign to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 9
    sub dx, 6
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 9
    sub dx, 12
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 9
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printDivisionSign

proc printEqualsSign;prints the equals sign to the screen gets x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 6
    sub dx, 7
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 11
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printEqualsSign

proc printZero;prints zero to the screen get x and y coordinates and cor
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 5
    sub dx, 1
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 14
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 3
    push dx
    push cx
    sub cx, 2
    sub dx, 14
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 5
    sub dx, 17
    push dx
    push cx
    sub cx, 10
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    push[EnderecoDeRetorno4]
    ret
endp printZero

proc printClear
    pop[EnderecoDeRetorno4]
    pop cx
    pop dx
    pop cor
    mov saver1, cx
    mov saver2, dx
    sub cx, 6
    sub dx, 1
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 2
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 4
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 14
    sub dx, 2
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 15
    sub dx, 4
    push dx
    push cx
sub cx, 2
    sub dx, 12
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 3
    sub dx, 14
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 14
    sub dx, 16
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 4
    sub dx, 16
    push dx
    push cx
    sub cx, 2
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    mov cx, saver1
    mov dx, saver2
    sub cx, 6
    sub dx, 17
    push dx
    push cx
    sub cx, 8
    sub dx, 2
    push dx
    push cx
    push cor
    call printRectangle
    push[EnderecoDeRetorno4]
    ret
endp printClear

proc printCalculator;prints the calculator
    pop[EnderecoDeRetorno6]
    ;prints base of calculator
    push 197 ;starty
    push 212 ;startx
    push 2 ;endy
    push 106 ;endx
    push 20 ;cor
    call printRectangle

    ;prints screen of calculator
    push 70
    push 210
    push 4
    push 108
    push 27
    call printRectangle

    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    ;printing buttons

    call printButtons

    push[EnderecoDeRetorno6]
    ret
endp printCalculator

proc printButtons
    pop[EnderecoDeRetorno5]

    ;Clear button
    push 188
    push 132
    push 166
    push 110
    push 27
    call printRectangle
    push 187 ;start y
    push 131 ;start x
    push 167 ;end y
    push 111 ;end x
    push 25 ;cor 
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 131 ;x coordinate
    call printClear

    ;0 button
    push 188
    push 157
    push 166
    push 135
    push 27
    call printRectangle
    push 187 ;starty
push 156 ;startx
    push 167 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 156 ;x coordinate
    call printZero

    ;= button
    push 188
    push 182
    push 166
    push 160
    push 27
    call printRectangle
    push 187 ;starty
    push 181 ;startx
    push 167 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 181 ;x coordinate
    call printEqualsSign

    ;/ button
    push 188
    push 207
    push 166
    push 185
    push 27
    call printRectangle
    push 187 ;starty
    push 206 ;startx
    push 167 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 206 ;x coordinate
    call printDivisionSign

    ;1 button
    push 158
    push 132
    push 136
    push 110
    push 27
    call printRectangle
    push 157 ;starty
    push 131 ;startx
    push 137 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 131 ;x coordinate
    call printOne

    ;2 button
    push 158
    push 157
    push 136
    push 135
    push 27
    call printRectangle
    push 157 ;starty
    push 156 ;startx
    push 137 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 156 ;x coordinate
    call printTwo

    ;3 button
    push 158
    push 182
    push 136
    push 160
    push 27
    call printRectangle
    push 157 ;starty
    push 181 ;startx
    push 137 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 181 ;x coordinate
    call printThree

    ;* button
    push 158
    push 207
    push 136
    push 185
    push 27
    call printRectangle
    push 157 ;starty
push 206 ;startx
    push 137 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 206 ;x coordinate
    call printMultiplicationSign

    ;4 button
    push 128
    push 132
    push 106
    push 110
    push 27
    call printRectangle
    push 127 ;starty
    push 131 ;startx
    push 107 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 131 ;x coordinate
    call printFour

    ;5 button
    push 128
    push 157
    push 106
    push 135
    push 27
    call printRectangle
    push 127 ;starty
    push 156 ;startx
    push 107 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 156 ;x coordinate
    call printFive

    ;6 button 
    push 128
    push 182
    push 106
    push 160
    push 27
    call printRectangle
    push 127 ;starty
    push 181 ;startx
    push 107 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 181 ;x coordinate
    call printSix

    ;- button
    push 128
    push 207
    push 106
    push 185
    push 27
    call printRectangle
    push 127 ;starty
    push 206 ;startx
    push 107 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 206 ;x coordinate
    call printMinusSign

    ;7 button
    push 98
    push 132
    push 76
    push 110
    push 27
    call printRectangle
    push 97 ;starty
    push 131 ;startx
    push 77 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 131 ;x coordinate
    call printSeven

    ;8 button
    push 98
    push 157
    push 76
    push 135
    push 27
    call printRectangle
    push 97 ;starty
push 156 ;startx
    push 77 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 156 ;x coordinate
    call printEight

    ;9 button 
    push 98
    push 182
    push 76
    push 160
    push 27
    call printRectangle
    push 97 ;starty
    push 181 ;startx
    push 77 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 181 ;x coordinate
    call printNine

    ;+ button
    push 98
    push 207
    push 76
    push 185
    push 27
    call printRectangle
    push 97 ;starty
    push 206 ;startx
    push 77 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 206 ;x coordinate
    call printPlusSign
    push[EnderecoDeRetorno5]
    ret
endp printButtons

proc highlightClear
    pop[EnderecoDeRetorno5]

    push 187 ;start y
    push 131 ;start x
    push 167 ;end y
    push 111 ;end x
    push 4 ;cor 
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 131 ;x coordinate
    call printClear

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    push 0
    push 47
    push 207
    call printClear

    mov Saida, 0
    mov UltimaSaida, 0
    mov casa, 0
    mov PreUltimaSaida, 0
    mov UltimoUso, 0
    mov ax, 0

    mov ah, 2ch
    int 21h
    mov saver1, dx
    readtheClock:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readtheClock

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    push 187 ;start y
    push 131 ;start x
    push 167 ;end y
    push 111 ;end x
    push 25 ;cor 
    call printRectangle
push 0 ;cor
    push 187 ;y coordinate
    push 131 ;x coordinate
    call printClear
    push[EnderecoDeRetorno5]
    ret
endp highlightClear

proc highlightOne
    pop[EnderecoDeRetorno5]
    push 157 ;starty
    push 131 ;startx
    push 137 ;endy
    push 111 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 131 ;x coordinate
    call printOne

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigito

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 1
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish


    isPrimeiroDigito:

    mov PrimeiroDigito, 0
    ;prints one to the screen
    push 0
    push 47
    push 207
    call printOne

    cmp boleanoAdicao,1
    jne n1
    jmp allreadyoperated
    n1:
    cmp BoleanoSubracao,1
    jne n2
    jmp allreadyoperated
    n2:
    cmp BoleanoMultiplicacao,1
    jne n3
    jmp allreadyoperated
    n3:
    cmp BoleanoDivisao,1
    jne didntoperate

    allreadyoperated:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate:
    cmp UltimaSaida, 0
    je dontwork
    mov Saida, 1
    jmp finish

    dontwork:
    mov UltimaSaida, 1
    jmp finish



    finish:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock

    push 157 ;starty
    push 131 ;startx
    push 137 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 131 ;x coordinate
    call printOne
    push[EnderecoDeRetorno5]
    ret
endp highlightOne

proc highlightTwo
pop[EnderecoDeRetorno5]
    push 157 ;starty
    push 156 ;startx
    push 137 ;endy
    push 136 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 156 ;x coordinate
    call printTwo

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoTwo

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 2
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish2


    isPrimeiroDigitoTwo:

    mov PrimeiroDigito, 0
    ;prints two to the screen
    push 0
    push 47
    push 207
    call printTwo

    cmp boleanoAdicao,1
    jne n21
    jmp allreadyoperated2
    n21:
    cmp BoleanoSubracao,1
    jne n22
    jmp allreadyoperated2
    n22:
    cmp BoleanoMultiplicacao,1
    jne n23
    jmp allreadyoperated2
    n23:
    cmp BoleanoDivisao,1
    jne didntoperate2

    allreadyoperated2:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate2:
    cmp UltimaSaida, 0
    je dontwork2
    mov Saida, 2
    jmp finish2

    dontwork2:
    mov UltimaSaida, 2
    jmp finish2



    finish2:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock2:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock2

    push 157 ;starty
    push 156 ;startx
    push 137 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 156 ;x coordinate
    call printTwo
    push[EnderecoDeRetorno5]
    ret
endp highlightTwo

proc highlightThree
    pop[EnderecoDeRetorno5]
    push 157 ;starty
    push 181 ;startx
    push 137 ;endy
    push 161 ;endx
    push 4 ;cor
    call printRectangle
push 0 ;cor
    push 157 ;y coordinate
    push 181 ;x coordinate
    call printThree

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoThree

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 3
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish3


    isPrimeiroDigitoThree:

    mov PrimeiroDigito, 0
    ;prints three to the screen
    push 0
    push 47
    push 207
    call printThree

    cmp boleanoAdicao,1
    jne n31
    jmp allreadyoperated3
    n31:
    cmp BoleanoSubracao,1
    jne n32
    jmp allreadyoperated3
    n32:
    cmp BoleanoMultiplicacao,1
    jne n33
    jmp allreadyoperated3
    n33:
    cmp BoleanoDivisao,1
    jne didntoperate3

    allreadyoperated3:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate3:
    cmp UltimaSaida, 0
    je dontwork3
    mov Saida, 3
    jmp finish3

    dontwork3:
    mov UltimaSaida, 3
    jmp finish3



    finish3:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock3:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock3

    push 157 ;starty
    push 181 ;startx
    push 137 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 181 ;x coordinate
    call printThree
    push[EnderecoDeRetorno5]
    ret
endp highlightThree

proc highlightFour
    pop[EnderecoDeRetorno5]
    push 127 ;starty
    push 131 ;startx
    push 107 ;endy
    push 111 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 131 ;x coordinate
    call printFour

    ;clears screen temporary!
push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoFour

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 4
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish4


    isPrimeiroDigitoFour:

    mov PrimeiroDigito, 0
    ;prints four to the screen
    push 0
    push 47
    push 207
    call printFour

    cmp boleanoAdicao,1
    jne n41
    jmp allreadyoperated4
    n41:
    cmp BoleanoSubracao,1
    jne n42
    jmp allreadyoperated4
    n42:
    cmp BoleanoMultiplicacao,1
    jne n43
    jmp allreadyoperated4
    n43:
    cmp BoleanoDivisao,1
    jne didntoperate4

    allreadyoperated4:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate4:
    cmp UltimaSaida, 0
    je dontwork4
    mov Saida, 4
    jmp finish4

    dontwork4:
    mov UltimaSaida, 4
    jmp finish4



    finish4:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock4:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock4

    push 127 ;starty
    push 131 ;startx
    push 107 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 131 ;x coordinate
    call printFour
    push[EnderecoDeRetorno5]
    ret
endp highlightFour

proc highlightFive
    pop[EnderecoDeRetorno5]
    push 127 ;starty
    push 156 ;startx
    push 107 ;endy
    push 136 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 156 ;x coordinate
    call printFive

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle
cmp PrimeiroDigito, 1
    je isPrimeiroDigitoFive

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 5
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish5


    isPrimeiroDigitoFive:

    mov PrimeiroDigito, 0
    ;prints five to the screen
    push 0
    push 47
    push 207
    call printFive

    cmp boleanoAdicao,1
    jne n51
    jmp allreadyoperated5
    n51:
    cmp BoleanoSubracao,1
    jne n52
    jmp allreadyoperated5
    n52:
    cmp BoleanoMultiplicacao,1
    jne n53
    jmp allreadyoperated5
    n53:
    cmp BoleanoDivisao,1
    jne didntoperate5

    allreadyoperated5:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate5:
    cmp UltimaSaida, 0
    je dontwork5
    mov Saida, 5
    jmp finish5

    dontwork5:
    mov UltimaSaida, 5
    jmp finish5



    finish5:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock5:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock5

    push 127 ;starty
    push 156 ;startx
    push 107 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 156 ;x coordinate
    call printFive
    push[EnderecoDeRetorno5]
    ret
endp highlightFive

proc highlightSix
    pop[EnderecoDeRetorno5]
    push 127 ;starty
    push 181 ;startx
    push 107 ;endy
    push 161 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 181 ;x coordinate
    call printSix

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoSix

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
add ax, 6
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish6


    isPrimeiroDigitoSix:

    mov PrimeiroDigito, 0
    ;prints six to the screen
    push 0
    push 47
    push 207
    call printSix

    cmp boleanoAdicao,1
    jne n61
    jmp allreadyoperated6
    n61:
    cmp BoleanoSubracao,1
    jne n62
    jmp allreadyoperated6
    n62:
    cmp BoleanoMultiplicacao,1
    jne n63
    jmp allreadyoperated6
    n63:
    cmp BoleanoDivisao,1
    jne didntoperate6

    allreadyoperated6:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate6:
    cmp UltimaSaida, 0
    je dontwork6
    mov Saida, 6
    jmp finish6

    dontwork6:
    mov UltimaSaida, 6
    jmp finish6



    finish6:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock6:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock6

    push 127 ;starty
    push 181 ;startx
    push 107 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 181 ;x coordinate
    call printSix
    push[EnderecoDeRetorno5]
    ret
endp highlightSix

proc highlightSeven
    pop[EnderecoDeRetorno5]
    push 97 ;starty
    push 131 ;startx
    push 77 ;endy
    push 111 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 131 ;x coordinate
    call printSeven

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoSeven

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 7
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish7


    isPrimeiroDigitoSeven:
mov PrimeiroDigito, 0
    ;prints seven to the screen
    push 0
    push 47
    push 207
    call printSeven

    cmp boleanoAdicao,1
    jne n71
    jmp allreadyoperated7
    n71:
    cmp BoleanoSubracao,1
    jne n72
    jmp allreadyoperated7
    n72:
    cmp BoleanoMultiplicacao,1
    jne n73
    jmp allreadyoperated7
    n73:
    cmp BoleanoDivisao,1
    jne didntoperate7

    allreadyoperated7:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate7:
    cmp UltimaSaida, 0
    je dontwork7
    mov Saida, 7
    jmp finish7

    dontwork7:
    mov UltimaSaida, 7
    jmp finish7



    finish7:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock7:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock7

    push 97 ;starty
    push 131 ;startx
    push 77 ;endy
    push 111 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 131 ;x coordinate
    call printSeven
    push[EnderecoDeRetorno5]
    ret
endp highlightSeven

proc highlightEight
    pop[EnderecoDeRetorno5]
    push 97 ;starty
    push 156 ;startx
    push 77 ;endy
    push 136 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 156 ;x coordinate
    call printEight

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle


    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoEight

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 8
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish8


    isPrimeiroDigitoEight:

    mov PrimeiroDigito, 0
    ;prints eight to the screen
    push 0
    push 47
    push 207
    call printEight

    cmp boleanoAdicao,1
jne n81
    jmp allreadyoperated8
    n81:
    cmp BoleanoSubracao,1
    jne n82
    jmp allreadyoperated8
    n82:
    cmp BoleanoMultiplicacao,1
    jne n83
    jmp allreadyoperated8
    n83:
    cmp BoleanoDivisao,1
    jne didntoperate8

    allreadyoperated8:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate8:
    cmp UltimaSaida, 0
    je dontwork8
    mov Saida, 8
    jmp finish8

    dontwork8:
    mov UltimaSaida, 8
    jmp finish8



    finish8:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock8:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock8

    push 97 ;starty
    push 156 ;startx
    push 77 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 156 ;x coordinate
    call printEight
    push[EnderecoDeRetorno5]
    ret
endp highlightEight

proc highlightNine
    pop[EnderecoDeRetorno5]
    push 97 ;starty
    push 181 ;startx
    push 77 ;endy
    push 161 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 181 ;x coordinate
    call printNine

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoNine

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 9
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish


    isPrimeiroDigitoNine:

    mov PrimeiroDigito, 0
    ;prints nine to the screen
    push 0
    push 47
    push 207
    call printNine

    cmp boleanoAdicao,1
    jne n91
    jmp allreadyoperated9
    n91:
    cmp BoleanoSubracao,1
    jne n92
    jmp allreadyoperated9
    n92:
    cmp BoleanoMultiplicacao,1
    jne n93
jmp allreadyoperated9
    n93:
    cmp BoleanoDivisao,1
    jne didntoperate9

    allreadyoperated9:
    mov ax, UltimaSaida
    mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate9:
    cmp UltimaSaida, 0
    je dontwork9
    mov Saida, 9
    jmp finish9

    dontwork9:
    mov UltimaSaida, 9
    jmp finish9



    finish9:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock9:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock9

    push 97 ;starty
    push 181 ;startx
    push 77 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 181 ;x coordinate
    call printNine
    push[EnderecoDeRetorno5]
    ret
endp highlightNine

proc highlightZero
    pop[EnderecoDeRetorno5]
    push 187 ;starty
    push 156 ;startx
    push 167 ;endy
    push 136 ;endx
    push 4 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 156 ;x coordinate
    call printZero

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp PrimeiroDigito, 1
    je isPrimeiroDigitoZero

    xor dx,dx
    mov ax, UltimaSaida
    add ax, Saida
    mov bx, 0ah
    mul bx
    add ax, 0
    mov Saida, 0
    mov UltimaSaida, ax
    call printAccordingly
    jmp finish0


    isPrimeiroDigitoZero:

    mov PrimeiroDigito, 0
    ;prints zero to the screen
    push 0
    push 47
    push 207
    call printZero

    cmp boleanoAdicao,1
    jne n01
    jmp allreadyoperated0
    n01:
    cmp BoleanoSubracao,1
    jne n02
    jmp allreadyoperated0
    n02:
    cmp BoleanoMultiplicacao,1
    jne n03
    jmp allreadyoperated0
    n03:
    cmp BoleanoDivisao,1
    jne didntoperate0

    allreadyoperated0:
    mov ax, UltimaSaida
mov PreUltimaSaida, ax
    mov UltimoUso, 1
    mov UltimaSaida, 0

    didntoperate0:
    cmp UltimaSaida, 0
    je dontwork0
    mov Saida, 0
    jmp finish0

    dontwork0:
    mov UltimaSaida, 0
    jmp finish0



    finish0:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock10:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock10

    push 187 ;starty
    push 156 ;startx
    push 167 ;endy
    push 136 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 156 ;x coordinate
    call printZero
    push[EnderecoDeRetorno5]
    ret
endp highlightZero

proc highlightEqualsSign
    pop[EnderecoDeRetorno8]
    push 187 ;starty
    push 181 ;startx
    push 167 ;endy
    push 161 ;endx
    push 3 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 181 ;x coordinate
    call printEqualsSign

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    mov PrimeiroDigito, 1

    cmp UltimoUso, 1
    je checkdivide

    cmp boleanoAdicao,1
    jne checkminus
    mov boleanoAdicao, 0
    mov ax, Saida
    add ax, UltimaSaida
    call printAccordingly
    jmp clockWork

    checkminus:
    cmp BoleanoSubracao, 1
    jne ceckmultiply
    mov BoleanoSubracao, 0
    mov ax, UltimaSaida
    sub ax, Saida
    call printAccordingly
    jmp clockWork

    ceckmultiply:
    cmp BoleanoMultiplicacao, 1
    jne checkdivide
    mov BoleanoMultiplicacao, 0
    mov ax, Saida
    xor dx,dx
    mul UltimaSaida
    mov saver4, ax
    call printAccordingly
    mov ax, saver4
    mov Saida, 0
    jmp clockWork

    checkdivide:
    cmp UltimoUso, 1
    je usingPreUltima
    cmp BoleanoDivisao, 1
    jne    printRegular
    mov BoleanoDivisao, 0
    mov ax, UltimaSaida
    xor dx, dx
mov bx, Saida
    div bx
    mov saver4, ax
    call printAccordingly
    mov ax, saver4
    mov Saida, 0
    jmp clockWork

    printRegular:
    call printAccordingly
    jmp clockWork



    usingPreUltima:

    cmp boleanoAdicao,1
    jne checkminus2
    mov boleanoAdicao, 0
    mov ax, UltimaSaida
    add ax, PreUltimaSaida
    call printAccordingly
    jmp clockWork

    checkminus2:
    cmp BoleanoSubracao, 1
    jne ceckmultiply2
    mov BoleanoSubracao, 0
    mov ax, PreUltimaSaida
    sub ax, UltimaSaida
    call printAccordingly
    jmp clockWork

    ceckmultiply2:
    cmp BoleanoMultiplicacao, 1
    jne checkdivide2
    mov BoleanoMultiplicacao, 0
    mov ax, UltimaSaida
    xor dx,dx
    mov bx, PreUltimaSaida
    mul bx
    mov saver4, ax
    call printAccordingly
    mov ax, saver4
    mov UltimaSaida, 0
    jmp clockWork

    checkdivide2:
    cmp BoleanoDivisao, 1
    jne    printRegular2
    mov BoleanoDivisao, 0
    mov ax, PreUltimaSaida
    xor dx, dx
    mov bx, UltimaSaida
    div bx
    mov saver4, ax
    call printAccordingly
    mov ax, saver4
    mov UltimaSaida, 0
    jmp clockWork

    printRegular2:
    call printAccordingly
    jmp clockWork


    clockWork:
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock11:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock11

    push 187 ;starty
    push 181 ;startx
    push 167 ;endy
    push 161 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 181 ;x coordinate
    call printEqualsSign
    push[EnderecoDeRetorno8]
    ret
endp highlightEqualsSign

proc highlightDivisionSign
    pop[EnderecoDeRetorno8]
    push 187 ;starty
    push 206 ;startx
    push 167 ;endy
    push 186 ;endx
    push 3 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 206 ;x coordinate
    call printDivisionSign
;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp Saida , 0
    je clockWork3
    mov ax, Saida
    div UltimaSaida
    mov saver4, ax
    call printAccordingly
    mov BoleanoDivisao, 1
    mov ax, saver4
    mov UltimaSaida, ax
    mov Saida, 1

    clockWork3:
    mov PrimeiroDigito, 1
    mov ax, UltimaSaida
    call printAccordingly
    mov BoleanoDivisao, 1
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock12:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock12

    push 187 ;starty
    push 206 ;startx
    push 167 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 187 ;y coordinate
    push 206 ;x coordinate
    call printDivisionSign
    push[EnderecoDeRetorno8]
    ret
endp highlightDivisionSign

proc highlightMultiplicationSign
    pop[EnderecoDeRetorno8]
    push 157 ;starty
    push 206 ;startx
    push 137 ;endy
    push 186 ;endx
    push 3 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 206 ;x coordinate
    call printMultiplicationSign

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp Saida, 0
    je clockWork2
    mov ax, Saida
    mul UltimaSaida
    mov saver4, ax
    call printAccordingly
    mov ax, saver4
    mov UltimaSaida, ax
    mov BoleanoMultiplicacao, 1
    mov Saida, 1

    clockWork2:
    mov PrimeiroDigito, 1
    mov ax, UltimaSaida
    call printAccordingly
    mov BoleanoMultiplicacao, 1
    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock13:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock13

    push 157 ;starty
    push 206 ;startx
    push 137 ;endy
    push 186 ;endx
push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 157 ;y coordinate
    push 206 ;x coordinate
    call printMultiplicationSign
    push[EnderecoDeRetorno8]
    ret
endp highlightMultiplicationSign

proc highlightMinusSign
    pop[EnderecoDeRetorno8]
    push 127 ;starty
    push 206 ;startx
    push 107 ;endy
    push 186 ;endx
    push 3 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 206 ;x coordinate
    call printMinusSign

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    mov PrimeiroDigito, 1
    mov ax, UltimaSaida
    sub ax, Saida
    mov saver4, ax
    call printAccordingly
    mov BoleanoSubracao ,1
    mov Saida, 0
    mov ax, saver4
    mov UltimaSaida ,ax
    mov PrimeiroDigito, 1


    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock14:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock14

    push 127 ;starty
    push 206 ;startx
    push 107 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 127 ;y coordinate
    push 206 ;x coordinate
    call printMinusSign
    push[EnderecoDeRetorno8]
    ret
endp highlightMinusSign

proc highlightPlusSign
    pop[EnderecoDeRetorno8]
    push 97 ;starty
    push 206 ;startx
    push 77 ;endy
    push 186 ;endx
    push 3 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 206 ;x coordinate
    call printPlusSign

    ;clears screen temporary!
    push 67 ;starty
    push 207 ;startx
    push 7 ;endy
    push 111 ;endx
    push 15 ;cor
    call printRectangle

    cmp PrimeiroDigito, 1
    je isPrimeiroDigito2

    mov PrimeiroDigito, 1


    isPrimeiroDigito2:
    xor ax,ax
    mov ax, Saida
    add ax, UltimaSaida
    mov saver4, ax
    call printAccordingly
    mov boleanoAdicao, 1
mov Saida, 0
    mov ax, saver4
    mov UltimaSaida ,ax
    mov PrimeiroDigito, 1

    mov ah, 2ch
    int 21h
    mov saver1, dx
    readClock15:
    mov ah, 2ch
    int 21h
    sub dx, saver1
    cmp dx, 50
    jl readClock15

    push 97 ;starty
    push 206 ;startx
    push 77 ;endy
    push 186 ;endx
    push 25 ;cor
    call printRectangle
    push 0 ;cor
    push 97 ;y coordinate
    push 206 ;x coordinate
    call printPlusSign
    push[EnderecoDeRetorno8]
    ret
endp highlightPlusSign

proc printAccordingly;prints the value that is in ax to the screen of the calculator


    cmp ax, 09h
    jle smaller
    jmp bigger

    smaller:
    pop[EnderecoDeRetorno6]
    cmp ax, 0
    jne next
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    call printZero
    push[EnderecoDeRetorno6]
    jmp jumper
    next:
    cmp ax, 1
    jne next2
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printOne
    push[EnderecoDeRetorno6]
    jmp jumper
    next2:
    cmp ax, 2
    jne next3
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printTwo
    push[EnderecoDeRetorno6]
    jmp jumper
    next3:
    cmp ax, 3
    jne next4
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printThree
    push[EnderecoDeRetorno6]
    jmp jumper
    next4:
    cmp ax, 4
    jne    next5
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFour
push[EnderecoDeRetorno6]
    jmp jumper
    next5:
    cmp ax, 5
    jne    next6
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFive
    push[EnderecoDeRetorno6]
    jmp jumper
    next6:
    cmp ax, 6
    jne next7
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSix
    push[EnderecoDeRetorno6]
    jmp jumper
    next7:
    cmp ax, 7
    jne    next8
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSeven
    push[EnderecoDeRetorno6]
    jmp jumper
    next8:
    cmp ax, 8
    jne    next9
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printEight
    push[EnderecoDeRetorno6]
    jmp jumper
    next9:
    cmp ax, 9
    jne jumper
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printNine
    push[EnderecoDeRetorno6]
    jmp jumper

    bigger:
    cmp ax, 0fh
    jle notevenbigger
    jmp evenbigger
    jumper:
    jmp endofproc

    notevenbigger:
        pop[EnderecoDeRetorno10]
        cmp ax, 0ah
        jne next10
        mov saver4, ax
        mov ax, 0
        mov casa, 0 
        call printAccordingly2
        next10:

        cmp ax, 0bh
        jne next11
        mov saver4, ax
        mov ax, 1
        mov casa, 0
        call printAccordingly2
        next11:

        cmp ax, 0ch
        jne next12
        mov saver4, ax
        mov ax, 2
        mov casa, 0
call printAccordingly2
        next12:

        cmp ax, 0dh
        jne next13
        mov saver4, ax
        mov ax, 3
        mov casa, 0
        call printAccordingly2
        next13:

        cmp ax, 0eh
        jne next14
        mov saver4, ax
        mov ax, 4
        mov casa, 0
        call printAccordingly2
        next14:

        cmp ax, 0fh
        jne next15
        mov saver4, ax
        mov ax, 5
        mov casa, 0
        call printAccordingly2
        next15:


        mov ax, 1
        inc casa
        call printAccordingly2
        dec casa
        mov ax, saver4
        push[EnderecoDeRetorno10]
        jmp endofproc

    evenbigger:
        mov casa, 0
        xor dx,dx
        mov bx, 0ah
        div bx
        mov saver5, ax
        mov ax, dx
        pop[EnderecoDeRetorno11]
        call printAccordingly2
        inc casa
        mov ax, saver5
        call printAccordingly2
        push[EnderecoDeRetorno11]


    endofproc:


    ret
endp printAccordingly

proc printAccordingly2



    cmp ax, 09h
    jle smaller2
    jmp bigger2

    smaller2:
    pop[EnderecoDeRetorno12]
    cmp ax, 0
    jne nextt
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    call printZero
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt:
    cmp ax, 1
    jne nextt2
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printOne
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt2:
    cmp ax, 2
    jne nextt3
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printTwo
    push[EnderecoDeRetorno12]
    jmp endofproc2
nextt3:
    cmp ax, 3
    jne nextt4
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printThree
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt4:
    cmp ax, 4
    jne    nextt5
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFour
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt5:
    cmp ax, 5
    jne    nextt6
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFive
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt6:
    cmp ax, 6
    jne nextt7
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSix
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt7:
    cmp ax, 7
    jne    nextt8
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSeven
    push[EnderecoDeRetorno12]
    jmp endofproc2
    nextt8:
    cmp ax, 8
    jne    nextt9
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printEight
    push[EnderecoDeRetorno12]
    jmp jumpingtoend
    nextt9:
    cmp ax, 9
    jne    jumpingtoend
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printNine
    push[EnderecoDeRetorno12]
    jumpingtoend:
    jmp endofproc2

    bigger2:
    cmp ax, 0fh
jle notevenbigger2
    jmp evenbigger2

    notevenbigger2:
        pop[EnderecoDeRetorno13]
        cmp ax, 0ah
        jne nextt10
        mov saver4, ax
        mov ax, 0 
        call printAccordingly3
        nextt10:

        cmp ax, 0bh
        jne nextt11
        mov saver4, ax
        mov ax, 1
        call printAccordingly3
        nextt11:

        cmp ax, 0ch
        jne nextt12
        mov saver4, ax
        mov ax, 2
        call printAccordingly3
        nextt12:

        cmp ax, 0dh
        jne nextt13
        mov saver4, ax
        mov ax, 3
        call printAccordingly3
        nextt13:

        cmp ax, 0eh
        jne nextt14
        mov saver4, ax
        mov ax, 4
        call printAccordingly3
        nextt14:

        cmp ax, 0fh
        jne nextt15
        mov saver4, ax
        mov ax, 5
        call printAccordingly3
        nextt15:


        mov ax, 1
        inc casa
        call printAccordingly3
        dec casa
        mov ax, saver4
        push[EnderecoDeRetorno13]
        jmp endofproc2

    evenbigger2:
        ;mov casa, 0
        xor dx,dx
        mov bx, 0ah
        div bx
        mov saver5, ax
        mov ax, dx
        pop[EnderecoDeRetorno14]
        call printAccordingly3
        mov ax, saver5
        inc casa
        call printAccordingly3
        push[EnderecoDeRetorno14]


    endofproc2:
    ret
endp printAccordingly2

proc printAccordingly3

    cmp ax, 09h
    jle smaller3
    jmp bigger3

    smaller3:
    pop[EnderecoDeRetorno16]
    cmp ax, 0
    jne nexttt
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    call printZero
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt:
    cmp ax, 1
    jne nexttt2
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printOne
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt2:
    cmp ax, 2
    jne nexttt3
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printTwo
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt3:
    cmp ax, 3
    jne nexttt4
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printThree
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt4:
    cmp ax, 4
    jne    nexttt5
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFour
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt5:
    cmp ax, 5
    jne    nexttt6
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printFive
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt6:
    cmp ax, 6
    jne nexttt7
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSix
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt7:
    cmp ax, 7
    jne    nexttt8
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax
    mov ax, saver
    call printSeven
    push[EnderecoDeRetorno16]
    jmp endofproc3
    nexttt8:
    cmp ax, 8
    jne    nexttt9
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
        push 47
    push ax
mov ax, saver
    call printEight
    push[EnderecoDeRetorno16]
    jmp jumpingtoend2
    nexttt9:
    cmp ax, 9
    jne    jumpingtoend2
    mov saver, ax
    mov ax, casa
    mov bx, 20
    mul bx
    mov bx, ax
    mov ax, 202
    sub ax, bx
    push 4
    push 47
    push ax 
    mov ax, saver
    call printNine
    push[EnderecoDeRetorno16]
    jumpingtoend2:
    jmp endofproc3

    bigger3:
    cmp ax, 0fh
    jle notevenbigger3
    jmp evenbigger3

    notevenbigger3:
        pop[EnderecoDeRetorno17]
        cmp ax, 0ah
        jne nexttt10
        mov saver4, ax
        mov ax, 0 
        call printAccordingly3
        nexttt10:

        cmp ax, 0bh
        jne nexttt11
        mov saver4, ax
        mov ax, 1
        call printAccordingly3
        nexttt11:

        cmp ax, 0ch
        jne nexttt12
        mov saver4, ax
        mov ax, 2
        call printAccordingly3
        nexttt12:

        cmp ax, 0dh
        jne nexttt13
        mov saver4, ax
        mov ax, 3
        call printAccordingly3
        nexttt13:

        cmp ax, 0eh
        jne nexttt14
        mov saver4, ax
        mov ax, 4
        call printAccordingly3
        nexttt14:

        cmp ax, 0fh
        jne nexttt15
        mov saver4, ax
        mov ax, 5
        call printAccordingly3
        nexttt15:


        mov ax, 1
        inc casa
        call printAccordingly3
        dec casa
        mov ax, saver4
        push[EnderecoDeRetorno17]
        jmp endofproc3

    evenbigger3:
        mov casa, 0
        xor dx,dx
        mov bx, 0ah
        div bx
        mov saver5, ax
        mov ax, dx
        pop[EnderecoDeRetorno18]
        call printAccordingly3
        mov ax, saver5
        inc casa
        call printAccordingly3
        push[EnderecoDeRetorno18]


    endofproc3:

    ret
endp printAccordingly3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start:
    mov ax,@data
    mov ds,ax

    ;Graphic mode
    mov ax,13h
    int 10h


    call printCalculator

    ;Mouse initialization
    mov ax,0h
    int 33h

    ;Presenting mouse on the screen
    mov ax,1h
    int 33h

    Update:

    cmp ImpressaoDeBotoes, 1
    jne dontprint
    mov ImpressaoDeBotoes, 0
    call printButtons
    dontprint:

    ;BOTAO LIMPAR
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skipit
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 111
    jl skipit
    cmp ax, 131
    jg skipit
    cmp dx, 167
    jl skipit
    cmp dx, 187
    jg skipit
    mov ImpressaoDeBotoes, 1
    call highlightClear
    skipit:

    ;BOTAO UM
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 111
    jl skip
    cmp ax, 131
    jg skip
    cmp dx, 137
    jl skip
    cmp dx, 157
    jg skip
    mov ImpressaoDeBotoes, 1
    call highlightOne
    skip:

    ;BOTAO DOIS
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip2
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 136
    jl skip2
    cmp ax, 156
    jg skip2
    cmp dx, 137
    jl skip2
    cmp dx, 157
    jg skip2
    mov ImpressaoDeBotoes, 1
    call highlightTwo
    skip2:

    ;BOTAO TRES
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip3
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 161
    jl skip3
    cmp ax, 181
    jg skip3
    cmp dx, 137
    jl skip3
    cmp dx, 157
    jg skip3
    mov ImpressaoDeBotoes, 1
    call highlightThree
    skip3:

    ;BOTAO QUATRO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip4
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 111
    jl skip4
    cmp ax, 131
    jg skip4
    cmp dx, 107
    jl skip4
    cmp dx, 127
    jg skip4
    mov ImpressaoDeBotoes, 1
    call highlightFour
    skip4:

    ;BOTAO CINCO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip5
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 136
    jl skip5
    cmp ax, 156
    jg skip5
    cmp dx, 107
    jl skip5
    cmp dx, 127
    jg skip5
    mov ImpressaoDeBotoes, 1
    call highlightFive
    skip5:

    ;BOTAO SEIS
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip6
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 161
    jl skip6
    cmp ax, 181
    jg skip6
    cmp dx, 107
    jl skip6
    cmp dx, 127
    jg skip6
    mov ImpressaoDeBotoes, 1
    call highlightSix
    skip6:

    ;BOTAO SETE
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip7
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 111
    jl skip7
    cmp ax, 131
    jg skip7
    cmp dx, 77
    jl skip7
    cmp dx, 97
    jg skip7
    mov ImpressaoDeBotoes, 1
    call highlightSeven
    skip7:

    ;BOTAO OITO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip8
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 136
    jl skip8
    cmp ax, 156
    jg skip8
    cmp dx, 77
    jl skip8
    cmp dx, 97
    jg skip8
    mov ImpressaoDeBotoes, 1
    call highlightEight
    skip8:

    ;BOTAO NOVE
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip9
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 161
    jl skip9
    cmp ax, 181
    jg skip9
    cmp dx, 77
    jl skip9
    cmp dx, 97
    jg skip9
    mov ImpressaoDeBotoes, 1
    call highlightNine
    skip9:

    ;BOTAO ZERO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip10
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 136
    jl skip10
    cmp ax, 156
    jg skip10
    cmp dx, 167
    jl skip10
    cmp dx, 187
    jg skip10
    mov ImpressaoDeBotoes, 1
    call highlightZero
    skip10:

    ;BOTAO = RESULTADO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip11
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 161
    jl skip11
    cmp ax, 181
    jg skip11
    cmp dx, 167
    jl skip11
    cmp dx, 187
    jg skip11
    mov ImpressaoDeBotoes, 1
    call highlightEqualsSign
    skip11:

    ;BOTAO / DIVISAO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip12
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 186
    jl skip12
    cmp ax, 206
    jg skip12
    cmp dx, 167
    jl skip12
    cmp dx, 187
    jg skip12
    mov ImpressaoDeBotoes, 1
    call highlightDivisionSign
    skip12:

    ;BOTAO * MULTIPLICACAO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip13
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 186
    jl skip13
    cmp ax, 206
    jg skip13
    cmp dx, 137
    jl skip13
    cmp dx, 157
    jg skip13
    mov ImpressaoDeBotoes, 1
    call highlightMultiplicationSign
    skip13:

    ;BOTAO - SUBTRACAO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip14
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 186
    jl skip14
    cmp ax, 206
    jg skip14
    cmp dx, 107
    jl skip14
    cmp dx, 127
    jg skip14
    mov ImpressaoDeBotoes, 1
    call highlightMinusSign
    skip14:

    ;BOTAO + ADICAO
    xor bx,bx
    mov ax,3h
    mov saver,dx
    int 33h
    cmp bx,1
    jne skip15
    xor dx,dx
    mov ax,cx
    mov cx,2
    div cx
    mov dx, saver
    cmp ax, 186
    jl skip15
    cmp ax, 206
    jg skip15
    cmp dx, 77
    jl skip15
    cmp dx, 97
    jg skip15
    mov ImpressaoDeBotoes, 1
    call highlightPlusSign
    skip15:

    jmp Update

    ;Aguarda pressionamento da tecla do teclado
    mov ah,00h
    int 16h

    ;Volta ao modo texto
    mov ah,0
    mov al,2
    int 10h




exit:
    mov ax,4c00h
    int 21h
END start