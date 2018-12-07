*予め google するべき知識: GDT*

**ゴール: GDTのプログラムを書く**

レッスン6でオフセットを左シフトして間接的により大きなアドレス空間にアクセスする方法を学んだことをおぼえていますか?

32-ビット モードでは、16-ビット モードとはセグメンテーションの動作は異なります。オフセットはセグメントディスクリプター(SD)は GDT の一部としてセットされます。
In 32-bit mode, segmentation works differently. Now, the offset becomes an
index to a segment descriptor (SD) in the GDT. This descriptor defines
the base address (32 bits), the size (20 bits) and some flags, like
readonly, permissions, etc. To add confusion, the data structures are split,
so open the os-dev.pdf file and check out the figure on page 34 or the 
Wikipedia page for the GDT.

The easiest way to program the GDT is to define two segments, one for code
and another for data. These can overlap which means there is no memory protection,
but it's good enough to boot, we'll fix this later with a higher language.

As a curiosity, the first GDT entry must be `0x00` to make sure that the
programmer didn't make any mistakes managing addresses.

Furthermore, the CPU can't directly load the GDT address, but it requires
a meta structure called the "GDT descriptor" with the size (16b) and address
(32b) of our actual GDT. It is loaded with the `lgdt` operation.

Let's directly jump to the GDT code in assembly. Again, to understand
all the segment flags, refer to the os-dev.pdf document. The theory for
this lesson is quite complex.

In the next lesson we will make the switch to 32-bit protected mode
and test our code from these lessons.
