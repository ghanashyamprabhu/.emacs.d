;; Time-stamp: <2016-08-08 16:33:27 kmodi>

;; Enable PragmataPro ligatures
;; Tested to work with version 0.822
;; https://www.reddit.com/r/emacs/comments/4sm6fa/how_to_enable_pragmatapro_ligatures/

;; https://gist.github.com/kwf/dea7bc51101083acb95c875140e2a96d
;; PRETTIFY SYMBOLS (with Pragmata Pro)
(defun modi/setup-pragmata-ligatures ()
  (setq-local prettify-symbols-alist
              (append prettify-symbols-alist
                      '(("!!"   . ?)
                        ("!="   . ?)
                        ("!=="  . ?)
                        ("!≡"   . ?)
                        ("!≡≡"  . ?)
                        ("!>"   . ?)
                        ("#("   . ?)
                        ("#_"   . ?)
                        ("#{"   . ?)
                        ("#?"   . ?)
                        ("#>"   . ?)
                        ("%="   . ?)
                        ("%>"   . ?)
                        ("<~"   . ?)
                        ("&%"   . ?)
                        ("&&"   . ?)
                        ("&*"   . ?)
                        ("&+"   . ?)
                        ("&-"   . ?)
                        ("&/"   . ?)
                        ("&="   . ?)
                        ("&&&"  . ?)
                        ("&>"   . ?)
                        ("$>"   . ?)
                        ("~>"   . ?)
                        ("***"  . ?)
                        ("*="   . ?)
                        ("*/"   . ?)
                        ("*>"   . ?)
                        ("++"   . ?)
                        ("+++"  . ?)
                        ("+="   . ?)
                        ("+>"   . ?)
                        ("--"   . ?)
                        ("-<"   . ?)
                        ("-<<"  . ?)
                        ("-="   . ?)
                        ("->>"  . ?)
                        ("---"  . ?)
                        ;; ("-->"  . ?) ; Unknown character
                        (".."   . ?)
                        ("..."  . ?)
                        ("..<"  . ?)
                        (".>"   . ?)
                        (".~"   . ?)
                        (".="   . ?)
                        ("/*"   . ?)
                        ;; ("//"   . ?) ; This results in annoying fontification in any major mode
                        ("/>"   . ?)
                        ("/="   . ?)
                        ("/=="  . ?)
                        ("///"  . ?)
                        ("/**"  . ?)
                        ("::"   . ?)
                        (":="   . ?)
                        (":≡"   . ?)
                        (":>"   . ?)
                        ;; (":=>"  . ?) ; Unknown character
                        ("<$>"  . ?)
                        ("<*"   . ?)
                        ("<*>"  . ?)
                        ("<+>"  . ?)
                        ("<-"   . ?)
                        ("<<"   . ?)
                        ("<<<"  . ?)
                        ("<<="  . ?)
                        ("<="   . ?)
                        ("<=>"  . ?)
                        ("<>"   . ?)
                        ("<|>"  . ?)
                        ("<<-"  . ?)
                        ("<|"   . ?)
                        ("<=<"  . ?)
                        ("<~~"  . ?)
                        ("<<~"  . ?)
                        ("<$"   . ?)
                        ("<+"   . ?)
                        ("<!>"  . ?)
                        ("<@>"  . ?)
                        ("<#>"  . ?)
                        ("<%>"  . ?)
                        ("<^>"  . ?)
                        ("<&>"  . ?)
                        ("<?>"  . ?)
                        ("<.>"  . ?)
                        ("</>"  . ?)
                        ("<\>"  . ?)
                        ("<\">" . ?)
                        ("<:>"  . ?)
                        ("<~>"  . ?)
                        ("<**>" . ?)
                        ("<<^"  . ?)
                        ("<!"   . ?)
                        ("<@"   . ?)
                        ("<#"   . ?)
                        ("<%"   . ?)
                        ("<^"   . ?)
                        ("<&"   . ?)
                        ("<?"   . ?)
                        ("<."   . ?)
                        ("</"   . ?)
                        ("<\\"  . ?)
                        ("<\""  . ?)
                        ("<:"   . ?)
                        ;; ("<->"  . ?) ; Unknown character
                        ;; ("<!--" . ?) ; Unknown character
                        ;; ("<--"  . ?) ; Unknown character
                        ("=<<"  . ?)
                        ("=="   . ?)
                        ("==="  . ?)
                        ("==>"  . ?)
                        ("=>"   . ?)
                        ("=~"   . ?)
                        ("=>>"  . ?)
                        ("≡≡"   . ?)
                        ("≡≡≡"  . ?)
                        ("≡:≡"  . ?)
                        (">-"   . ?)
                        (">="   . ?)
                        (">>"   . ?)
                        (">>-"  . ?)
                        (">>="  . ?)
                        (">>>"  . ?)
                        (">=>"  . ?)
                        (">>^"  . ?)
                        ("??"   . ?)
                        ("?~"   . ?)
                        ("?="   . ?)
                        ("?>"   . ?)
                        ("^="   . ?)
                        ("^."   . ?)
                        ("^?"   . ?)
                        ("^.."  . ?)
                        ("^<<"  . ?)
                        ("^>>"  . ?)
                        ("^>"   . ?)
                        ;; ("\\\\" . ?) ; "\\\\" → "" messes up `easy-escape-minor-mode'
                        ("\\>"  . ?)
                        ("@>"   . ?)
                        ("|="   . ?)
                        ("||"   . ?)
                        ("|>"   . ?)
                        ("|||"  . ?)
                        ("|+|"  . ?)
                        ("~="   . ?)
                        ("~~>"  . ?)
                        ("~>>"  . ?))))

  ;; "<=" *cannot* be represented by "" everywhere in `verilog-mode'!
  ;; Depending on the use, it could mean either an "assigned" operation or a
  ;; "less than or equal to" math operation. So remove this from the alist for
  ;; this mode.
  (when (derived-mode-p 'verilog-mode)
    (setq-local prettify-symbols-alist
                (delq (assoc "<=" prettify-symbols-alist) prettify-symbols-alist)))

  (when (derived-mode-p 'org-mode)
    ;; "<#>" → "" breaks the org-table indentation if a cell contains "<#>"
    (setq-local prettify-symbols-alist
                (delq (assoc "<#>" prettify-symbols-alist) prettify-symbols-alist))
    ;; "<#" → "" breaks the org-table indentation if a cell contains "<#>"
    (setq-local prettify-symbols-alist
                (delq (assoc "<#" prettify-symbols-alist) prettify-symbols-alist))
    ;; "#>" → "" breaks the org-table indentation if a cell contains "<#>"
    (setq-local prettify-symbols-alist
                (delq (assoc "#>" prettify-symbols-alist) prettify-symbols-alist))
    ;; "***" → "" breaks the 'hidestars' feature in org-mode
    (setq-local prettify-symbols-alist
                (delq (assoc "***" prettify-symbols-alist) prettify-symbols-alist)))

  (when (derived-mode-p 'sml-mode)
    (setcdr (assoc "andalso" sml-font-lock-symbols-alist) "")
    (setcdr (assoc "orelse" sml-font-lock-symbols-alist) "")))

(dolist (hook modi/prettify-symbols-mode-hooks)
  (add-hook hook #'modi/setup-pragmata-ligatures))


(provide 'setup-pragmata-ligatures)
