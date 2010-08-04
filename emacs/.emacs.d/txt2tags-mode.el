;; TODO

;; Ajustar as regexps de tabelas
;; Ajustar a regexp da data para pegar %%date(%c) e variantes



;; Changelog

;; 19/07/2004

;; Melhorando as regexps de links 
;; Agora as regiões de ``` também são marcadas

;; 12/07/2004

;; Adicionando a fonte raw para a marcação --- oneliner em um nível mais superior

;; M-x compile agora tem a opção de target padrão. Coloquei o html, 
;; mas é uma variável que pode ser mudada com o M-x customize-group t2t

;; As listas agora voltam a funcionar - + : são identificadas.
;; o problema estava na cor que eu atribuía às listas (blah).

;; Seções numeradas agora sem ancoras também


;; 10/07/2004

;; Comando de "compilar" modificado.
;; Agora quando precisar compilar o documento t2t aberto, é só executar 
;; M-x compile

;; Criadas as fontes section-{1,2,3,4,5}. Valeu Guaracy.

;;  8/07/2004
;;  Inserido o :group 'txt2tags-faces no final da definição das fontes. Isso permite 
;;  que o M-x customize-group txt2tags possa definir as fontes do usuário sobrepondo a minha 
;;  definição. Obrigado à sachac #emacs

;; 3/10/2003
;; Hoje eu consegui arrumar um problema com a regexp do negrito
;; uma aspa faltando antes do nome da fonte tava dando erro
;; a regesp do negrito tava errada

;; http://two-wugs.net/emacs/mode-tutorial.html#fontlock

;; Here, we define some variables that all modes should define. 
;; t2t-mode-hook allows the user to run their own code when your mode is run.
;; t2t-mode-map allows users to define their own keymaps.

(defvar t2t-mode-hook nil)
(defvar t2t-mode-map nil
  "Keymap for txt2tags major mode")

;; Now we're assigining a default keymap, if the user hasn't already defined one.

(if t2t-mode-map nil
  (setq t2t-mode-map (make-keymap)))



(defgroup t2t nil
  "txt2tags code editing commands for Emacs."
  :prefix "t2t-"
  :group 'languages)

(defcustom t2t-program 
  (cond 
   ((file-exists-p "/usr/local/bin/txt2tags") "/usr/local/bin/txt2tags")
   ((file-exists-p "/usr/bin/txt2tags") "/usr/bin/txt2tags")
   ((file-exists-p "/bin/txt2tags") "/bin/txt2tags")
;;   ((file-exists-p "/home/leslie/bin/bin/txt2tags") "/home/leslie/bin/bin/txt2tags")
   ((file-exists-p "~/projetos/txt2tags/programa/txt2tags") "~/projetos/txt2tags/programa/txt2tags")
   ( t "txt2tags")
   )
  "File name of the txt2tags executable."
  :type 'file
  :group 't2t)

(defcustom t2t-default-target "html"
  "Default target to txt2tags."
  :group 't2t)

;;; Fontes novas criadas com base na sugestão do kensanata do #emacs em irc.freenode.net

;; cria o novo grupo txt2tags-faces que é filho de txt2tags

(defgroup txt2tags-faces nil
  "txt2tags code editing commands for Emacs."
  :prefix "t2t-"
  :group 't2t)


;; data
(defface t2t-date-face '((t (:foreground "yellow" :background "black"))) 
  "Txt2Tags Date."  :group 'txt2tags-faces)

;; conf area
(defface t2t-config-face '((t (:foreground "yellow" :background "black"))) 
  "Txt2Tags Config Area."  :group 'txt2tags-faces)

;; conf area
(defface t2t-postproc-face '((t (:foreground "medium spring green" :background "black"))) 
  "Txt2Tags PostProc Area."  :group 'txt2tags-faces)


;; Verbatim
(defface t2t-verbatim-face '((t (:foreground "SpringGreen1" :background "black"))) 
  "Txt2Tags Verbatim."  :group 'txt2tags-faces)

;; http + e-mails

(defface t2t-internet-face '((t (:foreground "dark orchid" :background "black"))) 
  "Txt2Tags E-mail and Http." :group 'txt2tags-faces)

;; números

(defface t2t-numbers-face '((t (:foreground "plum1" :background "black"))) 
  "Txt2Tags Numbers." :group 'txt2tags-faces)

;; títulos de seções
(defface t2t-sections-face-5 '((t (:foreground "cyan" :background "black"))) 
  "Txt2Tags Section Titles." :group 'txt2tags-faces)

(defface t2t-sections-face-4 '((t (:foreground "cyan" :background "black"))) 
  "Txt2Tags Section Titles." :group 'txt2tags-faces)

(defface t2t-sections-face-3 '((t (:foreground "cyan" :background "black"))) 
  "Txt2Tags Section Titles." :group 'txt2tags-faces)

(defface t2t-sections-face-2 '((t (:foreground "cyan" :background "black"))) 
  "Txt2Tags Section Titles." :group 'txt2tags-faces)

(defface t2t-sections-face-1 '((t (:foreground "cyan" :background "black"))) 
  "Txt2Tags Section Titles." :group 'txt2tags-faces)


;; Comentários yellow4
(defface t2t-comments-face '((t (:foreground "yellow" :background "black"))) 
  "Txt2Tags Date." :group 'txt2tags-faces)

;; listas
(defface t2t-lists-face '((t (:foreground "dodger blue" :background "black"))) 
  "Txt2Tags Lists." :group 'txt2tags-faces)

;; quote
(defface t2t-quote-face '((t (:foreground "black" :background "yellow3"))) 
  "Txt2Tags Quote." :group 'txt2tags-faces)

;; raw
(defface t2t-raw-face '((t (:foreground "spring green" :background "black"))) 
  "Txt2Tags Raw." :group 'txt2tags-faces)

;; region
(defface t2t-region-face '((t (:foreground "green" :background "black"))) 
  "Txt2Tags Region." :group 'txt2tags-faces)

;; imagens
(defface t2t-images-face '((t (:foreground "SlateBlue4" :background "black"))) 
  "Txt2Tags Images." :group 'txt2tags-faces)

;; negrito
(defface t2t-bold-face '((t (:width extra-expanded :weight extra-bold :foreground "white" :background "black"))) 
  "Txt2Tags Bold." :group 'txt2tags-faces)

;; itálico
(defface t2t-italic-face '((t (:slant italic :foreground "SlateBlue2" :background "black"))) 
  "Txt2Tags Italic." :group 'txt2tags-faces)


;; negrito + itálico
(defface t2t-bold-italic-face '((t (:width extra-expanded :weight extra-bold :slant italic
			    :underline nil :foreground "medium slate blue" :background "black"))) 
  "Txt2Tags Bold Italic." :group 'txt2tags-faces)


;; tabelas
(defface t2t-tables-face '((t (:foreground "turquoise4" :background "black" :bold t))) 
  "Txt2Tags Tables." :group 'txt2tags-faces)


;; sublinhado
(defface t2t-underline-face '((t (:underline t :foreground "SlateBlue2" :background "black"))) 
  "Txt2Tags Underline." :group 'txt2tags-faces)

;; linha
(defface t2t-line-face '((t (:bold t :foreground "Blue2" :background "black"))) 
  "Txt2Tags line face." :group 'txt2tags-faces)

;; Here, we append a definition to auto-mode-alist.
;; This tells emacs that when a buffer with a name ending with .t2t is opened, 
;; then t2t-mode should be started in that buffer. Some modes leave this step to the user.

(setq auto-mode-alist
	  (append
	   '(("\\.t2t\\'" . t2t-mode))
	   auto-mode-alist))



(defconst t2t-font-lock-keywords-0
  (list
   ;; raw - NEW
   '("[\"][\"]\\([^`]\\)+?[\"][\"]" . 't2t-verbatim-face)
   ;; Negrito - Bold
   '("[**][**][^ ][-/.,:?_  A-Za-zà-úÀ-Ú0-9]+?[^ ][**][**]" . 't2t-bold-face)
   ;; Itálico - Italic
   '("[/][/][^ ][-/.,:?_  A-Za-zà-úÀ-Ú0-9]+?[^ ][/][/]" . 't2t-italic-face) 
   ;; Sublinhado - Underline
   '("[_][_][^ ][-/.,:?_  A-Za-zà-úÀ-Ú0-9]+?[^ ][_][_]" . 't2t-underline-face)
   ;; verbatim 
   '("^``` .*$" . 't2t-verbatim-face)
   '("^```$" . 't2t-verbatim-face)
   ;; preformatado - prefformated  - verbatim
   '("``\\([^`]\\)+?``" . 't2t-verbatim-face)
   ;; linha horizontal - horizontal line - NEW
   '("-\\{19\\}-+" . 't2t-line-face)
   '("_\\{19\\}_+" . 't2t-line-face)
   '("=\\{19\\}=+" . 't2t-line-face)
   )
  "Minimal highlighting expressions for T2T mode")

