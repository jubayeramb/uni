INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'Enter a string of letters: $'
    is_vowel DB 'This is a vowel.$'
    is_consonant DB 'This is a consonant.$'
    not_alpha DB 'This is not a valid alphabet character.$'
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

    ; Initialize
    MOV SI, 2           ; Start from first character of input
    MOV CL, buffer[1]   ; Get the length of input
    MOV CH, 0           ; Clear CH for loop

check_loop:
    MOV AL, buffer[SI]  ; Get current character
    ; Check if it's a valid alphabet character
    CMP AL, 'A'
    JL not_alphabet
    CMP AL, 'Z'
    JLE check_vowel
    CMP AL, 'a'
    JL not_alphabet
    CMP AL, 'z'
    JG not_alphabet

check_vowel:
    ; Convert to uppercase for uniformity
    CMP AL, 'a'
    JB skip_conversion
    SUB AL, 20H
skip_conversion:

    ; Check if it's a vowel
    CMP AL, 'A'
    JE vowel
    CMP AL, 'E'
    JE vowel
    CMP AL, 'I'
    JE vowel
    CMP AL, 'O'
    JE vowel
    CMP AL, 'U'
    JE vowel
    JMP consonant

vowel:
    LEA DX, is_vowel
    JMP print_result

consonant:
    LEA DX, is_consonant
    JMP print_result

not_alphabet:
    LEA DX, not_alpha

print_result:
    MOV AH, 9
    INT 21H
    ; Print newline
    LEA DX, newline
    MOV AH, 9
    INT 21H
    ; Continue to next character
    INC SI
    LOOP check_loop

    JMP MainProgram

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
