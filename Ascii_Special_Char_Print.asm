.MODEL SMALL
.STACK 100H

.DATA   
MSG1 DB 0DH, 0AH, 'Enter a number: $' 
MSG2 DB 0DH, 0AH, 'Number is: $'     
number DB ?

.CODE         
         
Main PROC
     
    MOV AH,2;   
       
    MOV CX,256; 
                         
    MOV DL,0; 

PRINT_LOOP: 
   
                       
    INT 21H;  
    
    INC DL;
    
    DEC CX;
    
    JNZ PRINT_LOOP;
      
    
    MOV AH, 4Ch; 
    INT 21H; 

Main ENDP
END MAIN
