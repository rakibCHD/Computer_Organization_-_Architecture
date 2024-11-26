.MODEL SMALL
.STACK 100H

.DATA   
MSG1 DB 0DH, 0AH, 'Enter a number: $' 
MSG2 DB 0DH, 0AH, 'Number is: $'     
number DB ?

.CODE         
         
Main PROC 
    MOV AX, @Data        
    MOV DS, AX; 

                         
    LEA DX, MSG1; 
    MOV AH, 9; 
    INT 21H;
   
                         
    MOV AH,1; 
    INT 21H;  
    
    SUB AL, '0'; 
    MOV number, AL;        
    
    
    ADD number,'0';
   

    LEA DX, MSG2;
    MOV AH, 9; 
    INT 21H;    
    
    MOV DL, number;  
    MOV AH, 2;    
    INT 21H;

    
    
    MOV AH, 4Ch; 
    INT 21H; 

Main ENDP
END MAIN
