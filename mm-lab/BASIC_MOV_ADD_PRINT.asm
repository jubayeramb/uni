        ;MOVE VALUE 5 INTO REGISTER AX
        MOV AX, 5
        
        ;ADD 3 TO AX (AX = AX + 3)
        ADD AX, 3
        
        ;SUBTRACT 2 FROM AX (AX = AX - 2)
        SUB AX, 2
        
        ;PRINTING THE RESULT
        ADD AX, 30H   ; Convert the result to ASCII for printing
        MOV DL, AL    ; Move the result to DL for printing
        MOV AH, 2     ; Set up to call the print function
        INT 21H       ; Interrupt to display the result

        ;EXIT PROGRAM
        MOV AX, 4CH
        INT 21H