(defconst t2t-font-lock-keywords-1
  (append t2t-font-lock-keywords-0
  (list
   ;; Data - Date
   '("%%date\\((%[mMdDyY][-/: ]%[mMdDyY][-/: ]%[mMdDyY])\\)?" . 't2t-date-face)
   '("%%date\\((%[mMdDyY][-/: ]%[mMdDyY])\\)" . 't2t-date-face)
   '("%%date[()%aAbBcdHImMdpSxXyY]+?" . 't2t-date-face)
   ;; Área de Configuração - Configuration area
   ;; casa %!target 
   '("%![-\"\<\>\'\{\}\\=;/.,:?_() A-Za-zà-úÀ-Ú0-9]+" . 't2t-config-face)
   ;; Postproc Area %%!postproc
   '("%%!postproc[-\"\<\>\'\{\}\\=;/.,:?_() A-Za-zà-úÀ-Ú0-9]+" . 't2t-postproc-face)
   ;; Comentários - Comments
   '("^%.*" . 't2t-comments-face)
   ;; Títulos de Seções não numerados - Unnumbered Section titles 
   '("=====[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?=====$" . 't2t-sections-face-5) 
   '("====[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?====$" . 't2t-sections-face-4) 
   '("===[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?===$" . 't2t-sections-face-3) 
   '("==[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?==$" . 't2t-sections-face-2) 
   '("=[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+]+?=$" . 't2t-sections-face-1) 
   ;; Títulos de Seções não numerados com âncora - Unnumbered Section titles with anchors
   '("=====[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?=====\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-5) 
   '("====[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?====\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-4) 
   '("===[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?===\[[-_A-Za-zà-úÀ-Ú0-9\]+\]?$" . 't2t-sections-face-3) 
   '("==[-/.,:?_() A-Za-zà-úÀ-Ú0-9\+=]+?==\[[-_A-Za-zà-úÀ-Ú0-9\]+\]?$" . 't2t-sections-face-2) 
   '("=[-/.,:?_() A-Za-zà-úÀ-Ú0-9]+?=\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-1) 
   ;; Títulos de Seções numerados - Numbered Section titles 
   '("\\+\\+\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+\\+\\+$" . 't2t-sections-face-5) 
   '("\\+\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+\\+$" . 't2t-sections-face-4) 
   '("\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+$" . 't2t-sections-face-3) 
   '("\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+$" . 't2t-sections-face-2) 
   '("\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+$" . 't2t-sections-face-1) 
   ;; Títulos de Seções numerados com âncora- Numbered Section titles with anchors
   '("\\+\\+\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+\\+\\+\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-5) 
   '("\\+\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+\\+\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-4) 
   '("\\+\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\\+\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-3) 
   '("\\+\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\\+\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-2) 
   '("\\+[-/.,:?_() A-Za-zà-úÀ-Ú0-9=]+?\\+\[[-_A-Za-zà-úÀ-Ú0-9]+\]?$" . 't2t-sections-face-1) 
   ))
  "Minimal highlighting expressions for T2T mode")


