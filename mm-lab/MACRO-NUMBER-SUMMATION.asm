INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    SUM DW 0

.CODE

ADD_NUM MACRO NUM1, NUM2
    MOV AX, NUM1
    ADD AX, NUM2
    MOV SUM, AX
ENDM

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX

    START:
        PRINTN ''
        PRINT 'Enter a number: '
        CALL SCAN_NUM
        CMP CX, 0
        JE RETURN
        ADD_NUM SUM, CX
        PRINTN ''
        PRINT 'Sum: '
        CALL PRINT_NUM
        JMP START
    
    RETURN:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN