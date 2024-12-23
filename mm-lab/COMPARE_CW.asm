INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    D1 DW 10
    D2 DW 20

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AX, D1
    MOV BX, D2
    
    CMP AX, BX
    JA L1
    
    L1:
        PRINT 'TESTING NUMBER ABOVE'
        JMP RETURN
    
    L2:
        PRINT 'TESTING NUMBER NOT ABOVE'
    
    
    RETURN:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

;--DECLARING THESE PRE-DEFINED FUNCTIONS FROM 
;THE 'EMU8086.INC'FOR LATER USE IN THE PROGRAM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN