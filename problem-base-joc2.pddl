(define (problem ricorico-base-joc2)
  (:domain ricorico-base)
  
  (:objects
    ; Platos primeros disponibles (conjunto diferente)
    crema-calabaza lentejas-estofadas arroz-tres-delicias fideos-marinera tortilla-patatas - primero
    
    ; Platos segundos disponibles (conjunto diferente)
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
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
    
    ; Incompatibilidades diferentes para probar otros escenarios
    ; Platos muy pesados no combinan
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible lentejas-estofadas cordero-asado)
    
    ; Frituras no combinan bien
    (incompatible tortilla-patatas calamar-romana)
    
    ; Fideos marinera (con marisco) no combina con carnes pesadas
    (incompatible fideos-marinera cordero-asado)
    (incompatible fideos-marinera albondigas-salsa)
    
    ; Crema suave no va bien con platos muy contundentes
    (incompatible crema-calabaza cordero-asado)
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