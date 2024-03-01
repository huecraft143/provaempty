section	.data

   msg db "The largest digit is: "
   len equ $- msg

   num1 dd '47'	; dd -> double word (32 bit)
   num2 dd '22'
   num3 dd '31'

section .bss
   largest resb 2	; allocate space for the largest variable in memory (2 bytes)

section	.text
global _start

_start:			
mov   ecx, [num1]	
cmp   ecx, [num2]	; cmp -> Compare num1 with num2 and set the GREATER THAN FLAG if num1 is bigger
jg    check_third_num	; if num1 is greater than num2 (greater-than flag set) jump to 'check_third_num'
mov   ecx, [num2]	; if num2 is greater than num2 (greater-than flag not set) move num2 to ecx and then execute 'check_third_num'

check_third_num:
cmp   ecx, [num3]	; compare ecx (num2) with num3
jg    _exit		; if num2 is bigger than num3 jump to the '_exit' block
mov   ecx, [num3]	; if num3 is bigger move num3 to ecx then execute  the '_exit' block

_exit:
   mov   [largest], ecx		; move the ecx value (largets number) to the 'largets' varaible address in memory
   mov   ecx,msg		; move the message to ecx for printing
   mov   edx, len
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   ecx,largest		; move the value of the largest number into ecx for printing
   mov   edx, 2
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   eax, 1
   mov   ebx, 0
   int   80h





