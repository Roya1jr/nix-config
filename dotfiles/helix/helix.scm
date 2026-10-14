; helix.scm: defines commands and keybindings

(provide steel-hello)

;;@doc
;; Prints a message to the Steel debug window, to confirm plugins load.
(define (steel-hello)
  (displayln "Steel is working"))
