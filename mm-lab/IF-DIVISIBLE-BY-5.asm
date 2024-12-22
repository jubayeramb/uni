INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter a number (0-65535): $'
    divisible_msg DB 'The number is DIVISIBLE BY 5$'
    not_divisible_msg DB 'The number is NOT DIVISIBLE BY 5$'
    error_msg DB 'Invalid input. Please enter a valid number.$'
    newline DB 13, 10, '$'
    V1 DW ?   ; Variable to store the input number

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

INPUT:
    ; Display prompt
    LEA DX, prompt
    MOV AH, 9
    INT 21H

    ; Get input
    CALL SCAN_NUM
    JC INVALID_INPUT ; Jump if carry flag is set (error occurred)

    CMP CX, 65535
    JA INVALID_INPUT ; Jump if above 65535
    MOV V1, CX

    LEA DX, newline
    MOV AH, 9
    INT 21H

    MOV AX, V1
    MOV DX, 0
    MOV BX, 5
    DIV BX
    CMP DX, 0
    JE DIVISIBLE
    JNE NOT_DIVISIBLE

INVALID_INPUT:
    LEA DX, error_msg
    MOV AH, 9
    INT 21H
    JMP INPUT ; Loop back to input prompt

DIVISIBLE:
    LEA DX, divisible_msg
    JMP PRINT_RESULT

NOT_DIVISIBLE:
    LEA DX, not_divisible_msg

PRINT_RESULT:
    MOV AH, 9
    INT 21H
    PRINTN ''
    PRINTN ''

    ; Go back to input prompt for the next number
    JMP INPUT

    ; Exit the program (not reachable due to infinite loop)
    MOV AH, 4CH
    INT 21H

MAIN ENDP
DEFINE_SCAN_NUM
END MAIN