(defconst t2t-font-lock-keywords-2
  (append t2t-font-lock-keywords-1
		  (list
		   ;; image
		   '("\\[\\([-/.,:?_A-Za-zà-úÀ-Ú0-9]*\\)+\\]" . 't2t-images-face)
		   '("^ \\[\\([-/.,:?_A-Za-zà-úÀ-Ú0-9]*\\)+\\] $" . 't2t-images-face)
		   ;; quote - NEW
		   '("^\t+" . 't2t-quote-face)
		   '("^[ \t]*-" . 't2t-lists-face)
		   ;; colchetes - links 
		   '("\\[\\(.*?\\)\\]" . 't2t-internet-face) 
		   ;; páginas WEB - WEB pages
		   '("\\(http\\|https\\|ftp\\|telnet\\)://[A-Za-z]+[.:@][A-Za-z.:/@?#]+?[A-Za-z0-9=.:~!#$/@%&*?()+-_]+" . 't2t-internet-face)
		   '("\\(www\\|ftp\\)[0-9.]+?[A-Za-z]+[.:@][A-Za-z0-9=.:@~!#$%&/?*()+-_]+" . 't2t-internet-face)
		   ;; e-mails 
		   '("[A-Za-z0-9_.-]+@\\([A-Za-z0-9_-]+\.\\)+" . 't2t-internet-face)
		   ))
  "Additional Keywords to highlight in T2T mode")




