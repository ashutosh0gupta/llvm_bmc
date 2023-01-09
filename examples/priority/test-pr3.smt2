(declare-fun bv_4_main__stageflgc () (_ BitVec 16))
(declare-fun bv_5_main__stageflg () (_ BitVec 16))
(declare-fun bv_1_obclib_E () (_ BitVec 16))
(declare-fun bv_2_main__step1 () (_ BitVec 16))
(declare-fun bv_3_main__combinederrorflag () (_ BitVec 16))
(declare-fun bv_6_main_E () (_ BitVec 16))
(declare-fun bv_7_major_cycle_E () (_ BitVec 16))
(declare-fun bv_9_ () (_ BitVec 16))
(declare-fun bv_8_minor_cycle__maj2minc () (_ BitVec 16))
(declare-fun bv_11_ () (_ BitVec 16))
(declare-fun bv_10_minor_cycle__maj2min () (_ BitVec 16))
(declare-fun bv_12_minor_cycle_E () (_ BitVec 16))
(declare-fun b_1_exit () Bool)
(declare-fun b_3_path () Bool)
(declare-fun bv_13_main__step1 () (_ BitVec 16))
(declare-fun b_4_path () Bool)
(declare-fun bv_14_main__combinederrorflag () (_ BitVec 16))
(declare-fun b_6_path () Bool)
(declare-fun bv_16_mem () (_ BitVec 16))
(declare-fun bv_15_mem () (_ BitVec 16))
(declare-fun b_5_exit () Bool)
(declare-fun minor_cycle__maj2minc@_u3 () (_ BitVec 16))
(declare-fun minor_cycle__maj2min@_u2 () (_ BitVec 16))
(declare-fun b_7_path () Bool)
(declare-fun bv_17_main__combinederrorflag () (_ BitVec 16))
(declare-fun b_8_path () Bool)
(declare-fun bv_18_mem () (_ BitVec 16))
(declare-fun minor_cycle__maj2min@_u8 () (_ BitVec 16))
(declare-fun minor_cycle__maj2minc@_u9 () (_ BitVec 16))
(declare-fun barr@_u6 () Int)
(declare-fun W@minor_cycle__maj2minc@_u9 () Int)
(declare-fun barr@_u5 () Int)
(declare-fun b_9_start () Bool)
(declare-fun barr@_u4 () Int)
(declare-fun barr@_u1 () Int)
(declare-fun b_0_start () Bool)
(declare-fun W@minor_cycle__maj2min@_u8 () Int)
(declare-fun post@_u0 () Int)
(declare-fun R@minor_cycle__maj2minc@_u3 () Int)
(declare-fun R@minor_cycle__maj2min@_u2 () Int)
(declare-fun pre@ () Int)
(declare-fun barr@_u10 () Int)
(declare-fun barr@_u7 () Int)
(declare-fun b_10_start () Bool)
(declare-fun minor_cycle__maj2min-W@minor_cycle__maj2min@_u8-R@minor_cycle__maj2min@_u2
             ()
             Bool)
(declare-fun minor_cycle__maj2min-pre@-R@minor_cycle__maj2min@_u2 () Bool)
(declare-fun minor_cycle__maj2minc-W@minor_cycle__maj2minc@_u9-R@minor_cycle__maj2minc@_u3
             ()
             Bool)
