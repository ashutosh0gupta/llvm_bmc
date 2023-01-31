; This is a comment
 

(declare-thread one thread0)
(invoke-parameters one repeated 1 priority 1)
(weak-memory-model one SC)
(end-thread one)
(declare-thread two thread1)
(invoke-parameters two repeated 1 priority 1)
(weak-memory-model two SC)
(end-thread two)
(declare-thread three thread2)
(invoke-parameters three repeated 1 priority 1)
(end-thread three)
(declare-thread four thread3)
(invoke-parameters four repeated 1 priority 1)
(weak-memory-model four SC)
(end-thread four)
(declare-thread five thread4)
(invoke-parameters five repeated 1 priority 1)
(weak-memory-model five SC)
(end-thread five)
(declare-thread six thread5)
(invoke-parameters six repeated 1 priority 1)
(weak-memory-model six SC)
(end-thread six)
(declare-thread seven thread6)
(invoke-parameters seven repeated 1 priority 1)
(weak-memory-model seven SC)
(end-thread seven)
(declare-thread eight thread7)
(invoke-parameters eight repeated 1 priority 1)
(weak-memory-model eight SC)
(end-thread eight)



;
