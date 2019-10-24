        .MODEL SMALL
        .STACK  64
        .DATA
ARR     DB  01H, 02H, 03H, 04H, 05H

        .CODE
MAIN    PROC    FAR
        MOV     AX,@DATA
        MOV     DS,AX
        MOV     CL,05H
        MOV     BX,offset ARR
        MOV     AX,0000H
LOOP1:  ADD     AX,[BX]
        INC     BX
        DEC     CL
        JNZ     LOOP1
;LOOP1  END
        MOV     AH,02
        MOV     DL,AL
        INT     21H
        MOV     AH,4CH
        INT     21H
MAIN    ENDP
END     MAIN