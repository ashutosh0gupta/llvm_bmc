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

(declare-thread four thread3)
(invoke-parameters four repeated 1 priority 1)
(end-thread four)

(declare-thread five thread4)
(invoke-parameters five repeated 1 priority 1)
(end-thread five)

(declare-thread six thread5)
(invoke-parameters six repeated 1 priority 1)
(end-thread six)

(post-condition all (assert(= data 252)))

