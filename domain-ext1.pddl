(define (domain ricorico-base)
  (:requirements :strips :typing :universal-preconditions)

  (:types first second day)

  (:predicates
    (incompatible ?f - first ?s - second)
    (asigned ?d - day ?f - first ?s - second)
    (repetidoFirst ?f - first)
    (repetidoSecond ?s - second)
  )

  (:action asignar_menu
    :parameters (?d - day ?f - first ?s - second)
    :precondition 
    (and
	 (not (asigned ?d ?f ?s))
     (not (incompatible ?f ?s))
     (not (repetidoFirst ?f))
     (not (repetidoSecond ?s))
	)
    :effect 
	  (and (asigned ?d ?f ?s)
      (and(repetidoFirst ?f)
      (repetidoSecond ?s)))
  )
)