(defconst t2t-font-lock-keywords-3
  (append t2t-font-lock-keywords-2
	  (list
	   ;; Tabela - Tables
	   ;; linha de titulo de tabela COM e SEM os pipes
	   ;; table title line  WITH and WITHOUT pipes
	   '("^ ?||\\( |\\| \\|\t\\|\\sw\\|[A-Za-zà-úÀ-Ú0-9]\\)+" . 't2t-tables-face)
	   ;; corpo da tabela - table body
	   '("^|\\(\\(\\s.\\|\\sw\\| \\|[A-Za-zà-úÀ-Ú0-9]\\)+\\( |\\)+\\)+" . 't2t-tables-face)
	   ;; corpo da tabela sem pipes - table body without pipes
;;	   '("^|\\(\\(\\( \\|\t\\)\\(\\s.\\|\\sw\\| \\|[à-úÀ-Ú0-9]\\)+\\)\\)+" . 't2t-tables-face)
	   ;; Listas -- (ainda nao vi como fazer com regioes inteiras)
	   ;; Lists
	   '("^[ \t]+- \\b" . 't2t-lists-face )
	   ;; definition list
	   '("^[ \t]*: \\b" . 't2t-lists-face )
	   ;; listas numeradas
	   '("^[ \t]*\\+ \\b" . 't2t-lists-face )
	   ;; numeros com cor também
	   '(" -?[0-9.]+" . 't2t-numbers-face)
	   )
	  )
  "Complete highlighting in T2T mode")


(defconst t2t-font-lock-keywords-4
  (append t2t-font-lock-keywords-3
	  (list
	   ;; regiões !!
	   '(txt2tags-region-lock-matcher
	     (0 't2t-region-face) 
	     (1 't2t-region-face))
	   )
	  )
  "Regions highlighting in T2T mode")


(defvar t2t-font-lock-keywords t2t-font-lock-keywords-4
  "Default highlighting expressions for Txt2Tags mode")


;; A syntax table tells Emacs how it should treat various tokens in your text for various functions,
;; including movement within the buffer and syntax highlighting. 
;; For example, how does Emacs know to move forward by one word (as used in the forward-word function)
;; The syntax table gives Emacs this kind of information. 
;; The syntax table is also used by the syntax highlighting package. 
;; It is for this reason that we want to modify the syntax table for t2t-mode.


;;  Original idea from font-latex-match-math-env command in font-latex.el.
;; retirado do emacs-wiki. Enquanto eu não tiver mais conhecimentos de lisp, fica como está
 (defun txt2tags-region-lock-matcher (limit)
   "
 ```
 This region will be highlighted
 ```
 " 
  ;; search for the begin of the first region
  (when (re-search-forward "^```$" limit t)
    (let ((beg (match-end 0)) end ; 1st Region
		  beg2 end2 ; 2nd Region
		) 
	  ;; search for end of region 1 and start of region 2
      (if (re-search-forward "^```$" limit t)
		  (progn
			(setq end (match-beginning 0)
				  beg2 (match-end 0))
			;; search for end of region 2
			(if (re-search-forward "^#end\n" limit t)
				(setq end2 (- (match-beginning 0) 1))
			  ;; no match -> length of region 2 = 0
			  (setq end2 beg2)))
		;; no match -> length of region 1 = 0
        (setq end (point)))
	  ;; save the regions
	  (store-match-data (list beg end beg2 end2))
      t)))



(defvar t2t-mode-syntax-table nil
  "Syntax table for t2t-mode.")

(defun t2t-create-syntax-table ()
  (if t2t-mode-syntax-table
      ()
    (setq t2t-mode-syntax-table (make-syntax-table))
	
    ;; The first modification we make to the syntax table is to declare the 
    ;; underscore character '_' as being a valid part of a word. 
    ;; So now, a string like foo_bar will be treated as one word rather than two 
    ;; (the default Emacs behavior). 
    
    (modify-syntax-entry ?_ "w" t2t-mode-syntax-table))
  
  
  (set-syntax-table t2t-mode-syntax-table))


;; Here we define our entry function, give it a documentation string, make it interactive,
;;  and call our syntax table creation function.

(defun t2t-mode ()
  "Major mode for editing Txt2Tags files"
  (interactive)
  (kill-all-local-variables)
  (t2t-create-syntax-table)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults
		'(t2t-font-lock-keywords))


;; Muda a variável compile-command para txt2tags arquivo.t2t

  (add-hook 't2t-mode-hook
	    (lambda ()
	      (set (make-local-variable 'compile-command)
		   (let ((file (file-name-nondirectory buffer-file-name)))
		     (concat t2t-program " -t " t2t-default-target " " file)))))
  
;; Ativa por padrão o syntax higlight

  (add-hook 't2t-mode-hook 'turn-on-font-lock)


  (setq major-mode 't2t-mode)
  (setq mode-name "T2T")
  (run-hooks 't2t-mode-hook))

(provide 't2t-mode)

;; Kenzo
(setq indent-tabs-mode 'tab)
(setq tab-width 2)
(setq fill-column 72)
