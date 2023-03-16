; This is a comment


;; Declare variable
;; list all the variables that are read
(declare-var @main__errorflag flag); output
(declare-var @thr1__var21c i16); input
(declare-var @thr1__var21 i16); input
(declare-var @thr2__var12c i16)
(declare-var @thr2__var12 i16)

;; -----------------------------------------
;; Declare thread1
;; -----------------------------------------
;; Declare threads
(declare-thread thread1 main__thr1_driver) ; param name entry_function
(invoke-parameters thread1 repeated 20 priority 1)
;
(end-thread thread1)

;; -----------------------------------------
;; Declare thread2
;; -----------------------------------------
;
(declare-thread thread2 main__thr2_driver)
(invoke-parameters thread2 repeated 40 priority 2)
;
(end-thread thread2)

(post-condition all (assert(= @main__errorflag #x0000)))
