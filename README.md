cfenollosa/os-tutorial の日本語訳(意訳です。)

訳注：
かなり意訳が入っています。内容的に怪しいと思いましたら原典を参照お願いします。謝りを指摘いただけるとなお助かります。

os-tutorial
===========

スクラッチから OS を作成するHowto

私(cfenollosa さん)は OS をスクラッチから作成する方法を日頃から学びたいと思っていた。カレッジでは、Pagination, semaphores, memmory management などを教わったがそれらは、OSが起動した後の高度な機能だ。

しかし：
- OS をブートセクターから起動する方法を習得できなかった
- I never got to start from my own boot sector
- College is hard so I don't remember most of it.
- I'm fed up with people who think that reading an already existing kernel, even if small, is 
a good idea to learn operating systems.

以下のドキュメントにインスパイアされて、ごく短いステップバイステップで README と code サンンプルを繰り返すことで
誰もが落ちこぼれることなく理解できるようにと構成している。
率直に言ってこのチュートリアル全体が、OS 開発における最初に理解すべきドキュメントの内容に過ぎないが、(わかりやすくするために)あえて細かく分割している
またあえて、OS 開発のセオリーを逸脱している部分もある。
- [this document](http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
- [OSDev wiki](http://wiki.osdev.org/), I'll try to make short step-by-step READMEs and

参考ドキュメント追加：
[the little book about OS development](https://littleosbook.github.io),
[JamesM's kernel development tutorials](https://web.archive.org/web/20160412174753/http://www.jamesmolloy.co.uk/tutorial_html/index.html)


Features
--------

- このチュートリアルはローレベルコンピューティングを楽しみたい人向けに構成している。例えば
OS がどのように動くかに興味があるが、Linux Kernel ソースのの隅から隅まで読む時間も気力もないプログラマーがその一例です。
- There is little theory. Yes, this is a feature. Google is your theory lecturer. Once you pass college, 
excessive theory is worse than no theory because it makes things seem more difficult than they really are.
- 1章は、5 - 15 分程度で読めるくらい短い。私(cfenollosa さん)と自分自信を信じて、You can do it!


How to use this tutorial
------------------------

1. Start with the first folder and go down in order. They build on previous code, so if 
you jump right to folder 05 and don't know why there is a `mov ah, 0x0e`, it's because you missed lecture 02.
Really, just go in order. You can always skip stuff you already know.

2. Open the README and read the first line, which details the concepts you should be familiar with
before reading the code. Google concepts you are not familiar with. The second line states the goals for each lesson. 
Read them, because they explain why we do what we do. The "why" is as important as the "how".
 
3. Read the rest of the README. It is **very concise**.

4. (Optional) Try to write the code files by yourself after reading the README.

5. Look at the code examples. They are extremely well commented.

6. (Optional) Experiment with them and try to break things. The only way to make sure you understood something is
trying to break it or replicate it with different commands.


TL;DR: First read the README on each folder, then the code files. If you're brave, try to code them yourself.


Strategy
--------

私たちの OS で実現したい機能:

- GRUB なしでスクラッチコードで起動 - DONE!
- 32-bit モードへ切り替え - DONE
- Assembly から C 言語のコードへジャンプ - DONE!
- 割り込みハンドラー - DONE!
- 画面出力とキーボード入力(CUI) - DONE!
- 最初の小さな`libc` あとで必要に応じてこれに追加機能を実装することができる - DONE!
- メモリ管理
- ファイルを保存するためにファイルシステムを書く
- シンプルなシェル
- ユーザーモード
- Maybe we will write a simple text editor
- Multiple processes and scheduling

Probably we will go through them in that order, however it's soon to tell.

もっとチャレンジングなタスクとして:

- BASIC interpreter (70年代みたい。笑!)
- GUI
- Networking



Contributing
------------

I'm still learning this. For the moment, please restrict your contributions to fixing possible bugs
or improving existing documents. I'm not yet ready to accept enhancements.
