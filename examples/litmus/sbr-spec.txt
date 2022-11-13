; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @sbr__y i16);
(declare-var @sbr__x i16);
(declare-var @sbr__r i16); 
;; -----------------------------------------
;; Declare thread P0
;; -----------------------------------------
;; Declare threads
(declare-thread p0 sbr__thread_p0) ; param name entry_function
(invoke-parameters p0 repeated 20 priority 2)
;(post-condition p0 (assert(or (= @sb__s #x0001) (= @sb__r #x0001))))
(end-thread p0)

;; -----------------------------------------
;; Declare thread P1
;; -----------------------------------------
;
(declare-thread p1 sbr__thread_p1) ; param name entry_function
(invoke-parameters p1 repeated 20 priority 1)
(end-thread p1)

(pre-condition all (assert(and (= @sbr__x #x0000) (= @sbr__y #x0000))))
(post-condition all (assert(or (not(= @sbr__y #x0002)) (= @sbr__r #x0001))))
