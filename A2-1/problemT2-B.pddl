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
      (unheated tea ORIGINAL)
      ;(inCup T-BALLS mango)
      ;(heated T-BALLS mango)
      (inCup SYRUP mango)
      (unheated SYRUP mango)
      (inCup SYRUP lime)
      (unheated SYRUP lime)
      (mixed)
      (iced)
      )
  )
)
