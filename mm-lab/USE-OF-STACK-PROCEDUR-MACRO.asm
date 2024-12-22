INCLUDE 'EMU8086.INC'
.MODEL SAMLL
.STACK 100H

.DATA
ARR DW DUP(100) ?
ODD_ARR DW DUP(100) ?
EVEN_ARR DW DUP(100) ?
N DW ?

.CODE    
ENTER_NUMBERS MACRO ARR, N    
     MOV CX, N
     MOV SI, 0
     ENTER:
     PRINT 'ENTER AN ELEMENT: '
     PUSH CX
     CALL SCAN_NUM
     MOV ARR[SI], CX  
     ADD SI, 2
     POP CX
     PRINTN ''
     LOOP ENTER

    ; CALL FIND_ODD_EVEN

ENDM

                       
PRINT_ARRAY MACRO ARRAY
    MOV CX, N
    MOV SI, 0
    PRINT_ARR:
    MOV AX, ARRAY[SI]
    CALL PRINT_NUM
    ADD SI, 2
    PRINT ' '
    LOOP PRINT_ARR
ENDM
         
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  
   
    PRINT 'ENTER THE NUMBER OF ELEMENTS: '
    CALL SCAN_NUM
    MOV N, CX
    PRINTN ''
    ENTER_NUMBERS ARR,N
    PRINTN ''
    PRINT 'ARRAY: '
    PRINT_ARRAY ARR
   
    RETURN:
    MOV AH, 4CH  
    INT 21H  
MAIN ENDP  

; FIND_ODD_EVEN PROC 

; FIND_ODD_EVEN ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS  

END MAIN
