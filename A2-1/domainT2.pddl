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
        (mixed)
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
                    (and (unheated ?x ?f) (not (heated ?x ?f)) (not (iced)))))
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
    (:action heat
        :parameters ()
        :precondition (and (not (empty) ) (not (isHeated)))
        :effect (and (forall
                (?x - ice)
                (and (not (inCup ?x ORIGINAL)) (not (iced))))
            (forall
                (?x - obj ?f - flavor)
                (when
                    (inCup ?x ?f)
                    (and (heated ?x ?f) (not (unheated ?x ?f))))
            )
            (not (iced))
            (isHeated)
        )
    )

    (:action mix
        :parameters ()
        :precondition (and (not (empty)) (not (mixed)) (or (not (hasBalls)) (not (hasSyrup)) (need2Syrup)) (or (and (hasSyrup) (hasTea)) (and (hasSyrup) (hasBalls)) (and (hasTea) (hasBalls)))  )
        :effect (and 
            (mixed)
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (iced))
                    (and (not (inCup ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f)) (inCup SYRUP ?f) (unheated SYRUP ?f) )))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (heated ?b ?f) (not (iced)))
                    (and (not (inCup ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f)) (inCup SYRUP ?f) (heated SYRUP ?f) )))
            (forall
                (?b - tapioca-balls ?f - flavor)
                (when
                    (and (unheated ?b ?f))
                    (and (not (inCup ?b ?f)) (not (heated ?b ?f)) (not (unheated ?b ?f))  (inCup SYRUP ?f) (unheated SYRUP ?f) )))
                       

        )
    )
)