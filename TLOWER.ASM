        .MODEL SMALL
        .STACK 64

        .DATA
INPUTSTR        DB      "THis iS A TEsT MESsaGE"
RESULTSTR       DB      22 DUP(?)
CAP_S   EQU  'A'-1 ;41H
CAP_E   EQU  'Z'+1 ;5AH


        .CODE
MAIN	PROC	FAR
        MOV	AX,@DATA
        MOV	DS,AX
        MOV     SI, OFFSET INPUTSTR
        MOV     DI, OFFSET RESULTSTR
        MOV     CL,22
TL_LP:  MOV     AL,[SI]
        CMP     AL,CAP_E
        JNC     GO_ON
        MOV     AH,CAP_S
        CMP     AH,AL
        JNC     GO_ON
        ADD     AL,20H
GO_ON:  MOV     [DI],AL
        INC     SI
        INC     DI
        DEC     CX
        JNZ     TL_LP
        
        MOV     AH,4CH
        INT     21H
MAIN	ENDP

END		MAIN