*予め google するべき知識: 32-bitプロテクトモード、VGA、ビデオメモリー

**ゴール: 32-bitプロテクモードで画面に表示をする**

32-bit mode では、32bitレジスタと32bitのアドレスでのメモリアクセスすることやプロテクテッドメモリー、仮想メモリなどを使用ことが許される、
ただ、32-bitモードに移行するとBIOSへのアクセスできなくなる。
なので、GDTを使用するコードを書かなければならなくなる。(詳細は、この章の後半で)

この章では、新しい32-bit用の文字列表示ルーチンを書き、それは BIOSを
使用せず、VGA ビデオメモリを直接操作して行う。BIOS `int 0x10`を使用せず、メモリアドレス`0xb80000` 以降のtextモードを利用する。


The formula for accessing a specific character on the 80x25 grid is:

`0xb8000 + 2 * (row * 80 + col)`

That is, every character uses 2 bytes (one for the ASCII, another for 
color and such), and we see that the structure of the memory concatenates
rows.

Open `32bit-print.asm` to see the code. It will always print the string
on the top left of the screen, but soon we'll write higher level routines
to replace it.

Unfortunately we cannot yet call this routine from the bootloader, because
we still don't know how to write the GDT and enter protected mode. Once
you have understood the code, jump to the next lesson.
