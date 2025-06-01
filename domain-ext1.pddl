(define (domain redflix-ext1)
  (:requirements :strips :typing :negative-preconditions :universal-preconditions)

  (:types contingut)

  (:predicates
    (predecessor?p - contingut?c - contingut)
    (vist?c - contingut)
    (pendent?c - contingut)
    (originalmente-pendent?c - contingut)
  )

  (:action visualitzar
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (forall (?p - contingut)
        (imply (predecessor?p?c) (vist?p))
      )
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )
)