; TAKE 3 NUMBERS AS USER INPUT AND FIND THE NUMBER THAT SITS BETWEEN THE NUMBERS WITH A MNIMAL DISTANCE AT MOST

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    X DW ?
    Y DW ?
    Z DW ?
    N DW 3
    
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINTN ''
    PRINT 'X: '
    CALL SCAN_NUM
    MOV X, CX
    PRINT ' '
    
    XOR CX, CX
    
    PRINT 'Y: '
    CALL SCAN_NUM
    MOV Y, CX
    PRINT ' '
    
    XOR CX, CX
    
    PRINT 'Z: '
    CALL SCAN_NUM
    MOV Z, CX
    PRINTN ''
    
    MOV AX, X
    ADD AX, Y
    ADD AX, Z
            
    MOV BX, 3           
    DIV BX 
    PRINT 'THE NUM IS: '
    CALL PRINT_NUM
    PRINTN ''        
             
    MOV AX, N
    MOV CX, AX ;INITIALIZE THE COUNTER
    XOR BX, BX
    XOR AX, AX
    
    PRINTN ''
    
  
    
    RETURN:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN
