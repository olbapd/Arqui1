		;;Confirmacion
		MOV		R0, #512 ;poiscion 0x!00
		MOV		R1, #240 ;dato 0xF0
		STR		R1,[R0]
		
		CMP		R1, R1 ;Compara si esta F0 en la posicion deseada
		BNE		NOTVALID
		MOV		R0, #516 ;poiscion 0x!00
		MOV		R1, #255 ;dato 0xFf
		STR		R1,[R0]
		
		
		
		;;Initial	Setup
		MOV		R0, #0x400 ;Addr of the prime number
		MOV		R1, #4 ;Number to test
		STR		R1, [R0] ;STR the prime number
		
		;;Algorithm
		MOV		R0, #0x400
		LDR		R0, [R0] ;contains numberr to verify if prime
		
		;;Not	in range numbers
		CMP		R0,#1 ;If sameller than 1
		BLT		NOTVALID
		
		CMP		R0,#255 ;If greater than 255
		BGT		NOTVALID
		
		;;Detect	first primes
		CMP		R0,#2 ;If 2 then prime
		BEQ		ISPRIME
		
		CMP		R0,#1 ;If 1 then prime
		BEQ		ISPRIME
		
		;Verifica	si el numero es par o impar
		MOV		R1, #31
		LSL		R1, R0,R1
		;CMP		R1, #0x80000000
		CMP		R1, #0
		BEQ		NOTPRIME
		
		MOV		R2,#02 ;INumber to divide
UP
		BL		DIVIDE              
		CMP		R3,#00   ;Compare remainder
		BEQ		NOTPRIME    
		ADD		R2,R2,#01  ;Increment divider
		CMP		R2,R0   ;Compare test number
		BEQ		PRIME    
		B		UP   
NOTPRIME
		;		ALMACENA UN 0 SI NO ES PRIMO
		MOV		R0, #0
		MOV		R1, #1000
		STR		R0, [R1]
		B		FINAL
PRIME
		;		ALMACENA UN 0 SI NO ES PRIMO
		MOV		R0, #1
		MOV		R1, #1000
		STR		R0, [R1]
		B		FINAL
		
DIVIDE                  
		
		MOV		R3,R0                ;Number to test
		MOV		R4,R2                ;Number to divide
LOOP
		SUB		R3,R3,R4             
		CMP		R3,R4                ;Compare with 0
		BPL		LOOP                 
		MOV		PC,LR                ;Return
		
NOTVALID ; ALMACENA UN 2 SI ES NO VALIDO
		MOV		R0, #2
		MOV		R1, #1000
		STR		R0, [R1]
		B		FINAL
		
FINAL
		END
