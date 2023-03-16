
; This is a comment


(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
;(weak-memory-model one SC)
(end-thread one)
(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
;(weak-memory-model two SC)
(end-thread two)

;

