; Set dimension of image
;; R15,  R14, R13, R12 quemados 
PWL R11, #640 ;; MOV 
PHL R10, #480 ;; MOV



MOV R0, #0 ; contador
repeat(640*480,13) ; Cuantas veces, cuales siguientes lineas 
;En horizontal
LDR R1, [R0]
LDR R2, [R0+1]
LDR R3, [R0+2]

;Multiplica el kernel horizontal
MUL R1,R1,R15 
MUL R2,R2,R15
MUL R3,R3,R15

;Multiplica el kernel vertical
MUL R1,R1,R14 
MUL R2,R2,R13
MUL R3,R3,R12
 
ADD R1,R1,R2
ADD R1,R1,R3
CONV R1,R1

ADD R0,R0,#1 ;Incrementar cont
