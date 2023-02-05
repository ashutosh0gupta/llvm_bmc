
; This is a comment

(declare-var result1 int)
(declare-var result2 int)
(declare-var result3 int)
(declare-var result4 int)

(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
(end-thread one)
(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
(end-thread two)
(declare-thread three thread2)
(invoke-parameters three repeated 1 priority 1)
(end-thread three)
(declare-thread four thread3)
(invoke-parameters four repeated 1 priority 1)
(end-thread four)
(declare-thread five thread4)
(invoke-parameters five repeated 1 priority 1)
(end-thread five)

(post-condition all (assert ( not (and (= result1 1) (= result2 0) (= result3 0) (= result4 2)))))

;

