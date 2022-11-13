; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @iriw__x i16);
(declare-var @iriw__y i16);
(declare-var @iriw__r i16);
(declare-var @iriw__s i16);
(declare-var @iriw__t i16);
(declare-var @iriw__u i16);
;; -----------------------------------------
;; Declare thread P0
;; -----------------------------------------
;; Declare threads
(declare-thread p0 iriw__thread_p0) ; param name entry_function
(invoke-parameters p0 repeated 20 priority 2)
;(post-condition p0 (assert(or (= @sb__s #x0001) (= @sb__r #x0001))))
(end-thread p0)
;; -----------------------------------------
;; Declare thread P1
;; -----------------------------------------
;
(declare-thread p1 iriw__thread_p1) ; param name entry_function
(invoke-parameters p1 repeated 20 priority 1)
;(pre-condition p1 (assert(= @cowr__x #x0000)))
;(post-condition p1 (assert(or (not(= @cowr__r #x0002)) (not(= @cowr__x #x0001)))))
(end-thread p1)
;; -----------------------------------------
;; Declare thread P2
;; -----------------------------------------
;
(declare-thread p2 iriw__thread_p2) ; param name entry_function
(invoke-parameters p2 repeated 20 priority 3)
;(pre-condition p1 (assert(= @cowr__x #x0000)))
;(post-condition p1 (assert(or (not(= @cowr__r #x0002)) (not(= @cowr__x #x0001)))))
(end-thread p2)
;; -----------------------------------------
;; Declare thread P3
;; -----------------------------------------
;
(declare-thread p3 iriw__thread_p3) ; param name entry_function
(invoke-parameters p3 repeated 20 priority 4)
(end-thread p3)

(pre-condition all (assert (and (= @iriw__x #x0000) (= @iriw__y #x0000))))
(post-condition all (assert(or (= @iriw__r #x0000) (= @iriw__s #x0001) (= @iriw__t #x0000) (= @iriw__u #x0001))))

