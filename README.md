# dot-emacs-d-sample

2024年10月現在。入れておいて損はないと思われる最低限の設定をしたinit.elファイル。

## 前提

- Emacsのバージョンは28以上
- 本手順書は外部パッケージのインストールにおいて macOS (Homebrew) の利用を想定しているが、読み替えることで設定自体は他OSでも利用可能

## 事前準備

以下の外部パッケージをインストールする必要がある。対象の言語を扱わない場合は不要。

### Python

```sh
brew install python-lsp-server
brew install python-lsp-ruff
```

### Terraform

```sh
brew install hashicorp/tap/terraform-ls
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
    - flymake-ruff
- terraform-mode

## 上書きしているキーバインド

| キー    | 元の関数           | 設定している操作    |
|:--------|:-------------------|:--------------------|
| `C-x b` | `switch-to-buffer` | `consult-buffer`    |
| `M-g g` | `goto-line`        | `consult-goto-line` |
| `M-g i` | `imenu`            | `consult-imenu`     |
| `C-h`   | prefix             | Backspace           |

