(define (domain ricorico-ext5)
  (:requirements :strips :typing :fluents)

  (:types 
    plato - object
    primero segundo - plato
    dia - object
    tipo-plato - object
  )

  (:constants
    paella - primero
    jueves - dia
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
  )

  (:functions
    ; Funciones para calorías
    (calorias-primero ?p - primero)
    (calorias-segundo ?s - segundo)
    (calorias-dia ?d - dia)
    
    ; NUEVO: Funciones para precio
    (precio-primero ?p - primero)
    (precio-segundo ?s - segundo)
    (total-cost)
  )

  ; Acción especial para paella los jueves
  (:action asignar-paella-jueves
    :parameters (?s - segundo ?tp - tipo-plato ?ts - tipo-plato ?d-anterior - dia)
    :precondition (and
      (dia-sin-menu jueves)
      (not (incompatible paella ?s))
      (not (primero-usado paella))
      (not (segundo-usado ?s))
      (es-tipo-primero paella ?tp)
      (es-tipo-segundo ?s ?ts)
      
      ; Verificar día anterior
      (siguiente-dia ?d-anterior jueves)
      (not (dia-tiene-tipo-primero ?d-anterior ?tp))
      (not (dia-tiene-tipo-segundo ?d-anterior ?ts))
      
      ; Verificar calorías
      (>= (+ (calorias-primero paella) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero paella) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-tiene-primero jueves paella)
      (dia-tiene-segundo jueves ?s)
      (dia-asignado jueves)
      (not (dia-sin-menu jueves))
      (primero-usado paella)
      (segundo-usado ?s)
      (dia-tiene-tipo-primero jueves ?tp)
      (dia-tiene-tipo-segundo jueves ?ts)
      (increase (calorias-dia jueves) 
                (+ (calorias-primero paella) (calorias-segundo ?s)))
      ; NUEVO: Añadir coste
      (increase (total-cost) 
                (+ (precio-primero paella) (precio-segundo ?s)))
    )
  )

  ; Acción genérica con control de calorías y precio
  (:action asignar-menu
    :parameters (?d - dia ?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato ?d-anterior - dia)
    :precondition (and
      (not (= ?d jueves))
      (dia-sin-menu ?d)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      
      ; Verificar día anterior
      (or
        (not (siguiente-dia ?d-anterior ?d))
        (and
          (siguiente-dia ?d-anterior ?d)
          (not (dia-tiene-tipo-primero ?d-anterior ?tp))
          (not (dia-tiene-tipo-segundo ?d-anterior ?ts))
        )
      )
      
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
      (increase (calorias-dia ?d) 
                (+ (calorias-primero ?p) (calorias-segundo ?s)))
      ; NUEVO: Añadir coste
      (increase (total-cost) 
                (+ (precio-primero ?p) (precio-segundo ?s)))
    )
  )
)