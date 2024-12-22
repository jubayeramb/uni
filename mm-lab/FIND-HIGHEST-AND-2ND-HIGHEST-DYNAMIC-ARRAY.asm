INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
ARR DW 100 DUP(?)  ; Dynamic array of max size 100
SIZE DW ?          ; To store array size

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; Get array size
    PRINT 'Enter array size: '
    CALL SCAN_NUM
    MOV SIZE, CX
    PRINTN ''
    
    ; Input elements
    MOV CX, SIZE
    MOV SI, 0
    INPUT_LOOP:
        PUSH CX
        PRINTN ''
        PRINT 'Enter number: '
        CALL SCAN_NUM
        MOV ARR[SI], CX
        ADD SI, 2
        POP CX
        LOOP INPUT_LOOP
    
    ; Sort in descending order
    MOV CX, SIZE
    DEC CX              ; outer loop counter = size-1
    OUTER_LOOP:
        MOV SI, 0
        PUSH CX
        INNER_LOOP:
            MOV AX, ARR[SI]
            MOV BX, ARR[SI+2]
            CMP AX, BX
            JGE SKIP_SWAP
            ; Swap elements
            XCHG AX, BX
            MOV ARR[SI], AX
            MOV ARR[SI+2], BX
            SKIP_SWAP:
            ADD SI, 2
            LOOP INNER_LOOP
        POP CX
        LOOP OUTER_LOOP
    

    PRINTN ''
    PRINTN ''
    PRINT 'Second highest number is: '
    MOV AX, ARR[2] 
    CALL PRINT_NUM
    PRINTN ''
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN