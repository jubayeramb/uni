INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
ARR DW 100,150,200,51
;A DW 100
;B DW 150
;C DW 20
;D DW 51
H DW ?
H2 DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    MOV CX,2
    MOV SI,0
    MOV DX, ARR[SI]
    MOV H, DX
    
    CAL:
        MOV AX,H
        INC SI
        INC SI
        MOV BX,ARR[SI]
        CMP BX,AX ;BX>AX
        JG SAVEVALUE
        
        MOV DX, H
        MOV H2, DX
        MOV H, AX
        
        CONT:
        LOOP CAL
        JMP PRI

    SAVEVALUE:
        MOV DX, H
        MOV H2, DX
        MOV H,BX
        JMP CONT
        
    PRI:
        MOV AX, H
        PRINT '1st Highest: '
        CALL PRINT_NUM
        PRINTN ''
        MOV AX, H2
        PRINT '2nd Highest: '
        CALL PRINT_NUM
        PRINTN ''
        
   
    RETURN:
        MOV AH,4CH
        INT 21H
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN