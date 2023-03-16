; This is a comment

(declare-var result1 int); 
(declare-var result2 int); 
(declare-var result3 int); 

(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
(end-thread one)

(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
(end-thread two)

(declare-thread three thread2)
(invoke-parameters three repeated 1 priority 1)
(end-thread three)

(post-condition all (assert (= result3 1)))
;(post-condition all (assert (not (and (= result1 0) (= result2 0) (= result3 0) ) )))
;(= result6 0)

