(define (domain BubbleTeaRobot)
    (:requirements :strips :typing :negative-preconditions :conditional-effects :equality :disjunctive-preconditions)

    (:types
        ice - obj
        tea - notBalls
        tapioca-balls - obj
        syrup - notBalls
        notBalls - obj
        obj flavor cup

    )
    (:constants
        ORIGINAL - flavor
        ICE - ice
        TEA - tea
        CUP1 - cup
        CUP2 - cup

        T-BALLS - tapioca-balls
        SYRUP - syrup
    )

    (:predicates
        (heated ?x - obj ?f - flavor)
        (inCupC1 ?x - obj ?f - flavor)
        (inCupC2 ?x - obj ?f - flavor)
        (inBoth ?x - obj ?f - flavor)
        (hasTeaC1)
        (hasBallsC1)
        (hasSyrupC1)
        (hasTea)
        (hasBalls)
        (hasSyrup)

        (addedIce)

        (icedC1)
        (emptyC1)
        (hasTeaC2)
        (hasBallsC2)
        (hasSyrupC2)
        (mixedC1)
        (mixedC2)
        (mixed)
        (icedC2)
        (emptyC2)
        (heatedCup ?x - cup)
        (needSyrup)
        (needBalls)
        (needTea)
        (need2Syrup)

        (unheated ?x - obj ?f - flavor)
    )

    (:action addIceC1
        :parameters ()
        :precondition (not (addedIce))
        :effect (and
            
            (inCupC1 ICE ORIGINAL)
            (inBoth ICE ORIGINAL)
            (not (emptyC1))
            (addedIce)
            (forall
                (?x - notBalls ?f - flavor)
                (when
                    (heated ?x ?f)
                    (and (unheated ?x ?f) (not (heated ?x ?f)) (not (icedC1)) )))
            (when (not (heatedCup CUP1)) (icedC1))

        )

    )
    (:action addIceC2
        :parameters ()
        :precondition (and (not (addedIce)))
        :effect (and
            
            (inBoth ICE ORIGINAL)
            (inCupC1 ICE ORIGINAL)
            (not (emptyC2))
            (addedIce)
            (forall
                (?x - notBalls ?f - flavor)
                (when
                    (heated ?x ?f)
                    (and (unheated ?x ?f) (not (heated ?x ?f)) (not (icedC2)))))
            (when (not (heatedCup CUP2)) (icedC2))
        )

    )

    (:action addTeaC1
        :parameters ()
        :precondition (and (not (hasTea)) (needTea))
        :effect (and
            (inCupC1 TEA ORIGINAL)
            (inBoth TEA ORIGINAL)
            (unheated TEA ORIGINAL)
            (hasTeaC1)
            (hasTea)
            (not (emptyC1))
        )

    )
    (:action addTeaC2
        :parameters ()
        :precondition (and (not (hasTea)) (needTea))
        :effect (and
            (inCupC2 TEA ORIGINAL)
            (inBoth TEA ORIGINAL)
            (unheated TEA ORIGINAL)
            (hasTeaC2)
            (hasTea)
            (not (emptyC2))
        )
    )

    (:action addBallsC1
        :parameters (?f - flavor)
        :precondition (and (not (hasBalls)) (or (needBalls) (need2Syrup)))
        :effect (and
            (inCupC1 T-BALLS ?f)
            (inBoth T-BALLS ?f)
            (unheated T-BALLS ?f)
            (not (emptyC1))
            (hasBallsC1)
            (hasBalls)
        )
    )
    (:action addBallsC2
        :parameters (?f - flavor)
        :precondition (and (not (hasBalls)) (or (needBalls) (need2Syrup)))
        :effect (and
            (inCupC2 T-BALLS ?f)
            (inBoth T-BALLS ?f)
            (unheated T-BALLS ?f)
            (not (emptyC2))
            (hasBallsC2)
            (hasBalls)
        )
    )

    (:action addSyrupC1
        :parameters (?f - flavor)
        :precondition (and (not (hasSyrup)) (or (needSyrup) (need2Syrup)))
        :effect (and
            (inCupC1 SYRUP ?f)
            (unheated SYRUP ?f)
            (not (emptyC1))
            (hasSyrup)
            (hasSyrupC1)
        )
    )
    (:action addSyrupC2
        :parameters (?f - flavor)
        :precondition (and (not (hasSyrup)) (or (needSyrup) (need2Syrup)))
        :effect (and
            (inCupC2 SYRUP ?f)
            (unheated SYRUP ?f)
            (not (emptyC2))
            (hasSyrup)
            (hasSyrupC2)
        )
    )

    (:action heatC1
        :parameters ()
        :precondition (and (not (emptyC1)) (not (heatedCup CUP1)) )
        :effect (and (forall
                (?x - ice)
                (and (not (inCupC1 ?x ORIGINAL)) (not (icedC1))))
            (forall
                (?x - obj ?f - flavor)
                (when
                    (inCupC1 ?x ?f)
                    (and (heated ?x ?f) (not (unheated ?x ?f))))
            )
            (not (icedC1))
            (heatedCup CUP1)

        )
    )

    (:action heatC2
        :parameters ()
        :precondition (and (not (emptyC2)) (not (heatedCup CUP2)))
        :effect (and (forall
                (?x - ice)
                (and (not (inCupC2 ?x ORIGINAL)) (not (icedC2))))
            (forall
                (?x - obj ?f - flavor)
                (when
                    (inCupC2 ?x ?f)
                    (and (heated ?x ?f) (not (unheated ?x ?f))))
            )
            (not (icedC2))
            (heatedCup CUP2)

        )
    )

    (:action tipToC1
        :parameters ()
        :precondition (not (emptyC2))
        :effect (and (forall
                (?x - obj ?f - flavor)
                (when
                    (inCupC2 ?x ?f)
                    (and (not (inCupC2 ?x ?f))
                        (inCupC1 ?x ?f))))
            (emptyC2)
            (not (hasSyrupC2))
            (not (hasBallsC2))
            (not (hasTeaC2))
            (not (icedC2))
            (not (heatedCup CUP2))
            (when
                (icedC2)
                (icedC1))
            (when
                (heatedCup CUP1)
                (not (icedC1)))
            
        )
    )
    (:action mixC1
        :parameters ()
        :precondition (and (not (emptyC1)) (not (mixedC1) ) (or (not (hasBalls)) (not (hasSyrup)) (need2Syrup))  (or (and (hasSyrupC1) (hasTeaC1)) (and (hasSyrupC1) (hasBallsC1)) (and (hasTeaC1) (hasBallsC1))) )
        :effect (and (when
                (and (hasSyrupC1) (hasTeaC1))
                (and (mixed) (mixedC1)) )
            (when
                (and (hasSyrupC1) (hasBallsC1))
                (and (mixed) (mixedC1))
            )
            (when
                (and (hasTeaC1) (hasBallsC1))
                (and (mixed) (mixedC1))
            )
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (icedC1) (inCupC1 ?b ?f))
                    (and (not (inCupC1 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCupC1 SYRUP ?f) (unheated SYRUP ?f))))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (not (icedC1)) (inCupC1 ?b ?f))
                    (and (not (inCupC1 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCupC1 SYRUP ?f) (heated SYRUP ?f))))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (unheated ?b ?f)  (inCupC1 ?b ?f))
                    (and (not (inCupC1 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCupC1 SYRUP ?f) (unheated SYRUP ?f))))

        )
    )

(:action mixC2
        :parameters ()
        :precondition (and (not (emptyC2)) (not (mixedC2) ) (or (not (hasBalls)) (not (hasSyrup)) (need2Syrup))  (or (and (hasSyrupC2) (hasTeaC2)) (and (hasSyrupC2) (hasBallsC2)) (and (hasTeaC2) (hasBallsC2))) )
        :effect (and (when
                (and (hasSyrupC2) (hasTeaC2))
                (and (mixed) (mixedC2)))
            (when
                (and (hasSyrupC2) (hasBallsC2))
                (and (mixed) (mixedC2))
            )
            (when
                (and (hasTeaC2) (hasBallsC2))
                (and (mixed) (mixedC2))
            )
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (icedC2) (inCupC2 ?b ?f))
                    (and (not (inCupC2 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f)) (inCupC2 SYRUP ?f) (unheated SYRUP ?f) )))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (not (icedC2)) (inCupC2 ?b ?f))
                    (and (not (inCupC2 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCupC2 SYRUP ?f) (heated SYRUP ?f))))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (unheated ?b ?f)  (inCupC2 ?b ?f))
                    (and (not (inCupC2 ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCupC2 SYRUP ?f) (unheated SYRUP ?f))))
          
            

        )
    )

)