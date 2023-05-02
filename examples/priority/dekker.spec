; This is a comment

(declare-var var i16); 

(declare-thread one dekker__thread0)
(invoke-parameters one repeated 1 priority 1)
(end-thread one)
(declare-thread two dekker__thread1)
(invoke-parameters two repeated 1 priority 1)
(end-thread two)

(post-condition all (assert (= var #x0002)))
;

