
; This is a comment


(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
;(weak-memory-model one SC)
(end-thread one)
(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
;(weak-memory-model two SC)
(end-thread two)
(declare-thread three thread2)
(invoke-parameters three repeated 1 priority 1)
;(weak-memory-model three SC)
(end-thread three)
(declare-thread four thread3)
(invoke-parameters four repeated 1 priority 1)
;(weak-memory-model four SC)
(end-thread four)


;

