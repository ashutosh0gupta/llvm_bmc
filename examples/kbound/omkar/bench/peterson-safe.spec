; This is a comment

(declare-var var int); 

(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
(end-thread one)
(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
(end-thread two)

(post-condition all (assert ( or (= var 2) (= var 1) (= var 0))))
;

