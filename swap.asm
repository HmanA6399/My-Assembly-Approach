;-------------------------------------------
;   8086 MASM Application to implement XOR
;   swap algorithm
;
;   author: HmanA6399
;-------------------------------------------

;-----------------------------------
    .MODEL SMALL
    .STACK 64
;-----------------------------------

;-----------------------------------
    .DATA
;-----------------------------------
A   DB  10H
B   DB  20H

;-----------------------------------
    .CODE
;-----------------------------------
MAIN    PROC    FAR
        MOV     AX,@DATA
        MOV     DS,AX

        MOV     AL,A
        MOV     AH,B

        XOR     AL,AH
        XOR     AH,AL
        XOR     AL,AH

        MOV A,AL
        MOV B,AH

        MOV AH,4CH
        INT 21H
        MAIN    ENDP

END MAIN