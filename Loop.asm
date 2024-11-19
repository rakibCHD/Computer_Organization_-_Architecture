.MODEL SMALL
.STACK 100h

.DATA


Msg DB 0DH,0AH, ' ********** $';

.CODE

MAIN PROC 
    
    MOV AX, @DATA;
    MOV DS, AX; 
    
     
     
    MOV CX,10; 
    
myloop:
     
    LEA DX, Msg;
    MOV AH, 9h;
    INT 21h; 
     
    loop myloop;


    MOV AH, 4Ch;
    INT 21h;

MAIN ENDP
END MAIN