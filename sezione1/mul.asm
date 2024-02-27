section .data
	msg db "Il risultato è: ", 0xA
	len equ $ - msg

	nl db 0xA
	len_nl equ $ - nl
section .bss
	result resb 1
section .text
global _start

_start:
	; Metto tutto nei registri appositi
	mov al, '2'
	sub al, '0' ; Effettuo la sottrazione con 0 sul registro eax per convertire DA ASCII A DECIMALE
	mov bl, '2'
	sub bl, '0'

	;Effettuo la moltiplicazione
	mul bl ; Moltiplico dentro al il valore contenuto in bl (registro a 8 bit)
	add al, '0' ; Effettuo l'addizione con 0 sul registro ebx per convertire DA DECIMALE AD ASCII
	mov [result], al
	
	; Stampo messaggio prima del risultato
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 80h

	; Stampo il risultato
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 80h
	
	; Stampo la new line
	mov eax, 4
	mov ebx, 1
	mov ecx, nl
	mov edx, len_nl
	int 80h

	;Esco dal programma
	mov eax, 1
	mov ebx, 0
	int 80h
