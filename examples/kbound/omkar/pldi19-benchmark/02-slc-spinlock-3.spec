; This is a comment

(declare-var data int); 

(declare-thread one thread0) ; param name entry_function
(invoke-parameters one repeated 1 priority 1)
(end-thread one)

(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
(end-thread two)

(declare-thread three thread2)
(invoke-parameters three repeated 1 priority 1)
(end-thread three)

(post-condition all (assert ( (= data 126))))


