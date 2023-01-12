; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @main__step1 i16); output
(declare-var @main__combinederrorflag flag); output
(declare-var @main__stageflg flag); input
(declare-var @main__stageflgc  flag); input
(declare-var @major_cycle__check_var i16); input
(declare-var @major_cycle__min2maj i16)

;; -----------------------------------------
;; Declare major thread
;; -----------------------------------------
;; Declare threads
(declare-thread major main__guid_major) ; param name entry_function
(invoke-parameters major repeated 40 priority 2)
;

(end-thread major)

;; -----------------------------------------
;; Declare minor thread
;; -----------------------------------------
;
(declare-thread minor main__guid_minor)
(invoke-parameters minor repeated 20 priority 1)
;
(end-thread minor)

(pre-condition all (assert(= @major_cycle__check_var #x0000)))
(pre-condition all (assert(= (bvadd @main__stageflg @main__stageflgc) #xffff)))

(post-condition all (assert(= @major_cycle__check_var #x000a)))
