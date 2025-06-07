(define (domain ricorico-ext4)
  (:requirements :strips :typing :fluents)

  (:types 
    plato - object
    primero segundo - plato
    tipo-plato - object
  )

  (:predicates
    ; Predicados básicos
    (incompatible ?p - primero ?s - segundo)
    
    ; Control de uso de platos
    (primero-usado ?p - primero)
    (segundo-usado ?s - segundo)
    
    ; Tipos de plato
    (es-tipo-primero ?p - primero ?t - tipo-plato)
    (es-tipo-segundo ?s - segundo ?t - tipo-plato)
    
    ; Control por día
    (dia-sin-menu-lunes)
    (dia-sin-menu-martes)
    (dia-sin-menu-miercoles)
    (dia-sin-menu-jueves)
    (dia-sin-menu-viernes)
    
    (dia-asignado-lunes)
    (dia-asignado-martes)
    (dia-asignado-miercoles)
    (dia-asignado-jueves)
    (dia-asignado-viernes)
    
    ; Tipos asignados por día
    (lunes-tiene-tipo-primero ?t - tipo-plato)
    (lunes-tiene-tipo-segundo ?t - tipo-plato)
    (martes-tiene-tipo-primero ?t - tipo-plato)
    (martes-tiene-tipo-segundo ?t - tipo-plato)
    (miercoles-tiene-tipo-primero ?t - tipo-plato)
    (miercoles-tiene-tipo-segundo ?t - tipo-plato)
    (jueves-tiene-tipo-primero ?t - tipo-plato)
    (jueves-tiene-tipo-segundo ?t - tipo-plato)
    (viernes-tiene-tipo-primero ?t - tipo-plato)
    (viernes-tiene-tipo-segundo ?t - tipo-plato)
  )

  (:functions
    ; NUEVO: Funciones numéricas para calorías
    (calorias-primero ?p - primero)
    (calorias-segundo ?s - segundo)
    (calorias-dia-lunes)
    (calorias-dia-martes)
    (calorias-dia-miercoles)
    (calorias-dia-jueves)
    (calorias-dia-viernes)
  )

  ; Acciones modificadas para controlar calorías
  (:action asignar-menu-lunes
    :parameters (?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      (dia-sin-menu-lunes)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      ; NUEVO: Verificar rango de calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-asignado-lunes)
      (not (dia-sin-menu-lunes))
      (primero-usado ?p)
      (segundo-usado ?s)
      (lunes-tiene-tipo-primero ?tp)
      (lunes-tiene-tipo-segundo ?ts)
      ; NUEVO: Registrar calorías del día
      (increase (calorias-dia-lunes) (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )

  (:action asignar-menu-martes
    :parameters (?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      (dia-sin-menu-martes)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      (not (lunes-tiene-tipo-primero ?tp))
      (not (lunes-tiene-tipo-segundo ?ts))
      ; NUEVO: Verificar rango de calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-asignado-martes)
      (not (dia-sin-menu-martes))
      (primero-usado ?p)
      (segundo-usado ?s)
      (martes-tiene-tipo-primero ?tp)
      (martes-tiene-tipo-segundo ?ts)
      (increase (calorias-dia-martes) (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )

  (:action asignar-menu-miercoles
    :parameters (?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      (dia-sin-menu-miercoles)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      (not (martes-tiene-tipo-primero ?tp))
      (not (martes-tiene-tipo-segundo ?ts))
      ; NUEVO: Verificar rango de calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-asignado-miercoles)
      (not (dia-sin-menu-miercoles))
      (primero-usado ?p)
      (segundo-usado ?s)
      (miercoles-tiene-tipo-primero ?tp)
      (miercoles-tiene-tipo-segundo ?ts)
      (increase (calorias-dia-miercoles) (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )

  ; Acción especial para paella los jueves con control de calorías
  (:action asignar-paella-jueves
    :parameters (?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      (dia-sin-menu-jueves)
      (not (incompatible paella ?s))
      (not (primero-usado paella))
      (not (segundo-usado ?s))
      (es-tipo-primero paella ?tp)
      (es-tipo-segundo ?s ?ts)
      (not (miercoles-tiene-tipo-primero ?tp))
      (not (miercoles-tiene-tipo-segundo ?ts))
      ; NUEVO: Verificar rango de calorías
      (>= (+ (calorias-primero paella) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero paella) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-asignado-jueves)
      (not (dia-sin-menu-jueves))
      (primero-usado paella)
      (segundo-usado ?s)
      (jueves-tiene-tipo-primero ?tp)
      (jueves-tiene-tipo-segundo ?ts)
      (increase (calorias-dia-jueves) (+ (calorias-primero paella) (calorias-segundo ?s)))
    )
  )

  (:action asignar-menu-viernes
    :parameters (?p - primero ?s - segundo ?tp - tipo-plato ?ts - tipo-plato)
    :precondition (and
      (dia-sin-menu-viernes)
      (not (incompatible ?p ?s))
      (not (primero-usado ?p))
      (not (segundo-usado ?s))
      (es-tipo-primero ?p ?tp)
      (es-tipo-segundo ?s ?ts)
      (not (jueves-tiene-tipo-primero ?tp))
      (not (jueves-tiene-tipo-segundo ?ts))
      ; NUEVO: Verificar rango de calorías
      (>= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1000)
      (<= (+ (calorias-primero ?p) (calorias-segundo ?s)) 1500)
    )
    :effect (and
      (dia-asignado-viernes)
      (not (dia-sin-menu-viernes))
      (primero-usado ?p)
      (segundo-usado ?s)
      (viernes-tiene-tipo-primero ?tp)
      (viernes-tiene-tipo-segundo ?ts)
      (increase (calorias-dia-viernes) (+ (calorias-primero ?p) (calorias-segundo ?s)))
    )
  )
)