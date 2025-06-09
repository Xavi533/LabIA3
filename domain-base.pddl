(define (domain ricorico-base)
  (:requirements :strips :typing)

  (:types 
    plato - object
    primero segundo - plato
    dia - object
  )

  (:predicates
    ; Indica que un primero y segundo son incompatibles
    (incompatible ?p - primero ?s - segundo)
    
    ; Control para saber si un día tiene menú completo
    (dia-asignado ?d - dia)
    
    ; Control para marcar que un día necesita menú
    (dia-sin-menu ?d - dia)
  )

  ; Acción para asignar un menú completo a un día
  (:action asignar-menu
    :parameters (?d - dia ?p - primero ?s - segundo)
    :precondition (and
      ; El día necesita menú
      (dia-sin-menu ?d)
      
      ; El primero y segundo deben ser compatibles
      (not (incompatible ?p ?s))
    )
    :effect (and
      
      ; Marcar el día como asignado
      (dia-asignado ?d)
      
      ; El día ya no necesita menú
      (not (dia-sin-menu ?d))
    )
  )
)