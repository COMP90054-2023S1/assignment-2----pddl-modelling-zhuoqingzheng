(define (problem t1)
  (:domain BubbleTeaRobot)

  (:objects
    mango - flavor
    orange - flavor
    lime - flavor
  )
  (:init
    (empty) (needTea) (need2Syrup))
  (:goal
    (AND
      (inCup tea ORIGINAL)
      (inCup SYRUP lime)
      (inCup SYRUP mango)
      (iced)
    
    
      )
  )
)