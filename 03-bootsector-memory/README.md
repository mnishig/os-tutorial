*予め google するべき知識: メモリオフセット、ポインター*

**ゴール: メモリがどんな仕組みで管理されているか学ぶ**

[this document](
http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)<sup>1</sup> の14ページを参照してメモリレイアウトの図を見てみてください。

このレッスンではブートセクターがメモリのどの位置に読み込まれるのかを学ぶだけです。

単に BIOS　は　`0x7C00` に読み込まれると言ってこの章を終わりしてもいいのですがあまりにそっけないので、
あえて間違った例をこのこと明確にしてみましょう。

X という文字を画面に表示することを考えます。
4つの方法でどうなるか見てみます。

**`boot_sect_memory.asm` ファイルを開いてください**

準備としてこんな感じに X の文字をラベルで定義します。:
```nasm
the_secret:
    db "X"
```

`the_secret` アクセス方法はいくつかのアプローチを考えてみます:

1. `mov al, the_secret`
2. `mov al, [the_secret]`
3. `mov al, the_secret + 0x7C00`
4. `mov al, 2d + 0x7C00`, `2d` はバイナリファイルでの X の場所だとします。

コードとコメントも同時にみてもらいたいのですが、

コンパイル(アセンブル)して実行すると、`1[2¢3X4X` のような文字列が表示されます。1、2 の方法はランダムなゴミが表示されてしまいます。

If you add or remove instructions, remember to compute the new offset of the X
by counting the bytes, and replace `0x2d` with the new one.

この先のセクションでは、オフセットとメモリアドレッシングについての理解が必要になります。十分に内容を把握してから先に進んでください。


グローバルオフセット
-----------------

0x7c00 はブートセクターのオフセットとして、先のセクションでも何度も使うのですが、このままだと不便なので "グローバルオフセット" を定義します。
`org` コマンド:


```nasm
[org 0x7c00]
```

**open `boot_sect_memory_org.asm`** を開いてブートセクターで文字表示する別のパターンを見てください。

Read the comments for a full explanation of the changes with and without `org`

-----

[1] 本チュートリアルは、この資料を見て強くインスパイアされました。Please read the
root-level README for more information on that.
