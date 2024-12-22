INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    D1 DW 100
    D2 DW 20
    
    D3 DB 75
    D4 DB 15

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Word Data Addition: '
    MOV AX, D1
    CALL PRINT_NUM
    PRINT ' + '
    MOV AX, D2
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- WORD DATA ADDITION
    ADD AX, D1
    CALL PRINT_NUM
    PRINTN ''
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Byte Data Addition: '
    MOV AL, D3
    CALL PRINT_NUM
    PRINT ' + '
    MOV AL, D4
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- BYTE DATA ADDITION
    MOV AL, D3
    ADD AL, D4
    CALL PRINT_NUM
    PRINTN ''
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Word Data Subtraction: '
    MOV AX, D1
    CALL PRINT_NUM
    PRINT ' - '
    MOV AX, D2
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- WORD DATA SUBTRACTION
    MOV AX, D1
    SUB AX, D2
    CALL PRINT_NUM
    PRINTN ''
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Byte Data Subtraction: '
    MOV AL, D3
    CALL PRINT_NUM
    PRINT ' - '
    MOV AL, D4
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- BYTE DATA SUBTRACTION
    MOV AL, D3
    SUB AL, D4
    CALL PRINT_NUM
    PRINTN ''
    
    ;--DYNAMIC PRINTING METHOD
    PRINT 'Word Data Multiplication: '
    MOV AX, D1
    CALL PRINT_NUM
    PRINT ' * '
    MOV AX, D2
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- MULTIPLICATION
    MUL D1
    CALL PRINT_NUM
    PRINTN ''
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Byte Data Multiplication: '
    XOR AX, AX
    MOV AL, D3
    CALL PRINT_NUM
    PRINT ' * '
    MOV AL, D4
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- BYTE DATA MULTIPLICATION
    MOV AL, D3
    MOV BL, D4
    MUL BL
    CALL PRINT_NUM
    PRINTN ''
    
    ;--DYNAMIC PRINTING METHOD
    PRINT 'Word Data Division: '
    MOV AX, D1
    CALL PRINT_NUM
    PRINT ' / '
    MOV AX, D2
    CALL PRINT_NUM
    PRINT ' = '
    
    ;--THE DIVISION OPERATION
    MOV AX, D1
    DIV D2           ;--ONLY REGISTER OR VARIABLE IS ACCEPTABLE FOR 'DIV' COMMAND; NOT DIRECT VALUE
    CALL PRINT_NUM
    PRINTN ''
    
    ;-- DYNAMIC PRINTING METHOD
    PRINT 'Byte Data Division: '
    MOV AL, D3
    CALL PRINT_NUM
    PRINT ' / '
    MOV AL, D4
    CALL PRINT_NUM
    PRINT ' = '
    
    ;-- BYTE DATA DIVISION
    MOV AL, D3
    DIV D4
    CALL PRINT_NUM
    PRINTN ''
    
    
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