;; 文字コード自動認識の順序でUTF-8を優先
(setq coding-system-for-read 'utf-8)

;; C-hにbackspaceを割り当て
(define-key key-translation-map [?\C-h] [?\C-?])

;; 対話システムを拡張
(fido-vertical-mode +1)

;; テーマを設定 (https://pawelbx.github.io/emacs-theme-gallery/)
;; (load-theme 'tango t)
(load-theme 'tango-dark t)

;; use-package
(eval-when-compile
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (require 'use-package))

(use-package company
  :ensure t
  :init (global-company-mode))

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("M-g g" . consult-goto-line)
   ("M-g i" . consult-imenu)))

;; 最近開いたファイルを参照
(use-package recentf
  :ensure t
  :config (recentf-mode 1))

;; 絞り込みにあいまい検索を追加
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)))

;; consultのリストなどにメタ情報を表示する
(use-package marginalia
  :ensure t
  :init (marginalia-mode))

;; LSPクライアント
(use-package eglot
  :ensure t)

;; ファイルごとのモード
(use-package markdown-mode
  :ensure t)

(use-package yaml-mode
  :ensure t
  :mode
  (("\\.yml\\'" . yaml-mode))
  (("\\.yaml\\'" . yaml-mode)))

(use-package json-mode
  :ensure t
  :mode ("\\.json?\\'" . json-mode))

(use-package dockerfile-mode
  :ensure t)

(use-package terraform-mode
  :ensure t
  :hook ((terraform-mode . eglot-ensure)
         (terraform-mode . terraform-format-on-save-mode)))

(use-package python-mode
  :ensure t
  :mode ("\\.py?\\'" . python-mode)
  :hook
  (python-mode . eglot-ensure)
  (python-mode . hs-minor-mode)
  :config
  ;; ;; 保存時にフォーマットする
  ;; (add-hook 'python-mode-hook
  ;;           #'(lambda ()
  ;;               (add-hook 'before-save-hook
  ;;                         'eglot-format-buffer nil t)))
)

;; Linter for Python
(use-package flymake-ruff
  :ensure t
  :hook
  (eglot-managed-mode-hook . python-mode)
  :config
  (setq flymake-ruff--default-configs '("ruff.toml" ".ruff.toml")))
