INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    C1 DW 260
    F1 DW 1000
    
    F_VAR DW ?
    C_VAR DW ?

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, C1
    MOV BX, 9
    MUL BX
    MOV BX, 5
    DIV BX
    ADD AX, 32
    MOV F_VAR, AX
    
    PRINT '260C in Fahrenheit: '
    MOV AX, F_VAR
    CALL PRINT_NUM
    
    MOV AX, F1
    SUB AX, 32
    MOV BX, 5
    MUL BX
    MOV BX, 9
    DIV BX
    ADD AX, 1
    MOV C_VAR, AX
    PRINTN ''
    
    PRINT '1000F in Celsius: '
    MOV AX, C_VAR
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
