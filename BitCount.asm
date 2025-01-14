.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 'Type a CHARACTER: $'
MSG2 DB 0dh,0ah, 'The ASCII code of: $'
MSG3 DB 0DH,0AH, 'IN binary is: $'
MSG4 DB 0dh,0ah, 'The number of 1 bits is: $'

.CODE
MAIN PROC
    
    MOV AX, @DATA  		; Initialize data segment
    MOV DS, AX
    
   
    LEA DX, MSG1		 ; Prompt user to type a character
    MOV AH, 9
    INT 21H
    
   
    MOV AH, 1			 ; Read a single character from user input
    INT 21H
    MOV BL, AL 			 ; Store character in BL register (ASCII value)
    
    
    LEA DX, MSG2		 ; Display ASCII code info
    MOV AH, 9
    INT 21H
    
    MOV DL, BL
    MOV AH, 2
    INT 21H   			; Display character

    
    LEA DX, MSG3		; Print the message " IN binary is"
    MOV AH, 9
    INT 21H

    			    	; Display the binary representation
    MOV CX, 8 			; We need to display 8 bits
    MOV BH, 0 			; To count the number of 1's

PRINT_BINARY:
    SHL BL, 1         	; Shift left to get the next bit
    JC PRINT_ONE      	; If carry flag is set, it means the bit was 1
    MOV DL, '0'       	; Otherwise, print '0'
    JMP PRINT_BIT

PRINT_ONE:
    MOV DL, '1'      	; Print '1'
    INC BH          	; Increment count of 1's
    
PRINT_BIT:
    MOV AH, 2
    INT 21H           	; Print the character in DL

    LOOP PRINT_BINARY   ; Loop until all 8 bits are processed

    				    ; Print the number of 1 bits message
    LEA DX, MSG4
    MOV AH, 9
    INT 21H
    
    			    	; Convert the count of 1's (in BH) to ASCII and print it
    ADD BH, '0'        	; Convert to ASCII
    MOV DL, BH
    MOV AH, 2
    INT 21H            	; Display the number of 1 bits

    				    ; Terminate the program
    MOV AH, 4Ch
    INT 21H

MAIN ENDP
END MAIN
