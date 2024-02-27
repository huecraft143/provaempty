section .data
sum_msg db "Il risultato della somma e'", 0xA
len_sum equ $ - sum_msg

new_line db 0xA
len_nl equ $ - new_line

odd_msg db "Il numero è dispari", 0xA
len_odd_msg equ $ - odd_msg

even_msg db "Il numero è pari", 0xA
len_even_msg equ $ - even_msg
section .bss
sum resb 1

section .text
global _start

_start:
	; Faccio la somma tra due numeri
	mov eax, '1'
	sub eax, '0'	; Converto in decimale
	mov ebx, '0' 
	sub ebx, '0'

	; Effettuo la somma
	add eax, ebx
	add eax, '0'
	mov [sum], eax

	;Stampo messaggio somma e somma
	mov eax, 4
	mov ebx, 1
	mov ecx, sum_msg
	mov edx, len_sum
	int 80h
	
	;Stampo la somma
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 80h

	;Stampo il nl character
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_nl
	int 80h

	mov eax, [sum]
	sub eax, 0	
	and eax, 1
	jz even
	jnz odd

	even:
	mov eax, 4
	mov ebx, 1
	mov ecx, even_msg
	mov edx, len_even_msg
	int 80h
	jmp fine
	 

	odd:
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, len_odd_msg
	int 80h
	jmp fine

	fine:
	mov eax, 1
	mov ebx, 0
	int 80h
