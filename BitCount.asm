.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Type a CHARACTER: $'
MSG2 DB 0dh,0ah, 'The ASCII code of: $'
MSG3 DB 0DH,0AH, 'IN binary is: $'
MSG4 DB 0dh,0ah, 'The number of 1 bits is: $'

.CODE 
MAIN PROC
   
    MOV AX,@DATA
    MOV DS,AX
    
   
    LEA DX,MSG1         ;load address of msg1 to dx
    MOV AH,9            ;display string function
    INT 21H             ;dos interrupt
    
  
    MOV AH,1            ;input character function
    INT 21H 
    
   
    XOR BH,BH          ;Clear BH (counter for 1 bits)
    MOV BL,AL          ;move input character to bl
    

    LEA DX, MSG2
    MOV AH,9           ;display string function 
    INT 21H     
    

    MOV DL,BL
    MOV AH,2            ;display character    
    INT 21H
    

    lea dx, msg3        ; Load address of msg3 into DX
    mov ah,9            ; Display string function
    int 21h
    
    MOV CX,8            ;loop counter 8
    MOV Bh,0            ;for 1
            
BINARY:
    SHL BL,1            ;Shift left
    JNC ZERO            ;Jump if carry flag is not set
    INC BH              ;increase bh by 1
    MOV DL, 31H
    JMP DISPLAY     
    
ZERO:
    MOV DL, 30h         ; keep 0 = 30h in dl
    
DISPLAY:
    MOV AH,2            ;display character
    INT 21H             ;dos interrupt
    
    LOOP BINARY         ;
    ADD BH,30H          ;Convert the 1-bit count to ASCII
    

    LEA DX, MSG4        ;Load address of msg4 into DX
    MOV AH,9
    INT 21H
    
    MOV DL,BH           ;Move 1-bit count to DL for display
    MOV AH,2
    INT 21H   
    
    
    EXIT: 
    MOV AH, 4Ch        ; DOS interrupt to exit
    INT 21H  
    
MAIN ENDP
END MAIN
