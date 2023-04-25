(define (problem t3B)
  (:domain BubbleTeaRobot)

  (:objects
    mango - flavor
    orange - flavor
    lime - flavor
  )
  (:init
    (emptyC1) (emptyC2) (need2Syrup)  (needTea))
  (:goal
    (AND
      (inCupC1 TEA ORIGINAL)
      (unheated TEA ORIGINAL)
      (inCupC1 SYRUP mango)
      (unheated SYRUP mango)
      (inCupC1 SYRUP lime)
      (heated SYRUP lime)
      (icedC1)
      (not (heatedCup CUP1))
      (mixed)
     
      )
  )
)