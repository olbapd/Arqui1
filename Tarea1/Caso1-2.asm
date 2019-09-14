		MOV		R1, #5  ;Len de password
		MOV		R2, #800 ;0x320
		STR		R1, [R2]
		
		MOV		R1, #256 ;Clave de 8 bits
		MOV		R2, #1024 ;0x400
		STR		R1, [R2]
		
		;Mensaje	a encriptar (Pablo)
		MOV		R1, #80 ;P
		MOV		R2, #512 ;0x200
		STR		R1, [R2]
		
		MOV		R1, #97  ;a
		;MOV		R2, #528 ;0x201
		MOV		R2, #520 ;0x201
		STR		R1, [R2]
		
		MOV		R1, #98 ;b
		MOV		R2, #528 ;0x201
		STR		R1, [R2]
		
		MOV		R1, #108 ;l
		MOV		R2, #536 ;0x201
		STR		R1, [R2]
		
		MOV		R1, #111 ;o
		MOV		R2, #544 ;0x201
		STR		R1, [R2]
		;;		Encriptacion
PreLoop
		MOV		R0, #0 ;cont
		MOV		R1, #800
		LDR		R1, [R1] ;len message
		MOV		R2, #512 ;addr of the message
		
Loop
		CMP		R0, R1
		BEQ		ENDLOOP
		
		LDR		R3, [R2] ;get the message content
		ADD		R3, R3, #19 ;ADD 19
		
		MOV		R4, #1024 ;Addr Clave
		LDR		R4, [R4] 	;Content of clave
		EOR		R4, R3, R4 ; XOR message with clave
		STR		R4, [R2] ; Store thenew content
		ADD		R0,R0, #1 ;Increment loop
		ADD		R2, R2, #8
		B		Loop
ENDLOOP
		
		;Desencriptacion
		
PreLoopD
		MOV		R0, #0 ;cont
		MOV		R1, #800
		LDR		R1, [R1] ;len message
		MOV		R2, #512 ;addr of the message
		
LoopD
		CMP		R0, R1
		BEQ		ENDLOOPD
		LDR		R3, [R2] ;get the message content
		MOV		R4, #1024 ;Addr Clave
		LDR		R4, [R4] 	;Content of clave
		
		EOR		R4, R3, R4 ; XOR message with clave
		SUB		R4, R4, #19 ;ADD 19
		
		STR		R4, [R2] ; Store thenew content
		ADD		R0,R0, #1 ;Increment loop
		ADD		R2, R2, #8
		B		LoopD
ENDLOOPD
		END
