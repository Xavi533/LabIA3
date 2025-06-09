(define (problem ricorico-base-joc2)
  (:domain ricorico-base)
  
  (:objects
    ; Platos primeros disponibles (conjunto diferente)
    crema-calabaza lentejas-estofadas arroz-tres-delicias  - primero
    
    ; Platos segundos disponibles (conjunto diferente)
    bacalao-horno albondigas-salsa pechuga-plancha  - segundo
    
    ; Días laborables de la semana
    lunes martes miercoles jueves viernes - dia
  )
  
  (:init
    ; Todos los días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    (incompatible crema-calabaza bacalao-horno)
    (incompatible crema-calabaza albondigas-salsa)

    (incompatible lentejas-estofadas bacalao-horno)
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible lentejas-estofadas pechuga-plancha)

    (incompatible arroz-tres-delicias pechuga-plancha)
    (incompatible arroz-tres-delicias bacalao-horno)
    (incompatible arroz-tres-delicias albondigas-salsa)
  )

  (:goal 
    (and
      ; Todos los días deben tener menú asignado
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)