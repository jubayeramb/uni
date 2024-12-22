; TAKE 2 PLAYERS SCORE UNTIL (CMP THE SUM IS GRATER THAN 50 OR NOT)

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    P1 DW ?
    P2 DW ?
    SUM DW ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    L3:
        XOR BX, BX
        MOV P1, BX
        MOV P2, BX
        MOV SUM, BX
     
        PRINTN ''
        PRINT 'PLAYER ONE SCORE: '
        CALL SCAN_NUM
        MOV P1, CX
        PRINTN ''
        
        PRINT 'PLAYER TWO SCORE: '
        CALL SCAN_NUM
        MOV P2, CX
        PRINTN ''
        
        XOR BX, 0
        ADD BX, P1
        ADD BX, P2
        MOV SUM, BX
        
        PRINTN ''
        PRINTN ''
        
        MOV AX, SUM
        CMP AX, 50 
        JGE L1
    
    L2: 
        PRINT 'FIRST PLAYER SCORE: '
        MOV AX, P1
        CALL PRINT_NUM
        PRINTN ''
        
        PRINT 'SECOND PLAYER SCORE: '
        MOV AX, P2
        CALL PRINT_NUM
        PRINTN ''
        
        JMP L3
      
    L1: 
        PRINT 'PARTNERSHIP 50'      
    
    
    RETURN:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN
