(define (problem t1)
  (:domain BubbleTeaRobot)

  (:objects
    mango - flavor
    orange - flavor
    lime - flavor
  )
  (:init
    (empty) (needTea) (needBalls) (needSyrup))
  (:goal
    (AND
      (inCup tea ORIGINAL)
      (inCup SYRUP lime)
      (inCup T-BALLS mango)
      (iced)
    
    
      )
  )
)
