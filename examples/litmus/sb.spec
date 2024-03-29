; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @sb__y i16);
(declare-var @sb__x i16);
(declare-var @sb__s i16);
(declare-var @sb__r i16); 
;; -----------------------------------------
;; Declare thread P0
;; -----------------------------------------
;; Declare threads
(declare-thread p0 sb__thread_p0) ; param name entry_function
(invoke-parameters p0 repeated 20 priority 2)
(end-thread p0)

;; -----------------------------------------
;; Declare thread P1
;; -----------------------------------------
;
(declare-thread p1 sb__thread_p1) ; param name entry_function
(invoke-parameters p1 repeated 20 priority 1)
;(pre-condition p1 (assert(and (= @sb__x #x0000) (= @sb__y #x0000))))
(end-thread p1)

(pre-condition all (assert (and (= @sb__x #x0000) (= @sb__y #x0000))))
(post-condition all (assert(or (= @sb__s #x0001) (= @sb__r #x0001))))
