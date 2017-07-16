*予め　goolle するべき知識: linux, mac, terminal, compiler, emulator, nasm, qemu*

**ゴール: このチュートリアルで使うソフトウェアをインストールする**

私(fenollosa さん)は、Macを使ってこのチュートリアルを書いているが、
あなたが Linux を使用できる(使用している)ならばその方がより簡単かもしれない。
なぜなら、Linux には標準で必要なツールが揃っているからです。

もし Mac を使用するなら、[Homebrew をインストール] して `brew install qemu nasm` を実行して
qemu と nasm をインストールしてください。

注意:
Xcode developer に含まれる `nasm` は使用しないこと。多くの場合それを使用するとうまくいかない。
なので代わりに homebrew でインストールした `/usr/local/bin/nasm` を使用してください。

qemu はインストールしたシステムによっては複数のバイナリに分割されていることがあります。
その場合、`qemu-system-x86_64 binfile` などの intel cpu をエミュレートしたバイナリを使用してください。

