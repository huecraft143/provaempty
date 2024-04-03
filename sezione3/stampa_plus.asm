section .data
    num1 dd 3    ; Definisci il primo numero (puoi modificare questi valori)
    num2 dd 123    ; Definisci il secondo numero

section .bss
    sum resd 1     ; Riserva spazio per la somma
    buffer resb 10 ; Buffer per la stringa della somma
    length resb 1  ; Lunghezza della stringa

section .text
    global _start

_start:
    ; Calcola la somma
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax

    ; Converti la somma in una stringa
    mov eax, [sum]  ; Metti la somma in eax
    mov ebx, 10     ; Divisore
    lea edi, [buffer + 9] ; Puntatore alla fine del buffer
    mov byte [edi], 0  ; Null-terminator per la stringa

convert_loop:
    dec edi
    xor edx, edx    ; Pulisci edx
    div ebx         ; Dividi eax per 10, risultato in eax, resto in edx
    add dl, '0'     ; Converti il resto in un carattere
    mov [edi], dl   ; Salva il carattere nel buffer
    test eax, eax   ; Controlla se eax è 0
    jnz convert_loop ; Continua se non è 0

    ; Calcola la lunghezza della stringa
    lea ecx, [buffer + 9]  ; Puntatore alla fine del buffer
    sub ecx, edi           ; Calcola la lunghezza
    mov [length], ecx      ; Salva la lunghezza

    ; Stampa la stringa
    mov eax, 4             ; syscall write
    mov ebx, 1             ; stdout
    mov ecx, edi           ; Puntatore alla stringa
    mov edx, [length]      ; Lunghezza della stringa
    int 0x80               ; Chiama il kernel

    ; Termina il programma
    mov eax, 1             ; syscall exit
    xor ebx, ebx           ; status 0
    int 0x80