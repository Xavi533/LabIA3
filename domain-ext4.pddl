(define (domain ricorico-ext4)
  (:requirements :strips :typing :fluents)

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

    ; Plato concreto en un dia concreto
    (primero-en-dia ?d - dia ?p - primero)
    (segundo-en-dia ?d - dia ?s - segundo)
  )

  (:functions
    ; Funciones para calorías
    (calorias-primero ?p - primero)
    (calorias-segundo ?s - segundo)
    (calorias-dia ?d - dia)  ; Más genérico que tener una función por día
  )


  (:action asignar-dia-concreto-primero
  :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
  :precondition (and
    (dia-sin-menu ?d)
    (primero-en-dia ?d ?p)
    (not (segundo-usado ?s))
    (not (incompatible ?p ?s))
    (es-tipo-primero ?p ?tp)
    (es-tipo-segundo ?s ?ts)

     ; Verificar calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
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

     ; NUEVO: Registrar calorías
      (increase (calorias-dia ?d) 
                (+ (calorias-primero ?p) (calorias-segundo ?s)))
  )
)

  (:action asignar-dia-concreto-segundo
  :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
  :precondition (and
    (dia-sin-menu ?d)
    (segundo-en-dia ?d ?s)
    (not (primero-usado ?p))
    (not (incompatible ?p ?s))
    (es-tipo-primero ?p ?tp)
    (es-tipo-segundo ?s ?ts)

     ; Verificar calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
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

     ; NUEVO: Registrar calorías
      (increase (calorias-dia ?d) 
                (+ (calorias-primero ?p) (calorias-segundo ?s)))
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

       ; Verificar calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
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

       ; NUEVO: Registrar calorías
      (increase (calorias-dia ?d) 
                (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )

  ; Acción genérica con control de calorías
  (:action asignar-menu
    :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato ?d-anterior - dia)
    :precondition (and
      (dia-sin-menu ?d)
      (dia-asignado ?d-anterior)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
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
      
      ; NUEVO: Verificar calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
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
      ; NUEVO: Registrar calorías
      (increase (calorias-dia ?d) 
                (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )
)