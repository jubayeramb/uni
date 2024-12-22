.MODEL SMALL
.STACK 100H

.DATA
    a DW ?
    b DW ?

.CODE

    MAIN PROC
        
        ;FOR DATA SEGMENT
        MOV AX, @DATA
        MOV DS, AX
        
        ;FIRST DIGIT INPUT FROM USER
        MOV AH, 1
        INT 21H
        SUB AX, 30H
        
        ;MOVE THE VALUE TO VARIABLE a
        MOV a, AX
        
        ;PRINTING NEW LINE
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;SECOND DIGIT INPUT
        MOV AH, 1
        INT 21H
        SUB AX, 30H
        
        ;MULTIPLICATION AND STRORING THE RESULT TO b
        MUL a
        MOV b, AX
        
        ;PRINTING NEW LINE
        MOV AH, 2     
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H     
        
        ;PRINT THE RESULT
        MOV AH, 2
        MOV DX, b
        ADD DX, 30H
        INT 21H
                        
        
        ;EXIT PROGRAM
        MOV AX, 4CH
        INT 21H
        
    MAIN ENDP
 END MAIN