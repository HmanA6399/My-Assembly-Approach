		.MODEL SMALL
        .STACK 64
        .DATA
CGG     DB  "HeLLo WORLD!","$"
CAP_S   EQU  'A' ;41H
SM_S    EQU  'a' ;61H
CAP_E   EQU  'Z' ;5AH
SM_E    EQU  'z' ;7AH
TES     DB   4 DUP(?)
        .CODE
MAIN	PROC	FAR
        MOV	AX,@DATA
        MOV	DS,AX
        MOV SI,OFFSET CGG
RD:     MOV DL,[SI]
        CMP DL,'$'
        JZ STP
        CMP DL,CAP_S
        JC  JINC
        MOV CL,SM_E
        CMP CL,DL
        JC  JINC
        CMP DL,SM_S
        JC  GTCS
PRT:    CALL PRINT
        JMP JINC
GTCS:   MOV CL,CAP_E
        CMP CL,DL
        JC  JINC
        JMP PRT
JINC:   INC SI
        JMP RD

STP:    MOV AH,4CH
        INT 21H
MAIN	ENDP

PRINT   PROC        ;THE CHARACTER TO PRINT SHOULD BE STORED IN DL
        MOV AH,02H
        INT 21H
        RET
PRINT   ENDP

END		MAIN