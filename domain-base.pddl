(define (domain ricorico-base)
  (:requirements :strips :typing :universal-preconditions)

  (:types first second day)

  (:predicates
    (incompatible ?f - first ?s - second)
    (asigned ?d - day ?f - first ?s - second)
  )

  (:action asignar_menu
    :parameters (?d - day ?f - first ?s - second)
    :precondition (and
	  (not (incompatible ?f ?s))
	  (not (asigned ?d ?f ?s))
	)
    :effect 
	  (asigned ?d ?f ?s)
  )
)