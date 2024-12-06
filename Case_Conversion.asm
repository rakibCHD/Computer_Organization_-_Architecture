.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 0DH, 0AH, 'Enter a upercase letter: $' 
MSG2 DB 0DH, 0AH, 'It is in lower case: $'     
char DB ?,'$';

.CODE
Main PROC
    MOV AX, @Data; 
    MOV DS, AX; 
      
        ;Display MSG1
    LEA DX, MSG1; 
    MOV AH, 9; 
    INT 21H;
    
        ;Get a single character input
    MOV AH, 1; 
    INT 21H; 
    ADD AL, 20H; 
    MOV char, AL; 

        ;Display MSG2
    LEA DX, MSG2;
    MOV AH, 9; 
    INT 21H;

        ;Display the converted character
    MOV DL, char; 
    MOV AH, 2;  
    INT 21H;

        ;Exit the program
    MOV AH, 4Ch; 
    INT 21H; 

Main ENDP
END MAIN