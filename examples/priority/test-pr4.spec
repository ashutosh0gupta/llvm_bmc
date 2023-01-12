; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @main__majorcnt i16); input
(declare-var @main__minorcnt i16)
(declare-var @main__microcnt i16)

;; -----------------------------------------
;; Declare major thread
;; -----------------------------------------
;; Declare threads
(declare-thread major main__guid_major) ; param name entry_function
(invoke-parameters major repeated 500 priority 3)
;

(end-thread major)

;; -----------------------------------------
;; Declare minor thread
;; -----------------------------------------
;
(declare-thread minor main__guid_minor)
(invoke-parameters minor repeated 20 priority 2)
;
(end-thread minor)

;; -----------------------------------------
;; Declare micro thread
;; -----------------------------------------
;
(declare-thread micro main__guid_micro)
(invoke-parameters micro repeated 10 priority 1)
;
(end-thread micro)

(pre-condition all (assert(= @main__microcnt #x0000)))
(pre-condition all (assert(= @main__minorcnt #x0000)))
(pre-condition all (assert(= @main__majorcnt #x0000)))
(post-condition all (assert(bvuge @main__microcnt @main__minorcnt)))
(post-condition all (assert(bvuge @main__minorcnt @main__majorcnt)))
