(define (domain ricorico-ext2)
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
    
    ; NUEVO: Control de tipos por día
    (dia-tiene-tipo-primero ?d - dia ?t - tipo-plato)
    (dia-tiene-tipo-segundo ?d - dia ?t - tipo-plato)
    
    ; NUEVO: Orden de días para controlar consecutivos
    (siguiente-dia ?d1 - dia ?d2 - dia)
    (primer-dia ?d - dia)
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
      
      ; NUEVO: Registrar tipos del día
      (dia-tiene-tipo-primero ?d ?tp)
      (dia-tiene-tipo-segundo ?d ?ts)
    )
  )

  ; Acción genérica que funciona para cualquier día
  (:action asignar-menu
    :parameters (?d-anterior - dia ?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato )
    :precondition (and
      ; Condiciones básicas
      (dia-sin-menu ?d)
      (dia-asignado ?d-anterior)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      
      ; El plato tiene los tipos correctos
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      
      ; NUEVO: Verificar día anterior (si existe)
        (and
          (siguiente-dia ?d-anterior ?d)
          (not (dia-tiene-tipo-primero ?d-anterior ?tp))
          (not (dia-tiene-tipo-segundo ?d-anterior ?tp))
          (not (dia-tiene-tipo-primero ?d-anterior ?ts))
          (not (dia-tiene-tipo-segundo ?d-anterior ?ts))
        )
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
      
      ; NUEVO: Registrar tipos del día
      (dia-tiene-tipo-primero ?d ?tp)
      (dia-tiene-tipo-segundo ?d ?ts)
    )
  )
)