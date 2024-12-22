INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter a string or number: $'
    is_string DB 'This is a string.$'
    is_number DB 'This is a number.$'
    is_empty DB 'Input is empty.$'
    newline DB 0DH, 0AH, '$'
    buffer DB 21, ?, 21 DUP('$') ; Buffer for input (20 chars + '$')

.CODE

MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX

MainProgram:
    ; Display prompt
    PRINTN '' 
    LEA DX, prompt 
    MOV AH, 9 
    INT 21H

    ; Get input string
    LEA DX, buffer 
    MOV AH, 0Ah 
    INT 21H

    ; Print newline
    LEA DX, newline 
    MOV AH, 9 
    INT 21H

    ; Check if input is empty
    MOV AL, buffer[1] 
    CMP AL, 0 
    JE empty_input

    ; Initialize
    MOV SI, 2          ; Start from first character of input
    MOV CL, buffer[1]  ; Get the length of input
    MOV CH, 0          ; Clear CH for loop
    MOV BL, 1          ; Assume it's a number initially

check_loop:
    MOV AL, buffer[SI] ; Get current character
    ; Check if it's a number
    CMP AL, '0' 
    JL not_number 
    CMP AL, '9' 
    JG not_number 
    JMP continue_loop

not_number:
    MOV BL, 0          ; Set flag to indicate it's not a number

continue_loop:
    INC SI 
    LOOP check_loop

    ; After loop, check BL
    CMP BL, 1 
    JE number 
    JMP string

empty_input:
    LEA DX, is_empty 
    JMP print_result

number:
    LEA DX, is_number 
    JMP print_result 

string:
    LEA DX, is_string 

print_result:
    MOV AH, 9 
    INT 21H 

    JMP MainProgram

    ; Exit program
    MOV AH, 4CH 
    INT 21H

MAIN ENDP
END MAIN
