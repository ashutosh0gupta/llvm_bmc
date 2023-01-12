; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @main__step1 i16); output
(declare-var @main__combinederrorflag flag); output
(declare-var @main__stageflg flag); input
(declare-var @main__stageflgc  flag); input
(declare-var @minor_cycle__maj2minc i16)
(declare-var @minor_cycle__maj2min i16)

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
;(post-condition minor (CallSequence main__stageflags minor_cycle__stage3_minor))
(end-thread minor)

(pre-condition all (assert(= (bvadd @main__stageflg @main__stageflgc) #xffff)))
(post-condition all (assert(= @main__combinederrorflag #x0000)))
;(post-condition all (assert(=> (= @minor_cycle__test_min #x0014) (= @minor_cycle__offstage3 #x0001))))
