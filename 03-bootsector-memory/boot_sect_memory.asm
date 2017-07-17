[org 0x7c00]
mov ah, 0x0e

; attempt 1
; 'org' オフセットを考慮しない失敗する例
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; attempt 2
; 'org' を考慮して正しく、the_secret のアドレスを取得した例
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; attempt 3
; 0x7c00 を２度('org' の分と add bx 0x7c00)足してしまっている例。
; 当然動かない。
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; attempt 4
; 動作する例。この方法だとメモリリファレンスを使用していない。
; だから、'org' モードが適用されない。
; "X" のアドレスをダイレクトに計算して指定しています。
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10


jmp $ ; infinite loop

the_secret:
    ; ASCIIコード 0x58 ('X') を 0 パディングの前に置きます。
    ; ここのオフセットは 0x2d になります。
    ; ('xdd finle.bin' で確かめることができます。)
    db "X"

; zero パディングと BIOSマジックナンバー
times 510-($-$$) db 0
dw 0xaa55
