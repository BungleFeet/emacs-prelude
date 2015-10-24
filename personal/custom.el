(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(debug-on-error t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))


;; Load my favourite packages
(prelude-require-packages '(let-alist key-chord company rainbow-delimiters anzu
                                      avy dash makey discover-my-major flycheck
                                      pkg-info epl helm helm-core async helm-ag
                                      helm-projectile projectile  magit
                                      magit-popup git-commit with-editor
                                      smartparens ace-jump-buffer ace-jump-mode
                                      ace-window browse-kill-ring cider spinner
                                      queue clojure-mode csv-mode diff-hl
                                      diminish easy-kill expand-region
                                      flx-ido flx flycheck gist gh logito pcache
                                      git-timemachine gitconfig-mode
                                      gitignore-mode god-mode grizzl guru-mode
                                      helm-descbinds move-text operate-on-number
                                      ov pcache queue smartrep smex undo-tree
                                      volatile-highlights zenburn-theme
                                      zop-to-char))

;; Helm setup
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source-directory
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)


;; Set up code folding for XML documents - use C-c h to toggle show/hide
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)
(define-key nxml-mode-map (kbd "C-c h") 'hs-toggle-hiding)

;; Turn on auto-dim-other-buffers-mode by default
(add-hook 'after-init-hook (lambda ()
                             (when (fboundp 'auto-dim-other-buffers-mode)
                               (auto-dim-other-buffers-mode t))))

;; Prevent emacs from ringing the system bell
(setq ring-bell-function 'ignore)

;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(setq w32-pass-rwindow-to-system nil)
(setq w32-rwindow-modifier 'super) ; Right Windows key

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key

;; Set up Clojure mode
(require 'smartparens-config)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; Add cygwin bin directory to execution path
(if (file-directory-p "c:/cygwin64/bin")
    (add-to-list 'exec-path "c:/cygwin64/bin"))
