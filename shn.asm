;-----------------------------------
;   A PROGRAM TO PRINT A NUMBER WITH THE DESIRED BASE
;   STORE THE NUMBER IN DENT AND THE BASE IN BAS
;   AUTHOR: HmanA6399
;-----------------------------------

    .MODEL SMALL
    .STACK 64

    .DATA
DENT    DW  0222H
        ORG 10
DEGS    DB  10 DUP(?)
BAS     DB  0AH
    .CODE
MAIN    PROC    FAR
        MOV     AX,@DATA
        MOV     DS,AX
        MOV     CL,00H
        MOV     DI,offset DEGS
        MOV     BH,0
        MOV     AX,DENT

ST_LP:  DIV     BAS
        MOV     BL,AH
        PUSH    BX
        INC     CL
        MOV     AH,00H
        ADD     AL,00H
        JNZ     ST_LP

SH_LP:  POP     DX
        MOV     DH,00H
        ADD     DL,30H
        MOV     AH,02
        INT     21H
        DEC     CL
        JNZ     SH_LP

        MOV     AH,4CH
        INT     21H
MAIN    ENDP
        END     MAIN