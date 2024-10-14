# dot-emacs-d-sample

2024年10月現在。入れておいて損はないと思われる最低限の設定をしたinit.elファイル。

## 前提

- Emacsのバージョンは28以上
    - Linuxのapt等では最新バージョンが入らないためソースからのビルドを推奨する（参考: [Ubuntuで最新リリースのEmacsをインストールする | らくだのテックブログ](https://rkd3.dev/post/emacs-ubuntu-install/)）
- 本手順書は外部パッケージのインストールにおいて macOS (Homebrew) と Ubuntu (apt) の利用を想定しているが、読み替えることで設定自体は他OSでも利用可能。詳しくは各公式ドキュメントを参照のこと。

## 事前準備

以下の外部パッケージをインストールする必要がある。ただし対象の言語 (Python, Terraform) を扱わない場合はそれぞれの準備は不要である。

### Python

参考: [python-lsp/python-lsp-server | GitHub](https://github.com/python-lsp/python-lsp-server?tab=readme-ov-file#installation)

#### Macの場合

```sh
brew install python-lsp-server
```

#### Ubuntuの場合

```sh
sudo apt install python3-pylsp
```

### Terraform

参考: [hashicorp/terraform-ls | GitHub](https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md)

#### Macの場合

```sh
brew install hashicorp/tap/terraform-ls
```

#### Ubuntuの場合

参考: [Official Packaging Guide | HashiCorp](https://www.hashicorp.com/official-packaging-guide)

```sh
sudo apt update && sudo apt install gpg
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform-ls
```

## 使い方

init.el を ~/.emacs.d/ に保存し、Emacsを起動する。初回起動時はパッケージのインストールやコンパイルに時間がかかる。

設定は最小限であるため、各公式ドキュメントやユーザーのブログなどを参考にカスタマイズすることを推奨する。

## インストールおよび有効化されているもの

具体的な設定はinit.elを参照。

- fido-vertical-mode
- [company-mode](https://company-mode.github.io)
- [consult](https://github.com/minad/consult)
- recentf
    - 最近開いたファイルを記憶する。 `consult-buffer` などで参照可能。
- [orderless](https://github.com/oantolin/orderless)
- [marginalia](https://github.com/minad/marginalia)
- [eglot](https://joaotavora.github.io/eglot/)

### その他のファイル種別に応じた設定

- markdown-mode
- yamll-mode
- json-mode
- dockerfile-mode
- python-mode
- terraform-mode

## 上書きしているキーバインド

| キー    | 元の関数           | 設定している操作    |
|:--------|:-------------------|:--------------------|
| `C-x b` | `switch-to-buffer` | `consult-buffer`    |
| `M-g g` | `goto-line`        | `consult-goto-line` |
| `M-g i` | `imenu`            | `consult-imenu`     |
| `C-h`   | prefix             | Backspace           |

