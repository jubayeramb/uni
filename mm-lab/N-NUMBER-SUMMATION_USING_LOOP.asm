; TAKE 2 PLAYERS SCORE UNTIL (CMP THE SUM IS GRATER THAN 50 OR NOT)

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    N DW ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINTN ''
    PRINT 'Enter the value of N: '
    CALL SCAN_NUM
    MOV N, CX
    PRINTN ''        
             
    MOV AX, N
    MOV CX, AX ;INITIALIZE THE COUNTER
    XOR BX, BX
    XOR AX, AX
    
    PRINTN ''

    START:
        ADD BX, CX
        INC AX
        CALL PRINT_NUM
        CMP AX, N
        JGE RESULT
        PRINT ' + '
    
    LOOP START ;CX decrements automatically on each itaration
    
    RESULT:
        PRINT ' = '
        MOV AX, BX
        CALL PRINT_NUM
        PRINTN ''   
    
    RETURN:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN
