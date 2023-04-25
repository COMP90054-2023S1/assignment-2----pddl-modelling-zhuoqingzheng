(define (domain BubbleTeaRobot)
    (:requirements :strips :typing :negative-preconditions :conditional-effects :equality :disjunctive-preconditions)

    (:types
        ice - obj
        tea - notBalls 
        tapioca-balls - obj
        syrup - notBalls
        notBalls - obj
        obj flavor

    )
    (:constants
        ORIGINAL - flavor
        ICE - ice
        TEA - tea
        T-BALLS - tapioca-balls
        SYRUP - syrup
    )

    (:predicates
        (heated ?x - obj ?f - flavor)
        (inCup ?x - obj ?f - flavor)
        (hasTea)
        (hasBalls)
        (hasSyrup)
        (addedIce)
        (isHeated)
       
        (iced)
        (empty)
        
        (needBalls)
        (needSyrup)
        (need2Syrup)
        (needTea)
        (unheated ?x - obj ?f - flavor)
    )

    (:action addIce
        :parameters ()
        :precondition (and (not (iced)) (not (addedIce)) )
        :effect (and
            
            (inCup ICE ORIGINAL)
            (not (empty))
            (addedIce)
            (forall
                (?x - notBalls ?f - flavor)
                (when
                    (heated ?x ?f)
                    (and (unheated ?x ?f) (not (heated ?x ?f)) (not (iced)) )))
            (when (not (isHeated)) (iced))


        )

    )
    (:action addTea
        :parameters ()
        :precondition (and (not (hasTea)) (needTea))
        :effect (and
            (inCup TEA ORIGINAL)
            (unheated TEA ORIGINAL)
            (hasTea)
            (not (empty))
        )

    )

    (:action addBalls
        :parameters (?f - flavor)
        :precondition (and (not (hasBalls)) (or (needBalls) (need2Syrup)))
        :effect (and
            (inCup T-BALLS ?f)
            (unheated T-BALLS ?f)
            (not (empty))
            (hasBalls)
        )
    )
    (:action addSyrup
        :parameters (?f - flavor)
        :precondition (and (not (hasSyrup)) (or (needSyrup) (need2Syrup)))
        :effect (and
            (inCup SYRUP ?f)
            (unheated SYRUP ?f)
            (not (empty))
            (hasSyrup)
        )
    )



)