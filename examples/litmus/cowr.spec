; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @cowr__x i16);
(declare-var @cowr__r i16);
;; -----------------------------------------
;; Declare thread P0
;; -----------------------------------------
;; Declare threads
(declare-thread p0 cowr__thread_p0) ; param name entry_function
(invoke-parameters p0 repeated 20 priority 2)
;(post-condition p0 (assert(or (= @sb__s #x0001) (= @sb__r #x0001))))
(end-thread p0)

;; -----------------------------------------
;; Declare thread P1
;; -----------------------------------------
;
(declare-thread p1 cowr__thread_p1) ; param name entry_function
(invoke-parameters p1 repeated 20 priority 1)
(end-thread p1)

(pre-condition all (assert(= @cowr__x #x0000)))
(post-condition all (assert(or (not(= @cowr__r #x0002)) (not(= @cowr__x #x0001)))))
