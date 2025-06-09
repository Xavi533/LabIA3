(define (domain ricorico-ext1)
  (:requirements :strips :typing)

  (:types 
    plato - object
    primero segundo - plato
    dia - object
  )

  (:predicates
    ; Predicados del nivel básico
    (incompatible ?p - primero ?s - segundo)
    (dia-asignado ?d - dia)
    (dia-sin-menu ?d - dia)
    
    ; NUEVO: Control de platos usados
    (primero-usado ?p - primero)
    (segundo-usado ?s - segundo)
  )

  ; Acción modificada para marcar platos como usados
  (:action asignar-menu
    :parameters (?d - dia ?p - primero ?s - segundo)
    :precondition (and
      ; Condiciones del nivel básico
      (dia-sin-menu ?d)
      (not (incompatible ?p ?s))
      
      ; NUEVO: Los platos no deben estar usados
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
    )
    :effect (and
      ; Efectos del nivel básico
      (dia-asignado ?d)
      (not (dia-sin-menu ?d))
      
      ; NUEVO: Marcar platos como usados
      (primero-usado ?p)
      (segundo-usado ?s)
    )
  )
)