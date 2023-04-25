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
      (unheated tea ORIGINAL)
      (inCup T-BALLS mango)
      (heated T-BALLS mango)
      (inCup SYRUP mango)
      (unheated SYRUP mango)

      (mixed)
      (not (iced))
      )
  )
)