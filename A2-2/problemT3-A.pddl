(define (problem t3A)
  (:domain BubbleTeaRobot)

  (:objects
    mango - flavor
    orange - flavor
    lime - flavor
  )
  (:init
    (emptyC1) (emptyC2) (needSyrup) (needBalls) (needTea))
  (:goal
    (AND
      (inCupC1 TEA ORIGINAL)
      (unheated TEA ORIGINAL)
      (inCupC1 SYRUP mango)
      (unheated SYRUP mango)
      (inCupC1 T-BALLS mango)
      (heated T-BALLS mango)
      (not (icedC1))
      (not (heatedCup CUP1))
      (mixed)
     
      )
  )
)
