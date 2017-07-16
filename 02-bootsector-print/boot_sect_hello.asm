mov ah, 0x0e ; tty mode
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' は本当に al にそのまま残ってる?
mov al, 'o'
int 0x10

jmp $ ; このアドレスに jump = 無限ループ

; 0 詰と magic number
times 510 - ($-$$) db 0
dw 0xaa55 
