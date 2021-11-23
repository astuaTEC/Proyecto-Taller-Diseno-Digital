.data
	palabra:	.ascii "Lorem"
	texto:	.ascii "Lorem Hola loren abc Lorem fdasa Hola Lorem"
.text
	.global _start
_start:
	MOV r0, #0
	LDR r0, [r0]
	CMP r0, #1
	BEQ algoritmo1
	
	B _start

algoritmo1:
	MOV r0, #2 //donde se guarda la palabra Lorem
	MOV r1, #1 // para poder acceder a la posicion 1 de la RAM
	LDR r1, [r1] //se accede a la posicion 1 para iniciar la busqueda en x posicion
	ADD r1, r1, #7 //se le suma la posicion desde donde inicia el texto
	
	MOV r2, #0 //indice i

	MOV r7, #0 //contador
	
loop1:
	MOV r3, #0 //indice j
	MOV r4, r2 // aux
	
	CMP r2, #255 //aqui seria comparar con el tamanio max del texto
	BLT loop2
	
	B DONE
	
loop2:
	ADD r8, r0, r3
	ADD r9, r1, r4
	LDR r5, [r8]
	LDR r6, [r9]
	
	CMP r5, r6
	BNE if1
	ADD r4, #1 //aux
	
	CMP r3, #4 //length de la subpalabra
	BEQ if2
	
	ADD r3, #1 //se suma j
	
	CMP r3, #5 //largo de la palabra Lorem
	BLT loop2
	
if1:
	ADD r2, #1 //se suma i
	B loop1

if2:
	ADD r7, #1 //se suma el contador
	ADD r2, #1 //se suma i
	B loop1
	
sumarLoop1:
	ADD r2, #1 //se le suma al i
	B loop1
	
DONE:
	MOV R1, #520
	STR R7, [R1]