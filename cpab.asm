	.MODEL SMALL
        .STACK 64
        .DATA
DSRC    DB      10H, 20H, 30H, 40H, 50H, 60H
DDST    DB      6 DUP(?)
        .CODE
MAIN	PROC	FAR
        MOV	AX,@DATA
        MOV	DS,AX
        MOV     SI, OFFSET DSRC
        MOV     DI, OFFSET DDST
        MOV     CX,06H

CP_LP:  MOV     AL,[SI]
        MOV     [DI],AL
        INC     SI
        INC     DI
        DEC     CX
        JNZ     CP_LP

        MOV     AH,4CH
        INT     21H
MAIN	ENDP

END		MAIN