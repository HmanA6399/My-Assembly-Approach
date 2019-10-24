;-----------------------------	
        .MODEL SMALL
        .STACK 64
;-----------------------------	

;-----------------------------	
        .DATA
;-----------------------------	
DATA_IN DW  1001H, 1002H, 1003H, 1004H, 1005H
        ORG 10
SUM     DW  ?


;-----------------------------	
        .CODE
;-----------------------------	
MAIN	PROC	FAR
        MOV	AX,@DATA
        MOV	DS,AX

        MOV DI,offset DATA_IN
        MOV CX,05H
        MOV AX,0000H

LOOP1:  ADD AX,[DI]
        INC DI
        INC DI
        DEC CX
        JNZ LOOP1

        MOV SI, offset SUM
        MOV [SI],BX
        
        MOV AH,4CH
        INT 21H
MAIN	ENDP
;-----------------------------	
END     MAIN