(declare-fun minor_cycle__maj2minc-pre@-R@minor_cycle__maj2minc@_u3 () Bool)
(declare-fun minor_cycle__maj2min@pre () (_ BitVec 16))
(declare-fun minor_cycle__maj2minc@pre () (_ BitVec 16))
(assert (= (bvadd bv_5_main__stageflg bv_4_main__stageflgc) #xffff))
(assert (= bv_1_obclib_E #x0000))
(assert (= bv_2_main__step1 #x0001))
(assert (= bv_3_main__combinederrorflag #x0000))
(assert (= bv_4_main__stageflgc #xffff))
(assert (= bv_5_main__stageflg #x0000))
(assert (= bv_6_main_E #x0000))
(assert (= bv_7_major_cycle_E #x0000))
(assert (= bv_8_minor_cycle__maj2minc bv_9_))
(assert (= bv_10_minor_cycle__maj2min bv_11_))
(assert (= bv_12_minor_cycle_E #x0000))
(assert (= bv_1_obclib_E #x0000))
(assert (= bv_2_main__step1 #x0001))
(assert (= bv_3_main__combinederrorflag #x0000))
(assert (= bv_4_main__stageflgc #xffff))
(assert (= bv_5_main__stageflg #x0000))
(assert (= bv_6_main_E #x0000))
(assert (= bv_7_major_cycle_E #x0000))
(assert (= bv_8_minor_cycle__maj2minc bv_9_))
(assert (= bv_10_minor_cycle__maj2min bv_11_))
(assert (= bv_12_minor_cycle_E #x0000))
(assert true)
(assert (= (= (bvadd bv_5_main__stageflg bv_4_main__stageflgc) #xffff) b_1_exit))
(assert (=> b_3_path (or (and true b_1_exit))))
(assert and)
(assert and)
(assert (= bv_13_main__step1 #x0000))
(assert (=> b_4_path (or (and true (not b_1_exit)))))
(assert and)
(assert and)
(assert (= bv_14_main__combinederrorflag #x0001))
(assert (=> b_6_path (or (and b_3_path true) (and b_4_path true))))
(assert and)
(assert (and (=> (and b_3_path true) (= bv_15_mem bv_13_main__step1))
     (=> (and b_4_path true) (= bv_15_mem bv_2_main__step1))
     (=> (and b_3_path true) (= bv_16_mem bv_3_main__combinederrorflag))
     (=> (and b_4_path true) (= bv_16_mem bv_14_main__combinederrorflag))))
(assert (= (distinct (bvadd minor_cycle__maj2min@_u2 minor_cycle__maj2minc@_u3) #xffff)
   b_5_exit))
(assert (=> b_7_path (or (and b_6_path b_5_exit))))
(assert and)
(assert and)
(assert (= bv_17_main__combinederrorflag (bvor bv_16_mem #x0002)))
(assert (=> b_8_path (or (and b_6_path (not b_5_exit)) (and b_7_path true))))
(assert and)
(assert (and (=> (and b_6_path (not b_5_exit)) (= bv_18_mem bv_16_mem))
     (=> (and b_7_path true) (= bv_18_mem bv_17_main__combinederrorflag))))
(assert (= bv_1_obclib_E #x0000))
(assert (= bv_2_main__step1 #x0001))
(assert (= bv_3_main__combinederrorflag #x0000))
(assert (= bv_4_main__stageflgc #xffff))
(assert (= bv_5_main__stageflg #x0000))
(assert (= bv_6_main_E #x0000))
(assert (= bv_7_major_cycle_E #x0000))
(assert (= bv_8_minor_cycle__maj2minc bv_9_))
(assert (= bv_10_minor_cycle__maj2min bv_11_))
(assert (= bv_12_minor_cycle_E #x0000))
(assert true)
(assert (= minor_cycle__maj2min@_u8 #x1111))
(assert (= minor_cycle__maj2minc@_u9 #xeeee))
(assert (and b_10_start
     (not (<= barr@_u7 pre@))
     (or (not b_10_start) (not (<= W@minor_cycle__maj2min@_u8 barr@_u7)))
     (not (<= W@minor_cycle__maj2minc@_u9 W@minor_cycle__maj2min@_u8))
     (or (not b_6_path) (not (<= barr@_u10 R@minor_cycle__maj2minc@_u3)))
     (not (<= barr@_u10 W@minor_cycle__maj2minc@_u9))
     (not (<= post@_u0 barr@_u10))
     b_9_start
     (not (<= barr@_u5 pre@))
     (or (not (<= R@minor_cycle__maj2min@_u2 barr@_u1))
         (not (and b_0_start b_6_path)))
     (or (not b_6_path)
         (not (<= R@minor_cycle__maj2minc@_u3 R@minor_cycle__maj2min@_u2)))
     (or (not b_6_path) (not (<= barr@_u6 R@minor_cycle__maj2minc@_u3)))
     (not (<= post@_u0 barr@_u6))
     (or (not (<= barr@_u1 W@minor_cycle__maj2min@_u8))
         (not b_0_start)
         (not (<= W@minor_cycle__maj2min@_u8 barr@_u4)))
     (or (not (<= barr@_u5 W@minor_cycle__maj2min@_u8))
         (not b_9_start)
         (not (<= W@minor_cycle__maj2min@_u8 barr@_u6)))
     (or (not b_0_start)
         (not (<= barr@_u1 W@minor_cycle__maj2minc@_u9))
         (not (<= W@minor_cycle__maj2minc@_u9 barr@_u4)))
     (or (not b_9_start)
         (not (<= barr@_u5 W@minor_cycle__maj2minc@_u9))
         (not (<= W@minor_cycle__maj2minc@_u9 barr@_u6)))))
(assert (distinct pre@
          post@_u0
          W@minor_cycle__maj2min@_u8
          W@minor_cycle__maj2minc@_u9
          barr@_u7
          barr@_u10
          R@minor_cycle__maj2min@_u2
          R@minor_cycle__maj2minc@_u3
          barr@_u5
          barr@_u6))
(assert (let ((a!1 (=> (and minor_cycle__maj2minc-pre@-R@minor_cycle__maj2minc@_u3
                    (=> true (< pre@ W@minor_cycle__maj2minc@_u9))
                    true)
               (=> b_6_path
                   (< R@minor_cycle__maj2minc@_u3 W@minor_cycle__maj2minc@_u9))))
      (a!2 (not (and minor_cycle__maj2minc-W@minor_cycle__maj2minc@_u9-R@minor_cycle__maj2minc@_u3
                     (=> true (< W@minor_cycle__maj2minc@_u9 pre@))
                     true)))
      (a!3 (=> (and minor_cycle__maj2min-pre@-R@minor_cycle__maj2min@_u2
                    (=> true (< pre@ W@minor_cycle__maj2min@_u8))
                    true)
               (=> b_6_path
                   (< R@minor_cycle__maj2min@_u2 W@minor_cycle__maj2min@_u8))))
      (a!4 (not (and minor_cycle__maj2min-W@minor_cycle__maj2min@_u8-R@minor_cycle__maj2min@_u2
                     (=> true (< W@minor_cycle__maj2min@_u8 pre@))
                     true))))
  (and true
       (=> minor_cycle__maj2minc-pre@-R@minor_cycle__maj2minc@_u3
           (and true (= minor_cycle__maj2minc@_u3 minor_cycle__maj2minc@pre)))
       (=> minor_cycle__maj2minc-W@minor_cycle__maj2minc@_u9-R@minor_cycle__maj2minc@_u3
           (and true (= minor_cycle__maj2minc@_u3 minor_cycle__maj2minc@_u9)))
       (=> b_6_path
           (or false
               minor_cycle__maj2minc-pre@-R@minor_cycle__maj2minc@_u3
               minor_cycle__maj2minc-W@minor_cycle__maj2minc@_u9-R@minor_cycle__maj2minc@_u3))
       (=> minor_cycle__maj2min-pre@-R@minor_cycle__maj2min@_u2
           (and true (= minor_cycle__maj2min@_u2 minor_cycle__maj2min@pre)))
       (=> minor_cycle__maj2min-W@minor_cycle__maj2min@_u8-R@minor_cycle__maj2min@_u2
           (and true (= minor_cycle__maj2min@_u2 minor_cycle__maj2min@_u8)))
       (=> b_6_path
           (or false
               minor_cycle__maj2min-pre@-R@minor_cycle__maj2min@_u2
               minor_cycle__maj2min-W@minor_cycle__maj2min@_u8-R@minor_cycle__maj2min@_u2))
       true
       (=> minor_cycle__maj2minc-pre@-R@minor_cycle__maj2minc@_u3
           (=> b_6_path (< pre@ R@minor_cycle__maj2minc@_u3)))
       (=> minor_cycle__maj2minc-W@minor_cycle__maj2minc@_u9-R@minor_cycle__maj2minc@_u3
           (=> b_6_path
               (< W@minor_cycle__maj2minc@_u9 R@minor_cycle__maj2minc@_u3)))
       (=> minor_cycle__maj2min-pre@-R@minor_cycle__maj2min@_u2
           (=> b_6_path (< pre@ R@minor_cycle__maj2min@_u2)))
       (=> minor_cycle__maj2min-W@minor_cycle__maj2min@_u8-R@minor_cycle__maj2min@_u2
           (=> b_6_path
               (< W@minor_cycle__maj2min@_u8 R@minor_cycle__maj2min@_u2)))
       true
       a!1
       a!2
       a!3
       a!4
       true)))
(assert true)
(assert (not (or (not b_8_path) (= bv_18_mem #x0000))))
(check-sat)
