(define (domain ricorico-ext3)
  (:requirements :strips :typing)

  (:types 
    plato - object
    primero segundo - plato
    dia - object
    tipo-plato - object
  )

  (:predicates
    ; Predicados básicos
    (incompatible ?p - primero ?s - segundo)
    (dia-tiene-primero ?d - dia ?p - primero)
    (dia-tiene-segundo ?d - dia ?s - segundo)
    (dia-asignado ?d - dia)
    (dia-sin-menu ?d - dia)
    
    ; Control de uso de platos
    (primero-usado ?p - primero)
    (segundo-usado ?s - segundo)
    
    ; Tipos de plato
    (es-tipo-primero ?p - primero ?t - tipo-plato)
    (es-tipo-segundo ?s - segundo ?t - tipo-plato)
    
    ; Control de tipos por día
    (dia-tiene-tipo-primero ?d - dia ?t - tipo-plato)
    (dia-tiene-tipo-segundo ?d - dia ?t - tipo-plato)
    
    ; Orden de días
    (siguiente-dia ?d1 - dia ?d2 - dia)
    (primer-dia ?d - dia)

    ; NUEVO: Plato concreto en un dia concreto
    (primero-en-dia ?d - dia ?p - primero)
    (segundo-en-dia ?d - dia ?s - segundo)
  )
  (:action asignar-dia-concreto-primero
    :parameters (?d - dia ?p - primero)
  )

  (:action asignar-dia-concreto-segundo
    :parameters (?d - dia ?s - segundo)
    :precondition (and
	  (dia-sin-menu ?d)
	  (primero-en-dia ?d ?p)
	  (segundo-en-dia ?d ?s)
	)
  )
     ; Acción genérica que funciona para cualquier día
  (:action asignar-menu-primer-dia
    :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      ; Condiciones básicas
      (dia-sin-menu ?d)
      (primer-dia ?d)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      
      ; El plato tiene los tipos correctos
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
    )
    :effect (and
      ; Efectos básicos
      (dia-tiene-primero ?d ?p)
      (dia-tiene-segundo ?d ?s)
      (dia-asignado ?d)
      (not (dia-sin-menu ?d))
      
      ; Marcar platos como usados
      (primero-usado ?p)
      (segundo-usado ?s)
      
      ; Registrar tipos del día
      (dia-tiene-tipo-primero ?d ?tp)
      (dia-tiene-tipo-segundo ?d ?ts)
    )
  )

  ; Acción genérica para otros días
  (:action asignar-menu
    :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato ?d-anterior - dia)
    :precondition (and
      
      ; Condiciones básicas
      (dia-sin-menu ?d)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      
      ; Tipos correctos
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      
      ; Verificar día anterior
     (and
          (siguiente-dia ?d-anterior ?d)
          (not (dia-tiene-tipo-primero ?d-anterior ?tp))
          (not (dia-tiene-tipo-segundo ?d-anterior ?tp))
          (not (dia-tiene-tipo-primero ?d-anterior ?ts))
          (not (dia-tiene-tipo-segundo ?d-anterior ?ts))
        )
    )
    :effect (and
      (dia-tiene-primero ?d ?p)
      (dia-tiene-segundo ?d ?s)
      (dia-asignado ?d)
      (not (dia-sin-menu ?d))
      (primero-usado ?p)
      (segundo-usado ?s)
      (dia-tiene-tipo-primero ?d ?tp)
      (dia-tiene-tipo-segundo ?d ?ts)
    )
  )
)