.MODEL SMALL
.STACK 100h
 
.DATA

Msg DB 0DH,0AH, '********** $';

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, Msg
    MOV AH, 9h
    INT 21h

    MOV AH, 4Ch ; Exit program
    INT 21h

MAIN ENDP
END MAIN
