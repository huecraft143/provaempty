section .text
global _start

_start:
    mov rcx, 7           ; Imposta il contatore a 5

ciclo:
    push rcx             ; Salva rcx su stack

    ; Prepara la syscall per scrivere su stdout
    mov rax, 1           ; Numero della syscall per sys_write
    mov rdi, 1           ; File descriptor 1 per stdout
    mov rsi, char        ; Puntatore al carattere da stampare
    mov rdx, 1           ; Lunghezza del messaggio da stampare (1 byte)
    syscall              ; Chiama la syscall

    pop rcx              ; Ripristina il valore originale di rcx

    ; Utilizza l'istruzione 'loop' per decrementare rcx e saltare se non è zero
    loop ciclo

    ; Termina il programma
    mov rax, 60          ; Syscall per exit in 64-bit
    xor rdi, rdi         ; Status
    syscall              ; Chiama la syscall

section .data
    char db '*', 0  
